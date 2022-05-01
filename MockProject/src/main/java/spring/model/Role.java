/*
 * @author Ha Minh Tri
 * @date Mar 29, 2021
 * @project MockProject
 */


package spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "Roles")
@Table(name = "Roles")
public class Role {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "role_id")
	private int roleId;
	
	@Column(name = "role_name")
	private String roleName;
	
	
//	@ManyToMany(mappedBy = "roles")
//    private List<Account> users = new ArrayList<Account>();
	
	
	
	public Role() {
	}
	
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

//	public List<Account> getUsers() {
//		return users;
//	}
//
//	public void setUsers(List<Account> users) {
//		this.users = users;
//	}
	
	
	
	
}
