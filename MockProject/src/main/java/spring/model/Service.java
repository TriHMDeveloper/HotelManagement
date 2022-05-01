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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity(name = "Service")
@Table(name = "Service")
public class Service {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "service_id")
	private int id;

	@Column(name = "category_id")
	private int catSerIid;

	@Column(name = "service_name")
	private String serName;

	@Column(name = "price")
	private long price;

	@Column(name = "description")
	private String description;

	@Column(name = "image")
	private String image;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id", nullable = false, insertable = false, updatable = false)
	@JsonIgnore
	private ServiceCategory serviceCategory;

//	@ManyToMany(mappedBy = "listService")
//	private List<Booking> listBookings = new ArrayList<Booking>();

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "service", cascade = CascadeType.ALL, orphanRemoval = true)
	Set<Book_Service> quantity;

//	@ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name="service_id", nullable = false, insertable = false, updatable = false)
//    private Book_Service book_Service;

	public int getId() {
		return id;
	}

	public Set<Book_Service> getQuantity() {
		return quantity;
	}

	public void setQuantity(Set<Book_Service> quantity) {
		this.quantity = quantity;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCatSerIid() {
		return catSerIid;
	}

	public void setCatSerIid(int catSerIid) {
		this.catSerIid = catSerIid;
	}

	public String getSerName() {
		return serName;
	}

	public void setSerName(String serName) {
		this.serName = serName;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public ServiceCategory getServiceCategory() {
		return serviceCategory;
	}

	public void setServiceCategory(ServiceCategory serviceCategory) {
		this.serviceCategory = serviceCategory;
	}

}
