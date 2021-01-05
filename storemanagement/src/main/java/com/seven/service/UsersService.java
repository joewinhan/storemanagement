package com.seven.service;

import java.util.List;

import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.Users;

public interface UsersService {

	//查询所有用户
	List<Users> showAll();
	
	//通过用户名密码查询用户
	MsgResult selByUsers(Users users);
	
	EasyUIDatagrid showAllUsers(int pageSize,int pageNumber);
	
	//添加用户
	MsgResult insertUser(Users user);
	
	//修改用户
	MsgResult updateUser(Users user);
	
	//逻辑删除用户
	MsgResult deleteUser(String id);
}
