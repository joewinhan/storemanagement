package com.seven.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.seven.pojo.Menu;


public interface MenuService {

	//查询出所有菜单
	List<Menu> selAll();
	
	//查询出用户角色对应的菜单
	List<Menu> selRoleMenu(int rid);
}
