/*
 * @author Ha Minh Tri
 * @date Apr 2, 2021
 * @project MockProject
 */


package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.model.Room;
import spring.service.RoomService;

@Controller
public class CheckOutController {
	
	@Autowired
	private RoomService roomService;
	
	
	@RequestMapping(value = "/checkOut", method = RequestMethod.GET)
	public ModelAndView checkOutPage() {
		ModelAndView mav = new ModelAndView("checkOutView");
		List<Room> viewRooms = roomService.findAllRoomsByStatus("Checkin");
		mav.addObject("listRoomCheckin", viewRooms);
		return mav;
	}
	
	@RequestMapping(value = "/toAvailable/{roomNumber}", method = RequestMethod.GET)
	public ModelAndView toCheckInPage(@PathVariable("roomNumber") String roomNumber) {
		ModelAndView mav = new ModelAndView("returnCheckOut");

		Room roomUpdate = roomService.findRoomByRoomNumber(roomNumber);
		roomUpdate.setStatus("Available");
		roomService.updateRoom(roomUpdate);

		List<Room> viewRooms = roomService.findAllRoomsByStatus("Checkin");
		mav.addObject("listRoomCheckin", viewRooms);

		return mav;
	}
}
