/*
 * @author Ha Minh Tri
 * @date Apr 2, 2021
 * @project MockProject
 */

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.Room;
import spring.model.RoomCategory;
import spring.model.RoomForm;
import spring.service.RoomService;

@Controller
public class RoomController {

	@Autowired
	private RoomService roomService;

	@RequestMapping(value = "/admin/listRoom", method = RequestMethod.GET)
	public ModelAndView roomPage(Model model) {
		ModelAndView mav = new ModelAndView("roomListView");
		model.addAttribute("roomAttribute", new Room());

		List<RoomCategory> list = roomService.findAllRoomCate();
		mav.addObject("listRoomCate", list);

		List<Room> viewRooms = roomService.findAllRooms();
		mav.addObject("listViewRoom", viewRooms);
		return mav;
	}

	@RequestMapping(value = "/admin/addRoom", method = RequestMethod.POST)
	public ModelAndView addRoomPage(@ModelAttribute("roomAttribute") RoomForm room, Model model, 
			HttpSession httpSession, RedirectAttributes redirectAttributes) {
		CommonsMultipartFile file = room.getImage();
		ModelAndView mav = new ModelAndView("returnRoom");

		// System.out.println(file.getName());
		if (roomService.findRoomByRoomNumber(room.getRoomNumber()) != null) {
			model.addAttribute("messageRoom", "Room number is existed");
		} else {
			Room room2 = new Room();

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

			room2.setRoomNumber(room.getRoomNumber());
			room2.setCatRoomId(room.getCatRoomId());
			room2.setStatus("Available");
			room2.setPrice(room.getPrice());
			room2.setImage(room.getImage().getOriginalFilename());
			room2.setDescription(room.getDescription());
			boolean status = roomService.addRoom(room2);
			
			if (status) {
				model.addAttribute("msg", "success");
			}
			else {
				model.addAttribute("msgF", "failed");
			}
		}
		List<RoomCategory> list = roomService.findAllRoomCate();
		mav.addObject("listRoomCate", list);

		List<Room> viewRooms = roomService.findAllRooms();
		mav.addObject("listViewRoom", viewRooms);

		return mav;
	}

	@RequestMapping(value = "/admin/editRoom", method = RequestMethod.POST)
	public ModelAndView editRoom(Model model, @RequestParam("roomNumber") String roomNumber,
			@RequestParam("roomCategory") String roomCatId, @RequestParam("price") long price,
			@RequestParam("description") String description, @RequestParam("roomId") String exRoomNumber) {
		ModelAndView modelAndView = new ModelAndView("returnRoom");
		model.addAttribute("roomAttribute", new Room());

		Room roomUpdate = roomService.findRoomByRoomNumber(exRoomNumber);
		int id = roomService.findRoomCategoryByCateName(roomCatId).getId();

		if (!roomCatId.equals(exRoomNumber)) {
			roomUpdate.setCatRoomId(id);
			roomUpdate.setRoomNumber(roomNumber);
			roomUpdate.setPrice(price);
			// roomUpdate.setImage(room.getImage().getOriginalFilename());
			roomUpdate.setDescription(description);
		}
		else {
			roomUpdate.setCatRoomId(id);
			roomUpdate.setPrice(price);
			// roomUpdate.setImage(room.getImage().getOriginalFilename());
			roomUpdate.setDescription(description);
		}
		
		

		boolean status = roomService.updateRoom(roomUpdate);
		
		if (status) {
			model.addAttribute("msg", "success");
		}
		else {
			model.addAttribute("msgF", "failed");
			model.addAttribute("messageEditRoom", "Room number is existed");
		}

		List<RoomCategory> list = roomService.findAllRoomCate();
		modelAndView.addObject("listRoomCate", list);

		List<Room> viewRooms = roomService.findAllRooms();
		modelAndView.addObject("listViewRoom", viewRooms);

		return modelAndView;
	}

