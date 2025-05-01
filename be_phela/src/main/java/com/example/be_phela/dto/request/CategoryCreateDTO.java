package com.example.be_phela.dto.request;

import jakarta.persistence.Column;
import jakarta.validation.constraints.NotBlank;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CategoryCreateDTO {
    @NotBlank(message = "Category name is required")
    private String categoryName;

    @NonNull
    private String description;
}
