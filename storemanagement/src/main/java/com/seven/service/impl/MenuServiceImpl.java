package com.seven.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seven.mapper.MenuMapper;
import com.seven.pojo.Attributes;
import com.seven.pojo.Menu;
import com.seven.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Resource
	private MenuMapper menuMapper;
	
	@Override
	public List<Menu> selAll() {
		List<Menu> list = menuMapper.selAll();
		for (Menu menu : list) {
			List<Menu> listChildren = menuMapper.selByPid(menu.getId());
			for (Menu child : listChildren) {
				Attributes att = new Attributes();
				att.setFilename(child.getFilename());
				child.setAttributes(att);
			}
			menu.setChildren(listChildren);
		}
		return list;
	}

	@Override
	public List<Menu> selRoleMenu(int rid) {
		List<Menu> list = menuMapper.selByPidRid(0, rid);
		for(Menu menu:list) {
			List<Menu> listChildren = menuMapper.selByPid(menu.getId());
			for(Menu child:listChildren) {
				Attributes att = new Attributes();
				att.setFilename(child.getFilename());
				child.setAttributes(att);
			}
			menu.setChildren(listChildren);
		}
		
		return list;
	}

	
	
}
