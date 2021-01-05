package com.seven.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.Users;
import com.seven.service.UsersService;

@Controller
public class UsersController {

	@Resource
	private UsersService usersServiceImpl;
	
	@RequestMapping("page/showUsers")
	@ResponseBody
	public EasyUIDatagrid showUsers(@RequestParam(defaultValue="6") int rows,@RequestParam(defaultValue="1") int page) {
		return usersServiceImpl.showAllUsers(rows, page);
	}
	
	@RequestMapping("login")
	@ResponseBody
	public MsgResult login(Users users,Model model) {
		MsgResult result = usersServiceImpl.selByUsers(users);
		return result;
	}
	
	@RequestMapping("page/addUser")
	@ResponseBody
	public MsgResult addUser(Users user) {
		return usersServiceImpl.insertUser(user);
	}
	
	@RequestMapping("page/modifyUser")
	@ResponseBody
	public MsgResult updUsers(Users user) {
		return usersServiceImpl.updateUser(user);
	}
	
	@RequestMapping("page/deleteUser")
	@ResponseBody
	public MsgResult delUsers(String id) {
		return usersServiceImpl.deleteUser(id);
	}
}
