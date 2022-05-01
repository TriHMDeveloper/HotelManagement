package spring.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.model.Service;
import spring.model.ServiceCategory;
import spring.model.ServiceForm;
import spring.service.ServiceService;

@Controller
public class ServiceController {
	
	@Autowired
	private ServiceService serService;
	
	@RequestMapping(value = "/admin/listService", method = RequestMethod.GET)
	public ModelAndView servicePage(Model model) {
		ModelAndView mav = new ModelAndView("serviceView");
		model.addAttribute("serviceAttribute", new Service());
		
		List<Service> list = serService.findAllService();
		mav.addObject("listService", list);
		
		List<ServiceCategory> listCat = serService.findAllSerCate();
		mav.addObject("listViewCate", listCat);
		return mav;
	}	
	// ServiceCategory
	
	@RequestMapping(value = "/admin/listServiceCategory", method = RequestMethod.GET)
	public ModelAndView serviceCatPage(Model model) {
		ModelAndView mav = new ModelAndView("servicecateView");
		model.addAttribute("serviceCateAttribute", new ServiceCategory());
		
		List<ServiceCategory> list = serService.findAllSerCate();
		mav.addObject("listViewCate", list);
		return mav;
	}
	
	@RequestMapping(value = "/admin/addService", method = RequestMethod.POST) 
	public ModelAndView addService (Model model, @ModelAttribute("serviceAttribute") ServiceForm service, HttpSession httpSession) {
		CommonsMultipartFile file = service.getImage();
		ModelAndView mav = new ModelAndView("returnService");
		
		if (serService.findServiceByName(service.getSerName()) != null) {
			model.addAttribute("messageRoom", "Service is existed");
		} else {
			Service service2 = new Service();
			
			byte data[] = file.getBytes();
			String path = httpSession.getServletContext().getRealPath("/") + File.separator + "decoration"
					+ File.separator + "image" + File.separator + file.getOriginalFilename();
			try {
				FileOutputStream fileOutputStream = new FileOutputStream(path);
				fileOutputStream.write(data);
				fileOutputStream.close();

			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			service2.setSerName(service.getSerName());
			service2.setCatSerIid(service.getCatSerIid());
			service2.setPrice(service.getPrice());
			service2.setImage(service.getImage().getOriginalFilename());
			service2.setDescription(service.getDescription());
			
			boolean status = serService.addService(service2);
			
			if (status) {
				model.addAttribute("msg", "success");
			}
			else {
				model.addAttribute("msgF", "failed");
			}
		}
		
		List<Service> listService = serService.findAllService();
		mav.addObject("listService", listService);
		
		List<ServiceCategory> list = serService.findAllSerCate();
		mav.addObject("listViewCate", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/editService", method = RequestMethod.POST)
	public ModelAndView editServiceCategory(Model model,
			@RequestParam("exServiceName") String exServiceName,
			@RequestParam("serviceName") String serviceName,
			@RequestParam("catSerName") String catSerName,
			@RequestParam("servicePrice") long price,
			@RequestParam("serviceDescription") String description) {
		ModelAndView mav = new ModelAndView("returnService");
		model.addAttribute("serviceAttribute", new Service());
		
		Service service = serService.findServiceByName(exServiceName);
		int id = serService.findServiceCategoryByCatSerName(catSerName).getId();
		
		if (!exServiceName.equals(serviceName)) {
			service.setSerName(serviceName);
			service.setCatSerIid(id);
			service.setPrice(price);
			service.setDescription(description);
		}
		else {
			service.setCatSerIid(id);
			service.setPrice(price);
			service.setDescription(description);
		}
		
		boolean status = serService.updateService(service);
		
		if (status) {
			model.addAttribute("msg", "success");
		}
		else {
			model.addAttribute("msgF", "failed");
			model.addAttribute("messageEditRoom", "Service is existed");
		}
		
		List<Service> listService = serService.findAllService();
		mav.addObject("listService", listService);
		
		List<ServiceCategory> list = serService.findAllSerCate();
		mav.addObject("listViewCate", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/deleteService/{id}", method = RequestMethod.GET)
	public ModelAndView deleteService(@PathVariable("id") String id, Model model) {
		ModelAndView mav = new ModelAndView("returnService");
		model.addAttribute("serviceAttribute", new Service());
				
		System.err.println("id delete: " + id);

		boolean status = serService.deleteService(Integer.parseInt(id));
		
		if (status) {
			model.addAttribute("msg", "success");
		}
		else {
			model.addAttribute("msgF", "failed");
		}
		
		List<Service> listService = serService.findAllService();
		mav.addObject("listService", listService);
		
		List<ServiceCategory> list = serService.findAllSerCate();
		mav.addObject("listViewCate", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/addCategoryService", method = RequestMethod.POST)
	public ModelAndView addServiceCatePage(@ModelAttribute("serviceCateAttribute") ServiceCategory serviceCategory, Model model) {
		ModelAndView mav = new ModelAndView("returnServiceCate");
		
		if (serService.checkCateSerNameExist(serviceCategory.getCatSerName())) {
			model.addAttribute("messageCateService", "Service category name is existed");
		} else {		
			boolean status = serService.addServiceCate(serviceCategory);
			
			if (status) {
				model.addAttribute("msg", "success");
			}
			else {
				model.addAttribute("msgF", "failed");
			}
		}
		
		List<ServiceCategory> list = serService.findAllSerCate();
		mav.addObject("listViewCate", list);
		return mav;
	}

	@RequestMapping(value = "/editCategoryService", method = RequestMethod.POST)
	public ModelAndView editServiceCategory(Model model, @RequestParam("categorySerID") String exName, @RequestParam("categorySerName") String name) {
		ModelAndView mav = new ModelAndView("returnServiceCate");
		model.addAttribute("serviceCateAttribute", new ServiceCategory());
		
		
		ServiceCategory serviceCategory = serService.findServiceCategoryByCatSerName(exName);
		if (!exName.equals(name))
			serviceCategory.setCatSerName(name);
		
		boolean status = serService.updateServiceCategory(serviceCategory);
		
		if (status) {
			model.addAttribute("msg", "success");
		}
		else {
			model.addAttribute("msgF", "failed");
			model.addAttribute("messageCateService", "Service category name is existed");
		}
		
		List<ServiceCategory> list = serService.findAllSerCate();
		mav.addObject("listViewCate", list);
		return mav;
	}
	
	@RequestMapping(value = "/deleteCategoryService/{id}", method = RequestMethod.GET)
	public ModelAndView deleteServiceCategory(@PathVariable("id") String id, Model model) {
		ModelAndView mav = new ModelAndView("returnServiceCate");
		

		boolean status = serService.deleteServiceCategory(Integer.parseInt(id));
		
		if (status) {
			model.addAttribute("msg", "success");
		}
		else {
			model.addAttribute("msgF", "failed");
		}
		
		model.addAttribute("serviceCateAttribute", new ServiceCategory());
		
		System.err.println(id);
		
		List<ServiceCategory> list = serService.findAllSerCate();
		mav.addObject("listViewCate", list);
		
		return mav;
	}
}