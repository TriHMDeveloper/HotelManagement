/*
 * @author Ha Minh Tri
 * @date Mar 31, 2021
 * @project MockProject
 */


package spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity(name = "Book_Service")
@Table(name = "Book_Service")
@IdClass(Booking_Service_Key.class)
public class Book_Service {
	
	/**
	 * 
	 */		
	/*
	 * @EmbeddedId private Booking_Service_Key id;
	 */
	/*
	 * @EmbeddedId private Booking_Service_Key id;
	 * 
	 * public Booking_Service_Key getId() { return id; }
	 * 
	 * public void setId(Booking_Service_Key id) { this.id = id; }
	 */

	@Id
	@Column(name = "booking_id")
	private int bookingId;
	
	@Id
	@Column(name = "service_id")
	private int serviceId;
	
	@Column(name = "quantity")
	private int quantity;
	
	@Column(name = "price")
	private long price;
	
	
	@ManyToOne(fetch = FetchType.EAGER)
    @MapsId("bookingId")
    @JoinColumn(name = "booking_id", nullable = false, insertable = false, updatable = false)
	@JsonIgnore
    private Booking booking;

    @ManyToOne(fetch = FetchType.EAGER)
    @MapsId("serviceId")
    @JoinColumn(name = "service_id", nullable = false, insertable = false, updatable = false)
    @JsonIgnore
    private Service service;
//	@OneToMany(fetch = FetchType.EAGER, mappedBy = "bookingService", cascade = CascadeType.ALL)
//	private Set<Service> services;
//	
//	@OneToMany(fetch = FetchType.EAGER, mappedBy = "bookingService2", cascade = CascadeType.ALL)
//	private Set<Booking> bookings;
	
	
	


	public long getPrice() {
		return price;
	}

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}

	public Service getService() {
		return service;
	}

	public void setService(Service service) {
		this.service = service;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
