package spring.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import spring.model.Service;

public interface ServiceRepository extends JpaRepository<Service, Integer> {
	Service findBySerName(String name);
	List<Service> findByCatSerIid(int id);
	
	@Modifying
	@Query("DELETE FROM Service service WHERE service.id in ?1")
	@Transactional
	void delete(int id);
}
