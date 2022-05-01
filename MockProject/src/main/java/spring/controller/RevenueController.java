package spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.model.Book_Service;
import spring.model.Booking;
import spring.model.Booking_Service_Key;
import spring.model.Revenue;
import spring.service.BookingService;
import spring.service.BookingServiceService;

@Controller
public class RevenueController {
	
	@Autowired
	private BookingService bookingService;
	
	@Autowired
	private BookingServiceService bookingServiceService;
	
	@RequestMapping(value = "/admin/revenue", method = RequestMethod.GET)
	public ModelAndView view () {
		ModelAndView modelAndView = new ModelAndView("revenueView");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/revenueList", method = RequestMethod.GET) 
	@ResponseBody
	public List<Revenue> revenue () {	
		List<Revenue> revenueList = new ArrayList<Revenue>();
		
		List<Booking> bookingList = bookingService.findAllByYear(2021);
		boolean status = bookingList.isEmpty();
		System.err.println(status);
		
		for (int i = 0; i < bookingList.size(); i++) {
			long total = 0;
			for (Booking booking : bookingList) {
				if (booking.getEndDate().getMonth() == i) {
					total += booking.getPrice() + bookingServiceService.calculateServicePrice(booking.getBookingId());
				}
			}
			revenueList.add(new Revenue(i + 1, 2021, total));  
		}
		/*
		 * for (int i = 0; i < 3; i++) { revenueList.add(new Revenue(i + 1, 2021,
		 * bookingList.get(i).getPrice())); }
		 */
		
		
//		revenueList.add(new Revenue (1, 2021, 5000));
//		revenueList.add(new Revenue (2, 2021, 4000));
//		revenueList.add(new Revenue (3, 2021, 2000));
//		revenueList.add(new Revenue (4, 2021, 7000));
//		revenueList.add(new Revenue (5, 2021, 1000));
//		revenueList.add(new Revenue (6, 2021, 4000));
//		revenueList.add(new Revenue (7, 2021, 2000));
//		revenueList.add(new Revenue (8, 2021, 4000));
//		revenueList.add(new Revenue (9, 2021, 9000));
//		revenueList.add(new Revenue (10, 2021, 2000));
//		revenueList.add(new Revenue (11, 2021, 1000));
//		revenueList.add(new Revenue (12, 2021, 6000));
		
		return revenueList;
	}
}