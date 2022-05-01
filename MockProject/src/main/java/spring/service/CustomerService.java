/*
 * @author Ha Minh Tri
 * @date Apr 10, 2021
 * @project MockProject
 */


package spring.service;

import spring.model.Customer;

public interface CustomerService {
	void addCustomer(Customer customer);
	Customer findByCustomerIdentity(String name);
	boolean checkIdentityNumberExist(String number);
}
