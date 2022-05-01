/*
 * @author Ha Minh Tri
 * @date Mar 30, 2021
 * @project MockProject
 */


package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.service.AccountService;

@Controller
public class AdminHomeController {
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView homeAdminPage() {
		ModelAndView mav = new ModelAndView("homeAdmin");
		return mav;
	}
	
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public ModelAndView welcomePage() {
		ModelAndView mav = new ModelAndView("welcomeView");
		return mav;
	}
}
