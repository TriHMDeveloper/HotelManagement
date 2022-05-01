/*
 * @author Ha Minh Tri
 * @date Mar 30, 2021
 * @project MockProject
 */


package spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import spring.model.Account_roles;

public interface AccountRolesRepository extends JpaRepository<Account_roles, Integer> {
}
