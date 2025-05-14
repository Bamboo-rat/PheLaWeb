package com.example.be_phela.dto.request;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class CartItemRequestDTO {
    @Min(value = 1, message = "Quantity must be at least 1")
    private Integer quantity;
}
