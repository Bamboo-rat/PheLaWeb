package com.example.be_phela.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.annotations.UuidGenerator;

import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity(name = "category")
public class Category {
    @Id
    @UuidGenerator
    @Column(name = "category_id", nullable = false, unique = true)
    private String categoryId;

    @NotBlank(message = "Category code is required")
    @Column(name = "category_code", nullable = false, unique = true)
    private String categoryCode;

    @NotBlank(message = "Category name is required")
    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "description")
    private String description;
    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Product> products;
}
