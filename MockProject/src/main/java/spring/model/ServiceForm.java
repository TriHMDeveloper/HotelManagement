package spring.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ServiceForm {
	private int id;

	private int catSerIid;

	private String serName;

	private long price;

	private String description;

	private CommonsMultipartFile image;

	public int getId() {
		return id;
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

	public CommonsMultipartFile getImage() {
		return image;
	}

	public void setImage(CommonsMultipartFile image) {
		this.image = image;
	}

}
