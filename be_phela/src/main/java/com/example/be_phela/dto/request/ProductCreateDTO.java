package com.example.be_phela.dto.request;

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

    private Double originalPrice;
    
    private String imageUrl;
}
