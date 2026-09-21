package com.example.be_phela.service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class EmailService {

    private final JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    @Value("${app.base-url}")
    private String baseUrl;

    public void sendVerificationEmail(String to, String token) {
        String verificationLink = baseUrl + "/verify?token=" + token;

        String htmlContent = "<!DOCTYPE html>"
                + "<html lang='vi'>"
                + "<head>"
                + "    <style>"
                + "        body { font-family: 'Arial', sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; padding: 20px; }"
                + "        .header { text-align: center; padding: 20px 0; background-color: #6F4E37; color: white; border-radius: 8px 8px 0 0; }"
                + "        .content { padding: 20px; background-color: #f9f9f9; border-radius: 0 0 8px 8px; }"
                + "        .button { display: inline-block; padding: 12px 24px; background-color: #6F4E37; color: white !important; text-decoration: none; border-radius: 4px; font-weight: bold; margin: 15px 0; }"
                + "        .footer { margin-top: 20px; font-size: 12px; color: #777; text-align: center; }"
                + "    </style>"
                + "</head>"
                + "<body>"
                + "    <div class='header'><h1>Chào mừng đến với Phê La</h1></div>"
                + "    <div class='content'>"
                + "        <p>Xin chào,</p>"
                + "        <p>Cảm ơn bạn đã đăng ký tài khoản tại Phê La. Vui lòng nhấp vào nút bên dưới để xác nhận địa chỉ email của bạn:</p>"
                + "        <p style='text-align: center;'><a href='" + verificationLink + "' class='button'>XÁC NHẬN EMAIL</a></p>"
                + "        <p>Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email này.</p>"
                + "        <p>Liên kết xác nhận sẽ hết hạn sau <strong>24 giờ</strong>.</p>"
                + "        <div class='footer'><p>Trân trọng,<br>Đội ngũ Phê La</p><p>© 2024 Phê La. All rights reserved.</p></div>"
                + "    </div>"
                + "</body>"
                + "</html>";

        sendEmail(to, "Xác nhận đăng ký tài khoản - Phê La", htmlContent);
    }

    public void sendOtpEmail(String to, String otp) {
        String htmlContent = "<!DOCTYPE html>"
                + "<html lang='vi'>"
                + "<head>"
                + "    <style>"
                + "        body { font-family: 'Arial', sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; padding: 20px; }"
                + "        .header { text-align: center; padding: 20px 0; background-color: #6F4E37; color: white; border-radius: 8px 8px 0 0; }"
                + "        .content { padding: 20px; background-color: #f9f9f9; border-radius: 0 0 8px 8px; }"
                + "        .otp-code { display: block; width: fit-content; margin: 20px auto; padding: 10px 20px; font-size: 24px; font-weight: bold; color: #6F4E37; border: 2px dashed #6F4E37; border-radius: 5px; text-align: center; }"
                + "        .footer { margin-top: 20px; font-size: 12px; color: #777; text-align: center; }"
                + "    </style>"
                + "</head>"
                + "<body>"
                + "    <div class='header'><h1>Đặt lại mật khẩu Phê La</h1></div>"
                + "    <div class='content'>"
                + "        <p>Xin chào,</p>"
                + "        <p>Bạn đã yêu cầu đặt lại mật khẩu cho tài khoản của mình. Vui lòng sử dụng mã OTP sau để tiếp tục:</p>"
                + "        <p class='otp-code'>" + otp + "</p>"
                + "        <p>Mã này sẽ hết hạn sau <strong>10 phút</strong>. Vui lòng không chia sẻ mã này với bất kỳ ai.</p>"
                + "        <p>Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.</p>"
                + "        <div class='footer'><p>Trân trọng,<br>Đội ngũ Phê La</p><p>© 2024 Phê La. All rights reserved.</p></div>"
                + "    </div>"
                + "</body>"
                + "</html>";

        sendEmail(to, "Mã OTP đặt lại mật khẩu - Phê La", htmlContent);
    }

    private void sendEmail(String to, String subject, String htmlContent) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom(fromEmail);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(htmlContent, true); // true = HTML

            log.info("Sending email via Spring Mail (Gmail SMTP) to: {}", to);
            mailSender.send(message);
            log.info("Email sent successfully to: {}", to);

        } catch (MessagingException ex) {
            log.error("Error sending email to {}", to, ex);
            throw new RuntimeException("Error sending email", ex);
        }
    }
}