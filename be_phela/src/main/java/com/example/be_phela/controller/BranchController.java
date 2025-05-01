package com.example.be_phela.controller;

import com.example.be_phela.exception.DuplicateResourceException;
import com.example.be_phela.exception.ResourceNotFoundException;
import com.example.be_phela.model.Branch;
import com.example.be_phela.service.BranchService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/admin/branch")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class BranchController {
    BranchService branchService;

    @PostMapping("creatnew")
    public ResponseEntity<Branch> createBranch(@RequestBody Branch branch) {
        try {
            Branch createdBranch = branchService.createBranch(branch);
            return ResponseEntity.ok(createdBranch);
        } catch (DuplicateResourceException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @GetMapping
    public ResponseEntity<List<Branch>> getAllBranches(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Branch> branchPage = branchService.getAllBranches(pageable); // Cần sửa service
        return ResponseEntity.ok(branchPage.getContent());
    }

    @GetMapping("/{branchCode}")
    public ResponseEntity<Branch> getBranchById(@PathVariable String branchCode) {
        try {
            Branch branch = branchService.getBranchById(branchCode);
            return ResponseEntity.ok(branch);
        } catch (ResourceNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }
    @PutMapping("/{branchCode}")
    public ResponseEntity<Branch> updateBranch(@PathVariable String branchCode, @RequestBody Branch branch) {
        try {
            Branch updatedBranch = branchService.updateBranch(branchCode, branch);
            return ResponseEntity.ok(updatedBranch);
        } catch (ResourceNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }
    @DeleteMapping("/{branchCode}")
    public ResponseEntity<Void> deleteBranch(@PathVariable String branchCode) {
        try {
            branchService.deleteBranch(branchCode);
            return ResponseEntity.noContent().build();
        } catch (ResourceNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }
    @GetMapping("/by-city")
    public ResponseEntity<List<Branch>> findBranchesByCity(@RequestParam String city) {
        List<Branch> branches = branchService.findBranchesByCity(city);
        return ResponseEntity.ok(branches);
    }
}
