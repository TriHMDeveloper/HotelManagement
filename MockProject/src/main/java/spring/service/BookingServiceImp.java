/*
 * @author Ha Minh Tri
 * @date Mar 31, 2021
 * @project MockProject
 */


package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.Booking;
import spring.repository.BookingRepository;

@Service
public class BookingServiceImp implements BookingService {
	
	@Autowired
	private BookingRepository bookingRepository;

	@Override
	public void addBooking(Booking booking) {
		bookingRepository.save(booking);
		
	}

	@Override
	public boolean deleteBooking(int id) {
		try {
			bookingRepository.delete(id);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public Booking findById(int id) {
		// TODO Auto-generated method stub
		return bookingRepository.findOne(id);
	}

	@Override
	public List<Booking> findAllBooking() {
		// TODO Auto-generated method stub
		return bookingRepository.findAll();
	}

	@Override
	public List<Booking> findAllByYear(int year) {
		// TODO Auto-generated method stub
		return bookingRepository.findAllByYear(year);
	}
}
