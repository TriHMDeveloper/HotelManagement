/*
 * @author Ha Minh Tri
 * @date Mar 30, 2021
 * @project MockProject
 */


package spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity(name = "Account_roles")
@Table(name = "Account_roles")
@IdClass(Account_roles.class)
public class Account_roles implements Serializable {
	

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "account_id")
	private int accountId;
	
	@Id
	@Column(name = "role_id")
	private int roleId;
	
	

	public Account_roles() {
	}

	public Account_roles(int accountId, int roleId) {
		this.accountId = accountId;
		this.roleId = roleId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	
	
	
}
