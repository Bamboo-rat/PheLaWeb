package com.example.be_phela.service;

import com.example.be_phela.dto.request.AuthenticationRequest;
import com.example.be_phela.dto.request.AdminCreateDTO;
import com.example.be_phela.dto.request.CustomerCreateDTO;
import com.example.be_phela.dto.response.AuthenticationResponse;
import com.example.be_phela.mapper.AdminMapperImpl;
import com.example.be_phela.model.Admin;
import com.example.be_phela.model.Customer;
import com.example.be_phela.model.VerificationToken;
import com.example.be_phela.model.enums.Roles;
import com.example.be_phela.repository.AdminRepository;
import com.example.be_phela.repository.CustomerRepository;
import com.example.be_phela.repository.VerificationTokenRepository;
import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jwt.JWTClaimsSet;
import jakarta.mail.MessagingException;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AuthenticationService {

    final AdminService adminService;
    final CustomerService customerService;
    final AuthenticationManager authenticationManager;
    final VerificationTokenRepository verificationTokenRepository;
    final EmailService emailService;
    private final AdminMapperImpl adminMapperImpl;

    @Value("${jwt.signer-key}")
    @NonFinal
    String signerKey;

    @Value("${jwt.expiration-hours:18}")
    @NonFinal
    long jwtExpirationHours;

    // Đăng ký admin
    public AuthenticationResponse registerAdmin(AdminCreateDTO request, String clientIp) throws MessagingException {
        Admin admin = adminService.createAdmin(request, clientIp);
        // Tạo và lưu token xác thực
        String token = UUID.randomUUID().toString();
        VerificationToken verificationToken = VerificationToken.builder()
                .token(token)
                .admin(admin)
                .customer(null)
                .expiryDate(LocalDateTime.now().plusHours(24)) // Hết hạn sau 24 giờ
                .build();
        verificationTokenRepository.save(verificationToken);

        // Gửi email xác nhận
        emailService.sendVerificationEmail(admin.getEmail(), token);

        return buildResponse(admin.getUsername(), admin.getRole().name());
    }

    // Đăng ký customer
    public AuthenticationResponse registerCustomer(CustomerCreateDTO request) throws MessagingException{
        Customer customer = customerService.createCustomer(request);

        // Tạo và lưu token xác thực
        String token = UUID.randomUUID().toString();
        VerificationToken verificationToken = VerificationToken.builder()
                .token(token)
                .admin(null)
                .customer(customer)
                .expiryDate(LocalDateTime.now().plusHours(24)) // Hết hạn sau 24 giờ
                .build();
        verificationTokenRepository.save(verificationToken);

        // Gửi email xác nhận
        emailService.sendVerificationEmail(customer.getEmail(), token);

        return buildResponse(customer.getUsername(), customer.getRole().name());
    }

    // Đăng nhập Admin
    public AuthenticationResponse loginAdmin(AuthenticationRequest request) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword())
        );
        SecurityContextHolder.getContext().setAuthentication(authentication);
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        return createResponseFromUserDetails(userDetails);
    }

    // Đăng nhập Customer
    public AuthenticationResponse loginCustomer(AuthenticationRequest request) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword())
        );
        SecurityContextHolder.getContext().setAuthentication(authentication);
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        return createResponseFromUserDetails(userDetails);
    }

    // Tạo response từ UserDetails (dùng cho mục đích xác thực chung)
    public AuthenticationResponse createResponseFromUserDetails(UserDetails userDetails) {
        LocalDateTime expiresAt = LocalDateTime.now().plusHours(jwtExpirationHours);
        String jwtToken = generateToken(userDetails.getUsername(), extractRole(userDetails));
        String username = userDetails.getUsername();

        if (userDetails instanceof Customer customer) {
            return new AuthenticationResponse(jwtToken, true, username, "CUSTOMER",expiresAt);
        } else if (userDetails instanceof Admin admin) {
            Roles role = admin.getRole();
            return new AuthenticationResponse(jwtToken, true, username, role.name(),expiresAt);
        }

        throw new RuntimeException("UserDetails không hợp lệ để tạo AuthenticationResponse.");
    }

    // Hàm sinh token và build AuthenticationResponse
    private AuthenticationResponse buildResponse(String username, String role) {
        String token = generateToken(username, role);
        log.info("Đăng nhập thành công: username={}, role={}", username, role);
        return AuthenticationResponse.builder()
                .token(token)
                .authenticated(true)
                .username(username)
                .role(role)
                .build();
    }

    // Sinh JWT token
    private String generateToken(String username, String role) {
        JWSHeader header = new JWSHeader(JWSAlgorithm.HS512);
        JWTClaimsSet jwtClaimsSet = new JWTClaimsSet.Builder()
                .subject(username)
                .issuer("/")
                .issueTime(new Date())
                .expirationTime(Date.from(Instant.now().plus(18, ChronoUnit.HOURS)))
                .claim("role", role)
                .build();

        JWSObject jwsObject = new JWSObject(header, new Payload(jwtClaimsSet.toJSONObject()));

        try {
            jwsObject.sign(new MACSigner(signerKey.getBytes()));
            return jwsObject.serialize();
        } catch (JOSEException e) {
            log.error("Không thể tạo token", e);
            throw new RuntimeException("Không thể tạo token", e);
        }
    }

    // Lấy role từ UserDetails (nếu cần dùng thêm)
    private String extractRole(UserDetails userDetails) {
        return userDetails.getAuthorities().stream()
                .findFirst()
                .map(grantedAuthority -> grantedAuthority.getAuthority().replace("ROLE_", ""))
                .orElse("UNKNOWN");
    }
}