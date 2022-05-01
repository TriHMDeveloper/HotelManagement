/*
 * @author Ha Minh Tri
 * @date Mar 31, 2021
 * @project MockProject
 */


package spring.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import spring.model.Book_Service;

public interface BookingServiceRepository extends JpaRepository<Book_Service, Integer> {
	List<Book_Service> findByBookingId(int id);
	
	@Modifying
	@Query("Delete from Book_Service bs Where bs.bookingId = :bookingId and bs.serviceId = :serviceId")
	@Transactional
	void deleteOrderedService(@Param("bookingId") int bookingId,@Param("serviceId") int serviceId);
	
	boolean deleteByBookingIdAndServiceId(int bookingId, int serviceId);
}
