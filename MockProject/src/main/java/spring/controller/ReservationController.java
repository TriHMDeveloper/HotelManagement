package spring.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.model.Book_Service;
import spring.model.Booking;
import spring.model.Room;
import spring.model.Service;
import spring.model.ServiceCategory;
import spring.model.TotalMap;
import spring.service.AccountService;
import spring.service.BookingService;
import spring.service.BookingServiceService;
import spring.service.RoomService;
import spring.service.ServiceService;

@Controller
public class ReservationController {
	@Autowired
	private RoomService roomService;

	@Autowired
	private ServiceService serService;

	@Autowired
	private BookingService bookingService;

	@Autowired
	private BookingServiceService bookingServiceService;

	@RequestMapping(value = "/reservationView", method = RequestMethod.GET)
	public ModelAndView reservationView(Model model) {
		ModelAndView mav = new ModelAndView("reservationView");
		model.addAttribute("addService", new Book_Service());

		List<Room> viewRooms = roomService.findAllRoomsByStatus("Checkin");
		mav.addObject("listRoomCheckin", viewRooms);

		List<ServiceCategory> viewServiceCategory = serService.findAllSerCate();
		mav.addObject("listServiceCategory", viewServiceCategory);

		List<Booking> viewBookings = bookingService.findAllBooking();
		
		List<Booking> availableBookings = new ArrayList<Booking>();
		List<Booking> inavailableBookings = new ArrayList<Booking>();
		
		java.sql.Date sDate;
		for (Booking booking : viewBookings) {
			java.util.Date date = new java.util.Date();
			sDate = new java.sql.Date(date.getTime());
			if (booking.getEndDate().compareTo(sDate) >= 0) {
				availableBookings.add(booking);
			}
			else {
				inavailableBookings.add(booking);
			}
		}
		
		mav.addObject("availableBooking", availableBookings);
		mav.addObject("inavailableBooking", inavailableBookings);

		Map<Integer, Long> total = new HashMap<>();
		for (Booking booking : availableBookings) {
			total.put(booking.getBookingId(), bookingService.findById(booking.getBookingId()).getPrice()
					+ bookingServiceService.calculateServicePrice(booking.getBookingId()));
		}
		TotalMap totalMap = new TotalMap();
		totalMap.setTotalMap(total);
		mav.addObject("total", totalMap);
		
		Map<Integer, Long> total2 = new HashMap<>();
		for (Booking booking : inavailableBookings) {
			total2.put(booking.getBookingId(), bookingService.findById(booking.getBookingId()).getPrice()
					+ bookingServiceService.calculateServicePrice(booking.getBookingId()));
		}
		TotalMap totalMap2 = new TotalMap();
		totalMap2.setTotalMap(total2);
		
		
		mav.addObject("total2", totalMap2);

		return mav;
	}

	@RequestMapping(value = "/addServiceForCustomer", method = RequestMethod.POST)
	public ModelAndView callService(Model model, @ModelAttribute("addService") Book_Service book_Service) {
		ModelAndView mav = new ModelAndView("returnReservation");

		System.err.println("Booking Id " + book_Service.getBookingId());

		Service service = serService.findServiceById(book_Service.getServiceId());

		book_Service.setPrice(service.getPrice() * book_Service.getQuantity());

		boolean status = bookingServiceService.addBookingService(book_Service);

		if (status) {
			model.addAttribute("msg", "success");
		} else {
			model.addAttribute("msgF", "failed");
		}

		List<Room> viewRooms = roomService.findAllRoomsByStatus("Checkin");
		mav.addObject("listRoomCheckin", viewRooms);

		List<ServiceCategory> viewServiceCategory = serService.findAllSerCate();
		mav.addObject("listServiceCategory", viewServiceCategory);

		List<Booking> viewBookings = bookingService.findAllBooking();

		List<Booking> availableBookings = new ArrayList<Booking>();
		List<Booking> inavailableBookings = new ArrayList<Booking>();
		
		java.sql.Date sDate;
		for (Booking booking : viewBookings) {
			java.util.Date date = new java.util.Date();
			sDate = new java.sql.Date(date.getTime());
			if (booking.getEndDate().compareTo(sDate) >= 0) {
				availableBookings.add(booking);
			}
			else {
				inavailableBookings.add(booking);
			}
		}
		
		mav.addObject("availableBooking", availableBookings);
		mav.addObject("inavailableBooking", inavailableBookings);

		Map<Integer, Long> total = new HashMap<>();
		for (Booking booking : availableBookings) {
			total.put(booking.getBookingId(), bookingService.findById(booking.getBookingId()).getPrice()
					+ bookingServiceService.calculateServicePrice(booking.getBookingId()));
		}
		TotalMap totalMap = new TotalMap();
		totalMap.setTotalMap(total);
		mav.addObject("total", totalMap);
		
		Map<Integer, Long> total2 = new HashMap<>();
		for (Booking booking : inavailableBookings) {
			total2.put(booking.getBookingId(), bookingService.findById(booking.getBookingId()).getPrice()
					+ bookingServiceService.calculateServicePrice(booking.getBookingId()));
		}
		TotalMap totalMap2 = new TotalMap();
		totalMap2.setTotalMap(total2);
		
		
		mav.addObject("total2", totalMap2);


		return mav;
	}

