/*
 * @author Ha Minh Tri
 * @date Apr 5, 2021
 * @project MockProject
 */


package spring.model;

public class ViewRoom {
	
	private int catRoomId;

	private String roomNumber;
	
	private String catRoomName;

	private String status;
	
	private int capacity;


	private long price;

	private String description;

	private String image;
	
	
	
	

	public ViewRoom() {
		super();
	}

	public ViewRoom(int catRoomId, String roomNumber, String catRoomName, String status, int capacity, long price,
			String description, String image) {
		super();
		this.catRoomId = catRoomId;
		this.roomNumber = roomNumber;
		this.catRoomName = catRoomName;
		this.status = status;
		this.capacity = capacity;
		this.price = price;
		this.description = description;
		this.image = image;
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

	public String getCatRoomName() {
		return catRoomName;
	}

	public void setCatRoomName(String catRoomName) {
		this.catRoomName = catRoomName;
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
	
	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	
}
