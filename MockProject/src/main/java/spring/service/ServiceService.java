/*
 * @author Ha Minh Tri
 * @date Mar 31, 2021
 * @project MockProject
 */


package spring.service;

import java.util.List;

import spring.model.Service;
import spring.model.ServiceCategory;

public interface ServiceService {
	boolean addService(Service service);
	List<Service> findAllService();
	Service findServiceById (int id);
	Service findServiceByName (String name);
	boolean updateService (Service service);
	boolean deleteService (int id);
	List<Service> findServiceByCatService(int id);
	
	boolean addServiceCate(ServiceCategory serviceCategory);
	List<ServiceCategory> findAllSerCate();
	boolean checkCateSerNameExist(String name);
	boolean updateServiceCategory(ServiceCategory serviceCategory);
	boolean deleteServiceCategory(int id);
	ServiceCategory findServiceCategoryByCatSerName(String name);
}