	@RequestMapping(value = "/addServiceDetails/{categoryId}", method = RequestMethod.GET)
	public @ResponseBody List<Service> callServicesDetails(@PathVariable("categoryId") int id) {

		System.out.println("ID " + id);
		List<Service> listServiceByCategory = serService.findServiceByCatService(id);

		return listServiceByCategory;
	}

	@RequestMapping(value = "/deleteOrderedService/{bookingId}_{serviceId}", method = RequestMethod.GET)
	public ModelAndView deleteRoom(@PathVariable("bookingId") int bookingId, Model model,
			@PathVariable("serviceId") int serviceId) {
		ModelAndView mav = new ModelAndView("returnReservation");
		model.addAttribute("addService", new Book_Service());

		boolean status = bookingServiceService.deleteOrderedService(bookingId, serviceId);
		if (status) {
			model.addAttribute("msg", "success");
		} else {
			model.addAttribute("msgF", "failed");
		}

		List<Room> viewRooms = roomService.findAllRoomsByStatus("Checkin");
		mav.addObject("listRoomCheckin", viewRooms);

		List<ServiceCategory> viewServiceCategory = serService.findAllSerCate();
		mav.addObject("listServiceCategory", viewServiceCategory);

		List<Booking> viewBookings = bookingService.findAllBooking();
		List<Booking> availableBookings = new ArrayList<Booking>();
		List<Booking> inavailableBookings = new ArrayList<Booking>();
		
		java.sql.Date sDate;
		for (Booking booking : viewBookings) {
			java.util.Date date = new java.util.Date();
			sDate = new java.sql.Date(date.getTime());
			if (booking.getEndDate().compareTo(sDate) >= 0) {
				availableBookings.add(booking);
			}
			else {
				inavailableBookings.add(booking);
			}
		}
		
		mav.addObject("availableBooking", availableBookings);
		mav.addObject("inavailableBooking", inavailableBookings);

		Map<Integer, Long> total = new HashMap<>();
		for (Booking booking : availableBookings) {
			total.put(booking.getBookingId(), bookingService.findById(booking.getBookingId()).getPrice()
					+ bookingServiceService.calculateServicePrice(booking.getBookingId()));
		}
		TotalMap totalMap = new TotalMap();
		totalMap.setTotalMap(total);
		mav.addObject("total", totalMap);
		
		Map<Integer, Long> total2 = new HashMap<>();
		for (Booking booking : inavailableBookings) {
			total2.put(booking.getBookingId(), bookingService.findById(booking.getBookingId()).getPrice()
					+ bookingServiceService.calculateServicePrice(booking.getBookingId()));
		}
		TotalMap totalMap2 = new TotalMap();
		totalMap2.setTotalMap(total2);
		
		
		mav.addObject("total2", totalMap2);


		return mav;
	}
}