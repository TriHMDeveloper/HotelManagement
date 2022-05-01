package spring.service;

import java.util.List;

import spring.model.Room;
import spring.model.RoomCategory;

public interface RoomService {
	boolean addRoom(Room room);
	List<Object []> getInfoRoom();
	Room findRoomByRoomNumber(String roomNumber);
	List<Room> findAllRooms();
	List<Room> findAllRoomsByStatus(String status);
	boolean deleteRoom(String roomNumber);
	boolean updateRoom(Room room);
	List<Room> findAllRoom();
	
	boolean addRoomCategory(RoomCategory roomCategory);
	List<RoomCategory> findAllRoomCate();
	RoomCategory findRoomCategoryByCateName(String cateRoomName);
	boolean updateRoomCateogory(RoomCategory roomCategory);
	boolean checkCateRoomNameExist(String name);
	boolean deleteCateogory(int id);
}