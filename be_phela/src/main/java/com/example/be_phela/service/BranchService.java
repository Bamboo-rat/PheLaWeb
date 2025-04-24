package com.example.be_phela.service;

import com.example.be_phela.exception.DuplicateResourceException;
import com.example.be_phela.exception.ResourceNotFoundException;
import com.example.be_phela.interService.IBranchService;
import com.example.be_phela.model.Branch;
import com.example.be_phela.repository.BranchRepository;
import jakarta.transaction.Transactional;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.DuplicateFormatFlagsException;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class BranchService implements IBranchService {

    BranchRepository branchRepository;

    @Override
    public Branch createBranch(Branch branch) {
        // Kiểm tra nếu branch đã tồn tại
        if (branchRepository.existsByBranchCode(branch.getBranchCode())) {
            throw new DuplicateResourceException("Chi nhánh đã tồn tại với mã: " + branch.getBranchCode());
        }
        return branchRepository.save(branch);
    }

    @Override
    public Page<Branch> getAllBranches(Pageable pageable) {
        log.info("Fetching all branches with pageable: page={}, size={}", pageable.getPageNumber(), pageable.getPageSize());
        return branchRepository.findAll(pageable);
    }
    @Override
    public Branch getBranchById(String branchCode) {
        Optional<Branch> branchOpt = branchRepository.findById(branchCode);
        return branchOpt.orElseThrow(() -> new ResourceNotFoundException("Không tìm thấy chi nhánh với mã: " + branchCode));
    }
    @Override
    @Transactional
    public Branch updateBranch(String branchCode, Branch updatedBranch) {
        log.info("Updating branch with code: {}", branchCode);
        Branch existingBranch = getBranchById(branchCode);
        existingBranch.setBranchName(updatedBranch.getBranchName());
        existingBranch.setLatitude(updatedBranch.getLatitude());
        existingBranch.setLongitude(updatedBranch.getLongitude());
        existingBranch.setCity(updatedBranch.getCity());
        existingBranch.setDistrict(updatedBranch.getDistrict());
        Branch savedBranch = branchRepository.save(existingBranch);
        log.info("Branch updated successfully with code: {}", savedBranch.getBranchCode());
        return savedBranch;
    }
    @Override
    @Transactional
    public void deleteBranch(String branchCode) {
        log.info("Deleting branch with code: {}", branchCode);
        Branch branch = getBranchById(branchCode);
        branchRepository.delete(branch);
        log.info("Branch deleted successfully with code: {}", branchCode);
    }
    @Override
    public List<Branch> findBranchesByCity(String city) {
        log.info("Fetching branches by city: {}", city);
        return branchRepository.findByCity(city);
    }
}
