package com.example.be_phela.dto.request;

import jakarta.persistence.Column;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductCreateDTO {

    private String productName;

    private String description;

    @NotNull
    private BigDecimal originalPrice;
    
    private String imageUrl;
}
