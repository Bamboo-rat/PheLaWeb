package com.example.be_phela.controller;

import com.example.be_phela.dto.response.AdminResponseDTO;
import com.example.be_phela.dto.response.ApiResponse;
import com.example.be_phela.dto.response.CustomerResponseDTO;
import com.example.be_phela.model.Customer;
import com.example.be_phela.service.CustomerService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/api/customer")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CustomerController {
    CustomerService customerService;

    @GetMapping("/getAll")
    public ResponseEntity<Page<CustomerResponseDTO>> getAdmins(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "username") String sortBy
    ) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy));
        Page<CustomerResponseDTO> customerResponseDTOPage = customerService.getAllCustomers(pageable);
        return ResponseEntity.ok(customerResponseDTOPage);
    }

//    // Lấy thông tin user theo ID (có thể thêm sau)
//    @GetMapping("/getInfo/{id}")
//    public ResponseEntity<ApiResponse<Customer>> getUserById(@PathVariable String id) {
//        // TODO: Thêm logic lấy user theo ID
//        return new ResponseEntity<>(HttpStatus.NOT_IMPLEMENTED);
//    }
//
//    // Cập nhật thông tin user (có thể thêm sau)
//    @PutMapping("/update/{id}")
//    public ResponseEntity<ApiResponse<Customer>> updateUser(@PathVariable String id, @RequestBody Customer updateRequest) {
//        // TODO: Thêm logic cập nhật user
//        return new ResponseEntity<>(HttpStatus.NOT_IMPLEMENTED);
//    }
//
//    // Xóa user (có thể thêm sau)
//    @DeleteMapping("/delete/{id}")
//    public ResponseEntity<ApiResponse<Void>> deleteUser(@PathVariable String id) {
//        // TODO: Thêm logic xóa user
//        return new ResponseEntity<>(HttpStatus.NOT_IMPLEMENTED);
//    }
}

