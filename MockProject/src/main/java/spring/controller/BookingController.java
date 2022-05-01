/*
 * @author Ha Minh Tri
 * @date Apr 2, 2021
 * @project MockProject
 */


package spring.controller;


import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.model.AddBooking;
import spring.model.Booking;
import spring.model.Customer;
import spring.model.Room;
import spring.security.SecurityUtils;
import spring.service.AccountService;
import spring.service.BookingService;
import spring.service.CustomerService;
import spring.service.RoomService;

@Controller
public class BookingController {
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private BookingService bookingService;
	
	
	@RequestMapping(value = "/listBooking", method = RequestMethod.GET)
	public ModelAndView homePage(Model model) {
		ModelAndView mav = new ModelAndView("bookedView");
		List<Room> viewRooms = roomService.findAllRoomsByStatus("Available");
		mav.addObject("listRoomAvailable", viewRooms);
		model.addAttribute("bookingAttribute", new AddBooking());
		return mav;
	}
	
	
	@RequestMapping(value = "/addBooking", method = RequestMethod.POST)
	public ModelAndView addBookingPage(@ModelAttribute("bookingAttribute") AddBooking addBooking, Model model) {
		ModelAndView mav = new ModelAndView("returnCheckIn");
		
		if (customerService.checkIdentityNumberExist(addBooking.getIdentityNumber())==false) {
			Customer customer = new Customer();
			customer.setIdentityNumber(addBooking.getIdentityNumber());
			customer.setName(addBooking.getNameCustomer());
			customer.setPhone(addBooking.getPhone());
			customerService.addCustomer(customer);
		}
		
		Booking booking = new Booking();
		int acId= accountService.findByUsername(SecurityUtils.getPrincipal().getUsername()).getAccountId();
		int roomId= roomService.findRoomByRoomNumber(addBooking.getRoomNumber()).getId();
		int cusId= customerService.findByCustomerIdentity(addBooking.getIdentityNumber()).getId();
		LocalDate start = LocalDate.parse(addBooking.getStartDay().toString());
		LocalDate end = LocalDate.parse(addBooking.getEndDay().toString());
		long diff = ChronoUnit.DAYS.between(start, end);
		long price = roomService.findRoomByRoomNumber(addBooking.getRoomNumber()).getPrice();
		
		booking.setAccountId(acId);
		booking.setRoomId(roomId);
		booking.setCustomerId(cusId);
		booking.setStartDate(addBooking.getStartDay());
		booking.setEndDate(addBooking.getEndDay());
		booking.setNumberPeople(addBooking.getNumberOfPeople());
		booking.setPrice(diff*price);
		bookingService.addBooking(booking);
		
		Room roomUpdate= roomService.findRoomByRoomNumber(addBooking.getRoomNumber());
		roomUpdate.setStatus("Booked");
		roomService.updateRoom(roomUpdate);
		
		List<Room> viewRooms = roomService.findAllRoomsByStatus("Booked");
		mav.addObject("listRoomBooked", viewRooms);

		
		
		return mav;
	}
}
