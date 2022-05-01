/*
 * @author Ha Minh Tri
 * @date Mar 10, 2021
 * @project JSFW.L.A103
 */


package spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView homePage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("login");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return mav;
	}
	
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//    public String showLoginForm(Model model) {
//         
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
//            return "login";
//        }
//        return "redirect:/";
//    }
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping(value = "/deny", method = RequestMethod.GET)
	public ModelAndView denyPage() {
		ModelAndView mav = new ModelAndView("deny");
		return mav;
	}
	
	
}
