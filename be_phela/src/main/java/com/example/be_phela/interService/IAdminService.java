package com.example.be_phela.interService;

import com.example.be_phela.dto.request.AdminCreateDTO;
import com.example.be_phela.dto.request.CustomerCreateDTO;
import com.example.be_phela.dto.response.AdminResponseDTO;
import com.example.be_phela.model.Admin;
import com.example.be_phela.model.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IAdminService {
    String generateEmployCode();
    Admin createAdmin(AdminCreateDTO adminCreateDTO, String ip);
    Page<AdminResponseDTO> getAllAdmins(Pageable pageable);
}
