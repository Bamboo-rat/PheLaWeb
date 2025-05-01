package com.example.be_phela.dto.request;

import jakarta.persistence.Column;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BranchCreateDTO {
    @NonNull
    private String branchName;
    @NonNull
    private Double latitude;
    @NonNull
    private Double longitude;
    @NonNull
    private String city;
    @NonNull
    private String district;
}
