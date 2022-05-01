/*
 * @author Ha Minh Tri
 * @date Mar 31, 2021
 * @project MockProject
 */


package spring.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.Book_Service;
import spring.repository.BookingServiceRepository;

@Service
public class BookingServiceServiceImp implements BookingServiceService {
	
	@Autowired
	private BookingServiceRepository bookingServiceRepository;

	@Override
	public boolean addBookingService(Book_Service book_Service) {
		// TODO Auto-generated method stub
		try {
			bookingServiceRepository.save(book_Service);
			return true; 
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}		
	}

	@Override
	public long calculateServicePrice(int id) {
		// TODO Auto-generated method stub
		List<Book_Service> list = bookingServiceRepository.findByBookingId(id);
		long sum = 0;
		for (Book_Service book_Service : list) {
			sum += book_Service.getPrice();
		}
		return sum;
	}

	@Override
	public boolean deleteOrderedService(int bookingId, int serviceId) {
		// TODO Auto-generated method stub
		try {
			bookingServiceRepository.deleteOrderedService(bookingId, serviceId);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}		
	}

}
