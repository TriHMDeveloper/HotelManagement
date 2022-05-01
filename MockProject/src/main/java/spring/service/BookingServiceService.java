/*
 * @author Ha Minh Tri
 * @date Mar 31, 2021
 * @project MockProject
 */


package spring.service;

import spring.model.Book_Service;

public interface BookingServiceService {
	boolean addBookingService(Book_Service book_Service);
	long calculateServicePrice (int id);
	boolean deleteOrderedService(int bookingId, int serviceId);
}
