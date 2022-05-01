package spring.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class RoomForm {
	private int catRoomId;
	private String roomNumber;
	private long price;
	private String description;
	private CommonsMultipartFile image;

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

	public CommonsMultipartFile getImage() {
		return image;
	}

	public void setImage(CommonsMultipartFile image) {
		this.image = image;
	}

}