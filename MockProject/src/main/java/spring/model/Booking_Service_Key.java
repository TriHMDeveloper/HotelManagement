/*
 * @author Ha Minh Tri
 * @date Apr 11, 2021
 * @project MockProject
 */


package spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Booking_Service_Key implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "booking_id")
    private int bookingId;

    @Column(name = "service_id")
    private int serviceId;

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
    
    
}
