package com.example.be_phela.controller;

import com.example.be_phela.dto.response.AdminResponseDTO;
import com.example.be_phela.mapper.AdminMapper;
import com.example.be_phela.model.Admin;
import com.example.be_phela.service.AdminService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/admin")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AdminController {
    AdminService adminService;
    AdminMapper adminMapper;

    @GetMapping("/getAll")
    public ResponseEntity<Page<AdminResponseDTO>> getAdmins(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "username") String sortBy
    ) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy));
        Page<AdminResponseDTO> adminPage = adminService.getAllAdmins(pageable);
        return ResponseEntity.ok(adminPage);
    }

    @GetMapping("/{username}")
    public ResponseEntity<AdminResponseDTO> getAdminByUsername(@PathVariable String username) {
        Admin admin = adminService.findAdminByUsername(username);
        AdminResponseDTO responseDTO = adminMapper.toAdminResponseDTO(admin);
        return ResponseEntity.ok(responseDTO);
    }

}
