package com.example.be_phela.repository;

import com.example.be_phela.model.Branch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public interface BranchRepository extends JpaRepository<Branch, String> {
    Optional<Branch> findByBranchName(String branchName);
    Branch findByBranchCode(String branchCode);
    List<Branch> findAll();
    Boolean existsByBranchCode(String branchCode);
    List<Branch> findByCity(String city);
}
