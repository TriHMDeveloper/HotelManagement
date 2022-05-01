/*
 * @author Ha Minh Tri
 * @date Apr 10, 2021
 * @project MockProject
 */


package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.Customer;
import spring.model.RoomCategory;
import spring.repository.CustomerRepository;

@Service
public class CustomerServiceImp implements CustomerService {
	
	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public void addCustomer(Customer customer) {
		customerRepository.save(customer);
		
	}

	@Override
	public Customer findByCustomerIdentity(String identity) {
		// TODO Auto-generated method stub
		return customerRepository.findByIdentityNumber(identity);
	}

	@Override
	public boolean checkIdentityNumberExist(String number) {
		List<Customer> listcusCustomers = customerRepository.findAll();
		for (Customer customer : listcusCustomers) {
			if (customer.getIdentityNumber().equals(number)) {
				return true;
			}
		}
		return false;
	}

}
