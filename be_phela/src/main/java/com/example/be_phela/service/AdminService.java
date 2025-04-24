package com.example.be_phela.service;

import com.example.be_phela.dto.request.AdminCreateDTO;
import com.example.be_phela.dto.response.AdminResponseDTO;
import com.example.be_phela.exception.DuplicateResourceException;
import com.example.be_phela.interService.IAdminService;
import com.example.be_phela.mapper.AdminMapper;
import com.example.be_phela.model.Admin;
import com.example.be_phela.model.enums.Roles;
import com.example.be_phela.model.enums.Status;
import com.example.be_phela.repository.AdminRepository;
import com.example.be_phela.repository.BranchRepository;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class    AdminService implements IAdminService {

    AdminRepository adminRepository;
    BranchRepository branchRepository;
    BCryptPasswordEncoder passwordEncoder;
    AdminMapper adminMapper;

    @Override
    public String generateEmployCode() {
        long count = adminRepository.count(); // Đếm số lượng Admin hiện có
        return String.format("PLB%05d", count + 1); // Ví dụ: ADM00001, ADM00002
    }

    @Override
    @Transactional
    public Admin createAdmin(@Valid AdminCreateDTO adminCreateDTO, String ip) {

        if (adminRepository.existsByUsername(adminCreateDTO.getUsername())) {
            throw new DuplicateResourceException("Admin username already exists");
        }
        if (adminRepository.existsByEmail(adminCreateDTO.getEmail())) {
            throw new DuplicateResourceException("Admin email already exists");
        }
        Admin admin = adminMapper.toAdmin(adminCreateDTO);
        admin.setEmployCode(generateEmployCode());
        admin.setPassword(passwordEncoder.encode(admin.getPassword())); // Mã hóa mật khẩu
        admin.setRole(Roles.STAFF); // Vai trò mặc định
        admin.setStatus(Status.PENDING); // Trạng thái mặc định
        admin.setLastLoginIp(ip);

//        // Tìm Branch
//        Branch defaultBranch = branchRepository.findById("DEFAULT_BRANCH_CODE")
//                .orElseThrow(() -> new RuntimeException("Chi nhánh mặc định không tồn tại"));
//        admin.setBranch(defaultBranch);

        return adminRepository.save(admin);
    }

    @Override
    public Page<AdminResponseDTO> getAllAdmins(Pageable pageable) {
        return adminRepository.findAll(pageable)
                .map(adminMapper::toAdminResponseDTO);
    }
}
