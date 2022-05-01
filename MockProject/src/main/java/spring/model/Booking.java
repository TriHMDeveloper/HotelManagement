/*
 * @author Ha Minh Tri
 * @date Mar 31, 2021
 * @project MockProject
 */


package spring.model;

import java.sql.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity(name = "Booking")
@Table(name = "Booking")
public class Booking {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "booking_id")
	private int bookingId;
	
	@Column(name = "account_id")
	private int accountId;
	
	@Column(name = "room_id")
	private int roomId;
	
	@Column(name = "startdate")
	private Date startDate;
	
	@Column(name = "enddate")
	private Date endDate;
	
	@Column(name = "price")
	private long price;
	
	@Column(name = "number_people")
	private long numberPeople;
	
	@Column(name = "id_customer")
	private int customerId;
	
//	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_customer", nullable = false, insertable = false, updatable = false)
	@JsonIgnore
	private Customer customer;
	
	
	 @OneToOne(cascade = CascadeType.ALL)
	 @JoinColumn(name = "room_id", referencedColumnName = "room_id", nullable = false, insertable = false, updatable = false)
	 @JsonIgnore
	 private Room room;
	
	 @ManyToOne(fetch = FetchType.EAGER)
	 @JoinColumn(name="account_id", nullable = false, insertable = false, updatable = false)
	 @JsonIgnore
	 private Account account;
	 
	 
//	 @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//	 @JoinTable(name = "Book_Service", joinColumns = @JoinColumn(name = "booking_id"), inverseJoinColumns = @JoinColumn(name = "service_id"))
//	 private Set<Service> listService;
	 
	 
	 @OneToMany(mappedBy = "booking", fetch = FetchType.EAGER, cascade=CascadeType.ALL, orphanRemoval = true)
	 Set<Book_Service> quantity;
	 
	 
//	 @ManyToOne(fetch = FetchType.EAGER)
//	 @JoinColumn(name="booking_id", nullable = false, insertable = false, updatable = false)
//	 private Book_Service bookingService2;
	 
	 

	


	public Customer getCustomer() {
		return customer;
	}

	public Set<Book_Service> getQuantity() {
		return quantity;
	}

	public void setQuantity(Set<Book_Service> quantity) {
		this.quantity = quantity;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

//	public Set<Service> getListService() {
//		return listService;
//	}
//
//	public void setListService(Set<Service> listService) {
//		this.listService = listService;
//	}

	public long getNumberPeople() {
		return numberPeople;
	}

	public void setNumberPeople(long numberPeople) {
		this.numberPeople = numberPeople;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	

	public long getPrice() {
		return price;
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

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
}
