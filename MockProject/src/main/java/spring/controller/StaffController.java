
package spring.controller;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.model.Account;
import spring.model.Account_roles;
import spring.service.AccountService;

@Controller
public class StaffController {

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = "/admin/staffList", method = RequestMethod.GET)
	public ModelAndView registerPage(Model model) {
		model.addAttribute("userAttribute", new Account());
		ModelAndView mav = new ModelAndView("staffView");
		List<Account> accounts = accountService.findAllStaff();
		mav.addObject("listViewStaff", accounts);
		return mav;
	}

	@RequestMapping(value = "/admin/addStaff", method = RequestMethod.POST)
	public ModelAndView registerPostPage(@ModelAttribute("userAttribute") Account account, BindingResult result,
			ModelMap model) {
		if (accountService.findByUsername(account.getUsername()) != null) {
			model.addAttribute("message", "Username is existed");
		} else if (accountService.findByIdentityNumber(account.getIdenityNumber()) != null) {
			model.addAttribute("message", "Identity number is existed");
		} else if (accountService.findByEmail(account.getEmail()) != null) {
			model.addAttribute("message", "Email is existed");
		} else if (accountService.findByPhone(account.getPhone()) != null) {
			model.addAttribute("message", "Phone is existed");
		} else {
			accountService.addUser(account);
			int id = accountService.findByUsername(account.getUsername()).getAccountId();
			Account_roles account_roles = new Account_roles(id, 2);
			accountService.addRole(account_roles);
			
			/*
			 * if (status) { model.addAttribute("msg", "success"); } else {
			 * model.addAttribute("msgF", "failed"); }
			 */
		}
		ModelAndView mav = new ModelAndView("returnStaffView");
		List<Account> accounts = accountService.findAllStaff();
		mav.addObject("listViewStaff", accounts);
		return mav;
	}

	@RequestMapping(value = "/admin/updateStaff", method = RequestMethod.POST)
	public ModelAndView updateStaff(Model model, @RequestParam("exUsername") String exUsername,
			@RequestParam("fullName") String fullName, @RequestParam("userName") String userName,
			@RequestParam("birthDate") String birthDate, @RequestParam("identityNumber") String identityNumber,
			@RequestParam("phone") String phone, @RequestParam("email") String email) throws ParseException {

		System.err.println(birthDate);

		Account account = accountService.findByUsername(exUsername);

		account.setFullName(fullName);
		account.setUsername(userName);
		account.setBirthDate(accountService.convertDate(birthDate));
		account.setIdenityNumber(identityNumber);
		account.setPhone(phone);
		account.setEmail(email);

		boolean status = accountService.updateUser(account);

		if (status) {
			model.addAttribute("msg", "success");
		}
		else {
			model.addAttribute("msgF", "failed");
			model.addAttribute("messageEdit", "Update failed");
		}
		
		ModelAndView mav = new ModelAndView("returnStaffView");
		List<Account> accounts = accountService.findAllStaff();
		model.addAttribute("userAttribute", new Account());
		mav.addObject("listViewStaff", accounts);
		return mav;
	}

	@RequestMapping(value = "/admin/deleteStaff/{id}", method = RequestMethod.GET)
	public ModelAndView deleteStaff(Model model, @PathVariable("id") int id) {
		
		boolean status = accountService.deleteUser(id);
		
		if (status) {
			model.addAttribute("msg", "success");
		}
		else {
			model.addAttribute("msgF", "failed");
		}
		
		ModelAndView mav = new ModelAndView("returnStaffView");
		List<Account> accounts = accountService.findAllStaff();
		model.addAttribute("userAttribute", new Account());
		mav.addObject("listViewStaff", accounts);
		return mav;
	}
}