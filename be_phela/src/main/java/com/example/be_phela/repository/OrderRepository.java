package com.example.be_phela.repository;

import com.example.be_phela.model.Order;
import com.example.be_phela.model.enums.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, String> {

    List<Order> findByCustomer_CustomerId(String customerId);
    Optional<Order> findByOrderCode(String orderCode);

    // Tìm các đơn hàng theo một trạng thái cụ thể
    List<Order> findByStatus(OrderStatus status);

    // Thống kê số lượng đơn hàng theo từng trạng thái
    @Query("SELECT o.status, COUNT(o) FROM Order o GROUP BY o.status")
    List<Object[]> countOrdersByStatus();

    // Thống kê doanh thu và số lượng đơn hàng trong một khoảng thời gian
    @Query("SELECT FUNCTION('DATE', o.orderDate) AS order_date, SUM(o.finalAmount) AS daily_revenue, COUNT(o) AS order_count " +
            "FROM Order o WHERE o.orderDate BETWEEN :startDate AND :endDate AND o.status = :status " +
            "GROUP BY FUNCTION('DATE', o.orderDate) ORDER BY FUNCTION('DATE', o.orderDate)")
    List<Object[]> findRevenueAndOrderCountByDateRange(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate,
            @Param("status") OrderStatus status
    );

    // Đếm tổng số đơn và số đơn đã hủy trong khoảng thời gian
    @Query("SELECT COUNT(o), SUM(CASE WHEN o.status = 'CANCELLED' THEN 1 ELSE 0 END) FROM Order o WHERE o.orderDate BETWEEN :startDate AND :endDate")
    List<Object[]> countTotalAndCancelledOrdersByDateRange(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);
}
