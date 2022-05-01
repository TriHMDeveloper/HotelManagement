
package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.ServiceCategory;
import spring.repository.ServiceCategoryRepository;
import spring.repository.ServiceRepository;

@Service
public class ServiceServiceImp implements ServiceService {
	
	@Autowired
	private ServiceRepository serviceRepository;
	
	@Autowired
	private ServiceCategoryRepository serviceCateRepository;

	@Override
	public boolean addService(spring.model.Service service) {
		try {
			serviceRepository.save(service);
			return true;
		}
		catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public List<ServiceCategory> findAllSerCate() {
		return serviceCateRepository.findAll();
	}

	@Override
	public boolean checkCateSerNameExist(String name) {
		List<ServiceCategory> listSerCategories = serviceCateRepository.findAll();
		for (ServiceCategory serviceCategory : listSerCategories) {
			if(serviceCategory.getCatSerName().equalsIgnoreCase(name)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean addServiceCate(ServiceCategory serviceCategory) {
		try {
			serviceCateRepository.save(serviceCategory);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public List<spring.model.Service> findAllService() {
		return serviceRepository.findAll();
	}

	@Override
	public boolean updateServiceCategory(ServiceCategory serviceCategory) {
		// TODO Auto-generated method stub
		try {
			serviceCateRepository.save(serviceCategory);
			return true;
		}
		catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean deleteServiceCategory(int id) {
		try {
			serviceCateRepository.delete(id);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public ServiceCategory findServiceCategoryByCatSerName(String name) {
		// TODO Auto-generated method stub
		return serviceCateRepository.findByCatSerName(name);
	}

	@Override
	public spring.model.Service findServiceById(int id) {
		// TODO Auto-generated method stub
		return serviceRepository.findOne(id);
	}

	@Override
	public spring.model.Service findServiceByName(String name) {
		// TODO Auto-generated method stub
		return serviceRepository.findBySerName(name);
	}

	@Override
	public boolean updateService(spring.model.Service service) {
		// TODO Auto-generated method stub
		try {
			serviceRepository.save(service);
			return true;
		}
		catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean deleteService(int id) {
		// TODO Auto-generated method stub
		try {
			serviceRepository.delete(id);
			return true;
		}
		catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public List<spring.model.Service> findServiceByCatService(int id) {
		// TODO Auto-generated method stub
		return serviceRepository.findByCatSerIid(id);
	}
}