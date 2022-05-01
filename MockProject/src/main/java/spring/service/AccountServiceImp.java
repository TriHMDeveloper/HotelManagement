/*
 * @author Ha Minh Tri
 * @date Mar 12, 2021
 * @project JSFW.L.A101
 */

package spring.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import spring.model.Account;
import spring.model.Account_roles;
import spring.repository.AccountRepository;
import spring.repository.AccountRolesRepository;

@Service
public class AccountServiceImp implements AccountService {

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private AccountRolesRepository accountRolesRepository;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public void addUser(Account account) {
		account.setPassword(passwordEncoder.encode(account.getPassword()));
		accountRepository.save(account);

	}

	@Override
	public void addRole(Account_roles account_roles) {
		accountRolesRepository.save(account_roles);

	}

	@Override
	public Account findByUsername(String userName) {
		return accountRepository.findOneByUsername(userName);
	}

	@Override
	public Account findByIdentityNumber(String idNumber) {
		// TODO Auto-generated method stub
		return accountRepository.findByIdenityNumber(idNumber);
	}

	@Override
	public Account findByPhone(String phone) {
		// TODO Auto-generated method stub
		return accountRepository.findByPhone(phone);
	}

	@Override
	public Account findByEmail(String email) {
		// TODO Auto-generated method stub
		return accountRepository.findByEmail(email);
	}

	@Override
	public List<Account> findAllStaff() {
		// TODO Auto-generated method stub
		return accountRepository.findAll();
	}

	@Override
	public java.sql.Date convertDate(String string) throws ParseException {
		java.util.Date uDate = new SimpleDateFormat("yyyy-mm-dd").parse(string);
		java.sql.Date sDate = convertUtilToSql(uDate);
		return sDate;
	} 

	private static java.sql.Date convertUtilToSql(java.util.Date uDate) {
		java.sql.Date sDate = new java.sql.Date(uDate.getTime());
		return sDate;
	}

	@Override
	public boolean updateUser(Account account) {
		// TODO Auto-generated method stub
		try {
			accountRepository.save(account);
			return true;
		}
		catch (Exception exception) {
			return false;
		}
	}

	@Override
	public boolean deleteUser(int id) {
		try {
			accountRepository.delete(id);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
	}

}
