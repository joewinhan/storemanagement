package com.seven.service;

import java.util.List;

import com.seven.pojo.EasyUICombobox;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.Menu;
import com.seven.pojo.MsgResult;
import com.seven.pojo.Role;

public interface RoleService {

	EasyUIDatagrid showAll(int pageSize,int pageNumber);
	
	MsgResult updateRole(Role role);
	
	List<Menu> showPrivilege(int rid);
	
	List<EasyUICombobox> selComboboxUser();
	
	//根据菜单名称和roleId修改权限
	MsgResult updPrivilege(String menuName,int rid);

	MsgResult insertRole(Role role);
	
	//逻辑删除
	MsgResult deleteRole(String id);
}
