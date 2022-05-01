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

@Entity(name = "Room_Category")
@Table(name = "Room_Category")
public class RoomCategory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "categoryroomid")
	private int id;

	@Column(name = "categoryname")
	private String catRoomName;

	@Column(name = "capacity")
	private int capacity;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "cateRoom", cascade = CascadeType.ALL)
	private Set<Room> rooms;

	public Set<Room> getRooms() {
		return rooms;
	}

	public void setRooms(Set<Room> rooms) {
		this.rooms = rooms;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCatRoomName() {
		return catRoomName;
	}

	public void setCatRoomName(String catRoomName) {
		this.catRoomName = catRoomName;
	}

}
