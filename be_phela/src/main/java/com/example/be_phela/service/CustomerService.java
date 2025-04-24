package com.example.be_phela.service;

import com.example.be_phela.dto.request.CustomerCreateDTO;
import com.example.be_phela.dto.response.AdminResponseDTO;
import com.example.be_phela.dto.response.CustomerResponseDTO;
import com.example.be_phela.exception.DuplicateResourceException;
import com.example.be_phela.interService.ICustomerService;
import com.example.be_phela.mapper.CustomerMapper;
import com.example.be_phela.model.Customer;
import com.example.be_phela.model.enums.Roles;
import com.example.be_phela.model.enums.Status;
import com.example.be_phela.repository.CustomerRepository;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CustomerService implements ICustomerService {
    CustomerRepository customerRepository;
    CustomerMapper customerMapper;;
    BCryptPasswordEncoder passwordEncoder;

    public String generateCustomerCode() {
        long count = customerRepository.count(); // Đếm số lượng Customer hiện có
        return String.format("KH%06d", count + 1); // Ví dụ: ADM00001, ADM00002
    }

    @Override
    @Transactional
    public Customer createCustomer(@Valid CustomerCreateDTO customerCreateDTO) {
        if (customerRepository.existsByUsername(customerCreateDTO.getUsername())) {
            throw new DuplicateResourceException("Tên người dùng đã tồn tại");
        }
        if (customerRepository.existsByEmail(customerCreateDTO.getEmail())) {
            throw new DuplicateResourceException("Email đã tồn tại");
        }
        Customer customer = customerMapper.toCustomer(customerCreateDTO);
        customer.setCustomerCode(generateCustomerCode());
        customer.setPassword(passwordEncoder.encode(customer.getPassword()));
        customer.setStatus(Status.PENDING);
        customer.setRole(Roles.CUSTOMER);

        return customerRepository.save(customer);
    }


    @Override
    public Page<CustomerResponseDTO> getAllCustomers(Pageable pageable) {
        return customerRepository.findAll(pageable)
                .map(customerMapper::toCustomerResponseDTO);
    }
}
