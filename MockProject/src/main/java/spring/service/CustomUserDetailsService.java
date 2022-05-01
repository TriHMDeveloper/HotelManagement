/*
 * @author Ha Minh Tri
 * @date Mar 31, 2021
 * @project MockProject
 */


package spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import spring.dto.MyUser;
import spring.model.Account;
import spring.model.Role;
import spring.repository.AccountRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private AccountRepository accountRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accountRepository.findOneByUsername(username);
		
		if (account == null) {
			throw new UsernameNotFoundException("User not found");
		}
	//	account.getAccountId();
		//account.setRoles();
		// 
//		System.out.println(account.getPassword());
		
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (Role role: account.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
//			System.out.println(role.getRoleName());
		}
		MyUser myuser = new MyUser(account.getUsername(), account.getPassword(), true, true, true, true, authorities);
		myuser.setFullName(account.getFullName());
		return myuser;
	}

}
