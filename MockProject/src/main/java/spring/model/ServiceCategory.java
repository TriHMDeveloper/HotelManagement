/*
 * @author Ha Minh Tri
 * @date Mar 31, 2021
 * @project MockProject
 */

package spring.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name = "Service_Category")
@Table(name = "Service_Category")
public class ServiceCategory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "category_id")
	private int id;

	@Column(name = "category_name")
	private String catSerName;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "serviceCategory", cascade = CascadeType.ALL)
	private Set<Service> servicers;

	public Set<Service> getServicers() {
		return servicers;
	}

	public void setServicers(Set<Service> servicers) {
		this.servicers = servicers;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCatSerName() {
		return catSerName;
	}

	public void setCatSerName(String catSerName) {
		this.catSerName = catSerName;
	}

}