	@RequestMapping(value = "/admin/deleteRoom/{roomNumber123}", method = RequestMethod.GET)
	public ModelAndView deleteRoom(@PathVariable("roomNumber123") String roomNumber, Model model) {
		ModelAndView modelAndView = new ModelAndView("returnRoom");

		boolean status = roomService.deleteRoom(roomNumber);
		model.addAttribute("roomAttribute", new Room());
		
		if (status) {
			model.addAttribute("msg", "success");
		}
		else {
			model.addAttribute("msgF", "failed");
		}

		List<RoomCategory> list = roomService.findAllRoomCate();
		modelAndView.addObject("listRoomCate", list);

		List<Room> viewRooms = roomService.findAllRooms();
		modelAndView.addObject("listViewRoom", viewRooms);

		return modelAndView;
	}

	// RoomCategory

	@RequestMapping(value = "/admin/listRoomCategory", method = RequestMethod.GET)
	public ModelAndView roomCatePage(Model model) {
		ModelAndView mav = new ModelAndView("roomCateView");
		model.addAttribute("roomCateAttribute", new RoomCategory());
		model.addAttribute("roomCateEditAttribute", new RoomCategory());
		List<RoomCategory> list = roomService.findAllRoomCate();
		mav.addObject("listRoomCate", list);
		return mav;
	}

	@RequestMapping(value = "/addCategoryRoom", method = RequestMethod.POST)
	public ModelAndView addRoomCatePage(@ModelAttribute("roomCateAttribute") RoomCategory roomCategory, Model model) {
		ModelAndView mav = new ModelAndView("returnRoomCate");

		if (roomService.checkCateRoomNameExist(roomCategory.getCatRoomName())) {
			model.addAttribute("messageCateRoom", "Room Category name is existed");
		} else {
			boolean status = roomService.addRoomCategory(roomCategory);
			
			if (status) {
				model.addAttribute("msg", "success");
			}
			else {
				model.addAttribute("msgF", "failed");
			}
		}

		List<RoomCategory> list = roomService.findAllRoomCate();
		mav.addObject("listRoomCate", list);
		return mav;
	}

	@RequestMapping(value = "/editCategoryRoom", method = RequestMethod.POST)
	public ModelAndView editRoomCategory(@RequestParam("exCategoryRoom") String categoryName, Model model,
			@RequestParam("capacity") int capacity, @RequestParam("categoryRoom") String catRoomName) {
		ModelAndView mav = new ModelAndView("returnRoomCate");
		model.addAttribute("roomCateAttribute", new RoomCategory());

		RoomCategory roomCategory = roomService.findRoomCategoryByCateName(categoryName);

		if (!categoryName.equals(catRoomName)) {
			roomCategory.setCatRoomName(catRoomName);
			roomCategory.setCapacity(capacity);
		}
		else {
			roomCategory.setCapacity(capacity);
		}
		

		boolean status = roomService.updateRoomCateogory(roomCategory);
		
		if (status) {
			model.addAttribute("msg", "success");
		}
		else {
			model.addAttribute("msgF", "failed");
			model.addAttribute("messageEditCateRoom", "Category name is existed");
		}

		List<RoomCategory> list = roomService.findAllRoomCate();
		mav.addObject("listRoomCate", list);
		return mav;
	}

	@RequestMapping(value = "/deleteRoomCategory/{id}", method = RequestMethod.GET)
	public ModelAndView deleteRoomCategory(@PathVariable("id") String id, Model model) {
		ModelAndView mav = new ModelAndView("returnRoomCate");

		boolean status = roomService.deleteCateogory(Integer.parseInt(id));
		model.addAttribute("roomCateAttribute", new RoomCategory());
		
		if (status) {
			model.addAttribute("msg", "success");
		}
		else {
			model.addAttribute("msgF", "failed");
		}
		
		List<RoomCategory> list = roomService.findAllRoomCate();
		mav.addObject("listRoomCate", list);

		return mav;
	}
}
