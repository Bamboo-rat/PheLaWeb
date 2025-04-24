package com.example.be_phela.dto.request;

import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class CustomerUpdateDTO {
    @NotNull(message = "Tên khách hàng không được để trống")
    @NotBlank(message = "Tên khách hàng không được chứa toàn khoảng trắng")
    @Size(max = 100, message = "Tên không được vượt quá 100 ký tự")
    private String name;

    @NotNull(message = "Email không được để trống")
    @Email(message = "Email không hợp lệ")
    private String email;

}
