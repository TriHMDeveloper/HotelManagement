package spring.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import spring.model.Room;

public interface RoomRepository extends JpaRepository<Room, Integer> {
	
	@Modifying
	@Query("DELETE FROM Room room WHERE room.id in ?1")
	@Transactional
	void delete(int id);
	
	Room findByRoomNumber(String roomNumber);
	List<Room> findByStatus(String status);
	
	@Modifying
	@Query(value = "from Room room, Room_Category roomcate WHERE room.catRoomId = roomcate.id")
	List<Object []> getInfo();
}