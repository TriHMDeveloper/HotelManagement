/*
 * @author Ha Minh Tri
 * @date Mar 31, 2021
 * @project MockProject
 */

package spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity(name = "Room")
@Table(name = "Room")
public class Room {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "room_id")
	private int id;

	@Column(name = "categoryroomid")
	private int catRoomId;

	@Column(name = "room_number")
	private String roomNumber;

	@Column(name = "status")
	private String status;

	@Column(name = "price")
	private long price;

	@Column(name = "description")
	private String description;

	@Column(name = "image")
	private String image;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "categoryroomid", nullable = false, insertable = false, updatable = false)
	private RoomCategory cateRoom;
	
	@OneToOne(mappedBy = "room")
    private Booking booking;
	
	

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}

	public RoomCategory getCateRoom() {
		return cateRoom;
	}

	public void setCateRoom(RoomCategory cateRoom) {
		this.cateRoom = cateRoom;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCatRoomId() {
		return catRoomId;
	}

	public void setCatRoomId(int catRoomId) {
		this.catRoomId = catRoomId;
	}

	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public long getPrice() {
		return price;
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

}
