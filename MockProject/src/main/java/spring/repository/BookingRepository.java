/*
 * @author Ha Minh Tri
 * @date Mar 31, 2021
 * @project MockProject
 */


package spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import spring.model.Booking;

public interface BookingRepository extends JpaRepository<Booking, Integer> {
	
	@Query("Select b From Booking b Where Year(b.endDate) = ?1")
	List<Booking> findAllByYear(int year);
}
