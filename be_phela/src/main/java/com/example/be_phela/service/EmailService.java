package com.example.be_phela.service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Slf4j
@Service
public class EmailService {
    private final JavaMailSender mailSender;

    @Value("${app.base-url}")
    private String baseUrl;

    public EmailService(JavaMailSender mailSender, @Value("${app.base-url}") String baseUrl) {
        this.mailSender = mailSender;
        this.baseUrl = baseUrl;
    }

    public void sendVerificationEmail(String email, String token) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setTo(email);
        helper.setSubject("Xác nhận đăng ký tài khoản");
//        String encodedToken = URLEncoder.encode(token, StandardCharsets.UTF_8);
//        String verificationLink = baseUrl + "/verify?token=" + encodedToken;
        String verificationLink = baseUrl + "/verify?token=" + token;
        String htmlContent = "<h3>Phê La xin chào,</h3>" +
                "<p>Vui lòng nhấp vào liên kết bên dưới để xác nhận đăng ký tài khoản:</p>" +
                "<a href=\"" + verificationLink + "\">Xác nhận tài khoản</a>" +
                "<p>Liên kết này sẽ hết hạn sau 24 giờ.</p>";
        helper.setText(htmlContent, true);

        log.info("Sending verification email to: {}", email);
        mailSender.send(message);
        log.info("Verification email sent successfully to: {}", email);
    }
}
