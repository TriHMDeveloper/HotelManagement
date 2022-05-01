/*
 * @author Ha Minh Tri
 * @date Apr 10, 2021
 * @project MockProject
 */


package spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import spring.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
	Customer findByIdentityNumber(String name);
	
	
}
