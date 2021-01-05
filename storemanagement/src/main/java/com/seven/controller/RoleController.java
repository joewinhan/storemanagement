package com.seven.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seven.pojo.EasyUICombobox;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.Menu;
import com.seven.pojo.MsgResult;
import com.seven.pojo.Role;
import com.seven.service.RoleService;

@Controller
public class RoleController {

	@Resource
	private RoleService roleServiceImpl;
	
	@RequestMapping("page/showRole")
	@ResponseBody
	public EasyUIDatagrid showRole(@RequestParam(defaultValue="6")int rows,@RequestParam(defaultValue="1")int page){
		return roleServiceImpl.showAll(rows, page);
	}
	
	@RequestMapping("page/modifyRole")
	@ResponseBody
	public MsgResult updateRole(Role role) {
		return roleServiceImpl.updateRole(role);
	}
	
	@RequestMapping("showPrivilege")
	@ResponseBody
	public List<Menu> showPrivilege(int id){
		return roleServiceImpl.showPrivilege(id);
	}
	//修改角色的权限
	@RequestMapping("page/modifyPrivilege")
	@ResponseBody
	public MsgResult modifyPrivilege(int rid,String names) {
		
		return roleServiceImpl.updPrivilege(names, rid);
	}
	
	@RequestMapping("page/showAllRole")
	@ResponseBody
	public List<EasyUICombobox> showComboboxUser(){
		return roleServiceImpl.selComboboxUser();
	}
	
	//添加角色
	@RequestMapping("page/addRole")
	@ResponseBody
	public MsgResult addRole(Role role) {
		return roleServiceImpl.insertRole(role);
	}
	
	//逻辑删除角色
	@RequestMapping("page/deleteRole")
	@ResponseBody
	public MsgResult deleteRole(String id) {
		return roleServiceImpl.deleteRole(id);
	}
}
