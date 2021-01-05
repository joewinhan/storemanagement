package com.seven.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seven.pojo.Menu;
import com.seven.pojo.Users;
import com.seven.service.MenuService;

@Controller
public class MenuController {

	@Resource
	private MenuService menuServiceImpl;
	
	@RequestMapping("page/showMenu")
	@ResponseBody
	public List<Menu> showMenu(){
		return menuServiceImpl.selAll();
	}
	
	@RequestMapping("showRoleMenu")
	@ResponseBody
	public List<Menu> showRoleMenu(int rid){
		return menuServiceImpl.selRoleMenu(rid);
	}
	
	@RequestMapping("main")
	public String redirectMain(int rid,String username,Model model) {
		model.addAttribute("rid", rid);
		model.addAttribute("username", username);
		return "page/main.jsp";
	}
	
}
