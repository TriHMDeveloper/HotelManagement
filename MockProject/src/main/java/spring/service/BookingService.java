/*
 * @author Ha Minh Tri
 * @date Mar 31, 2021
 * @project MockProject
 */


package spring.service;

import java.util.List;

import spring.model.Booking;

public interface BookingService {
	void addBooking(Booking booking);
	boolean deleteBooking (int id);
	Booking findById(int id);
	List<Booking> findAllBooking();
	List<Booking> findAllByYear(int year);
}
