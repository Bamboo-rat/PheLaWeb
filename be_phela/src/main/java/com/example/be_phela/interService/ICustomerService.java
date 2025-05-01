package com.example.be_phela.interService;

import com.example.be_phela.dto.request.CustomerCreateDTO;
import com.example.be_phela.dto.response.CustomerResponseDTO;
import com.example.be_phela.model.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;
import java.util.Optional;

public interface ICustomerService {
    public String generateCustomerCode();
    Customer buildCustomer(CustomerCreateDTO customerCreateDTO);
    Page<CustomerResponseDTO> getAllCustomers(Pageable pageable);
    Customer findAdminByUsername(String username);
}
