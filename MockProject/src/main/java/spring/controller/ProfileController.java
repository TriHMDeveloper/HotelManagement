/*
 * @author Ha Minh Tri
 * @date Apr 13, 2021
 * @project MockProject
 */


package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.model.Account;
import spring.security.SecurityUtils;
import spring.service.AccountService;

@Controller
public class ProfileController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView profilePage(Model model) {
		Account acc= accountService.findByUsername(SecurityUtils.getPrincipal().getUsername());		
		ModelAndView mav = new ModelAndView("profileView");
		mav.addObject("curAccount",acc);
		return mav;
	}
	
	
	@RequestMapping(value = "/editProfile", method = RequestMethod.POST)
	public ModelAndView ediProfilePage(@RequestParam("oldPass") String oldPass, @RequestParam("newPass") String newPass, Model model) {
		ModelAndView mav = new ModelAndView("returnProfile");
		Account acc= accountService.findByUsername(SecurityUtils.getPrincipal().getUsername());		
		
		
		
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println(passwordEncoder.encode(oldPass));
		
		if (encoder.matches(oldPass ,acc.getPassword())) {
			acc.setPassword(passwordEncoder.encode(newPass));
			accountService.updateUser(acc);
			mav.addObject("messagePass", "success");
		} else {
			mav.addObject("messagePass", "fail");
		}
		mav.addObject("curAccount",acc);
		return mav;
	}
	
}
