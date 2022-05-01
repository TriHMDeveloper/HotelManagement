

package spring.service;

import java.text.ParseException;
import java.util.List;

import spring.model.Account;
import spring.model.Account_roles;

public interface AccountService {
	void addUser(Account account);
	void addRole(Account_roles account_roles);
	boolean updateUser(Account account);
	boolean deleteUser(int id);
	
	Account findByUsername(String userName);
	Account findByIdentityNumber(String idNumber);
	Account findByPhone(String phone);
	Account findByEmail(String email);
	List<Account> findAllStaff();
	java.sql.Date convertDate(String string) throws ParseException;
}
