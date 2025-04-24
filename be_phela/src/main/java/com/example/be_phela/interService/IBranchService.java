package com.example.be_phela.interService;

import com.example.be_phela.model.Branch;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IBranchService {
    Branch createBranch(Branch branch);
    public Page<Branch> getAllBranches(Pageable pageable);
    Branch getBranchById(String branchCode);
    Branch updateBranch(String branchCode, Branch updatedBranch);
    void deleteBranch(String branchCode);
    List<Branch> findBranchesByCity(String city);
}
