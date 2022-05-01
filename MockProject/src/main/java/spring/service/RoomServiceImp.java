
package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.Room;
import spring.model.RoomCategory;
import spring.repository.RoomCategoryRepository;
import spring.repository.RoomRepository;

@Service
public class RoomServiceImp implements RoomService {

	@Autowired
	private RoomRepository roomRepository;

	@Autowired
	private RoomCategoryRepository roomCategoryRepository;

	@Override
	public boolean addRoom(Room room) {
		try {
			roomRepository.save(room);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public List<RoomCategory> findAllRoomCate() {
		return roomCategoryRepository.findAll();
	}

	@Override
	public List<Object[]> getInfoRoom() {
		// TODO Auto-generated method stub
		return roomRepository.getInfo();
	}

	@Override
	public Room findRoomByRoomNumber(String roomNumber) {
		// TODO Auto-generated method stub
		return roomRepository.findByRoomNumber(roomNumber);
	}

	@Override
	public boolean addRoomCategory(RoomCategory roomCategory) {
		try {
			roomCategoryRepository.save(roomCategory);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public RoomCategory findRoomCategoryByCateName(String cateRoomName) {
		return roomCategoryRepository.findByCatRoomName(cateRoomName);
	}

	@Override
	public boolean checkCateRoomNameExist(String name) {
		List<RoomCategory> listRoomCategories = roomCategoryRepository.findAll();
		for (RoomCategory roomCategory : listRoomCategories) {
			if (roomCategory.getCatRoomName().equalsIgnoreCase(name)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public List<Room> findAllRooms() {
		return roomRepository.findAll();
	}

	@Override
	public List<Room> findAllRoomsByStatus(String status) {
		// TODO Auto-generated method stub
		return roomRepository.findByStatus(status);
	}

	@Override
	public boolean deleteRoom(String roomNumber) {
		Room room = roomRepository.findByRoomNumber(roomNumber);
		try {
			roomRepository.delete(room.getId());
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateRoom(Room room) {
		try {
			roomRepository.save(room);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<Room> findAllRoom() {
		// TODO Auto-generated method stub
		return roomRepository.findAll();
	}

	@Override
	public boolean updateRoomCateogory(RoomCategory roomCategory) {
		// TODO Auto-generated method stub
		try {
			roomCategoryRepository.save(roomCategory);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean deleteCateogory(int id) {
		// TODO Auto-generated method stub
		try {
			roomCategoryRepository.delete(id);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

}