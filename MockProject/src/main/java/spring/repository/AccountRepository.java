/*
 * @author Ha Minh Tri
 * @date Mar 12, 2021
 * @project JSFW.L.A101
 */


package spring.repository;


import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import spring.model.Account;


public interface AccountRepository extends JpaRepository<Account, Integer>{
		Account findOneByUsername(String username);
		Account findByIdenityNumber(String idNumber);
		Account findByPhone(String phone);
		Account findByEmail(String email);
		
		@Modifying
		@Query("DELETE FROM Account account WHERE account.accountId in ?1")
		@Transactional
		void delete(int id);
//		
//		@Modifying
//		@Query("update User u set u.active = false where u.email = : email")
//		void updateUser(@Param("email")String email);
		
		
//		@Modifying(clearAutomatically = true)
//		@Query(value = "UPDATE Member SET Firstname = :firstName, Lastname= :lastName, Phone=:phone, Description = :description, UpdateTime=updateTime where Email=:email", nativeQuery = true)
//		void addDeletedColumn();
}
