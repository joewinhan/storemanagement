package com.seven.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seven.mapper.MenuMapper;
import com.seven.mapper.RoleMapper;
import com.seven.mapper.RoleMenuMapper;
import com.seven.pojo.EasyUICombobox;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.Menu;
import com.seven.pojo.MsgResult;
import com.seven.pojo.Role;
import com.seven.pojo.RoleMenu;
import com.seven.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{

	@Resource
	private RoleMapper roleMapper;
	@Resource
	private MenuMapper menuMapper;
	@Resource
	private RoleMenuMapper roleMenuMapper;
	
	@Override
	public EasyUIDatagrid showAll(int pageSize,int pageNumber) {
		EasyUIDatagrid data = new EasyUIDatagrid();
		 data.setRows(roleMapper.selByPage(pageSize*(pageNumber-1),pageSize));
		 data.setTotal(roleMapper.selCount());
		 return data;
	}

	@Override
	public MsgResult updateRole(Role role) {
		MsgResult result = new MsgResult();
		int index = roleMapper.upadate(role);
		if(index ==1) {
			result.setMsg("添加成功");
			result.setStatus(200);
		}else {
			result.setMsg("添加失败");
		}
		return result;
	}
	
	/*
	 * 返回所有的一级菜单和二级菜单，只不过当前角色他拥有什么二级菜单，那么这个这个角色的该二级菜单的checked属性设为true
	 * 所有的一级菜单的checked属性都不能设为True，因为EasyUI中一级菜单被选中后，它的二级菜单都会被选中
	 * 
	 */
	@Override
	public List<Menu> showPrivilege(int rid) {
		//当前角色拥有的所有一级菜单
		List<Menu> listParent = menuMapper.selByPidRid(0, rid);
		List<Menu> listRole = new ArrayList<>();
		for (Menu menu : listParent) {
			//将当前角色拥有的所有二级菜单存到listRole中
			listRole.addAll(menuMapper.selByPidRid(menu.getId(), rid));
		}
		//全部一级菜单
		List<Menu> listAll = menuMapper.selAll();
		for (Menu menu : listAll) {
			List<Menu> listChildren = menuMapper.selByPid(menu.getId());
			//遍历所有的二级菜单
			for (Menu menu1 : listChildren) {
				//遍历当前角色拥有的二级菜单
				for (Menu menu2 : listRole) {
					//将角色拥有的二级菜单的checked属性设为True
					if(menu2.getId()==menu1.getId()){
						menu1.setChecked(true);
					}
				}
			}
			menu.setChildren(listChildren);
		}
		return listAll;
	}

	@Override
	public List<EasyUICombobox> selComboboxUser() {
		List<Role> roleLists = roleMapper.selAll();
		List<EasyUICombobox> cbxLists = new ArrayList<EasyUICombobox>();
		for(Role role:roleLists) {
			EasyUICombobox cbx = new EasyUICombobox();
			cbx.setId(role.getId());
			cbx.setText(role.getName());
			cbxLists.add(cbx);
		}
		return cbxLists;
	}

	@Override
	public MsgResult updPrivilege(String menuName, int rid) {
		MsgResult result = new MsgResult();
		try {
			//解决 中文乱码的问题
			menuName = new String(menuName.getBytes("ISO8859_1"), "UTF-8");
			String names[] = menuName.split(",");
			for(int i=0;i<names.length;i++) {
				int mid = menuMapper.selIdByName(names[i]);
				//首先要看role_menu中是否已经有这条数据，如果有就不添加了
				RoleMenu rm = roleMenuMapper.selectByRidMid(rid, mid);
				if(rm!=null)
					continue;
				int index = roleMenuMapper.insertOne(rid, mid);
				if(index!=1) {
					result.setMsg("操作失敗");
					break;
				}
			}
			result.setStatus(200);
			result.setMsg("操作成功");
			return result;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public MsgResult insertRole(Role role) {
		MsgResult result = new MsgResult();
		role.setStatus(1);
		int index = roleMapper.insRole(role);
		if(index ==1) {
			result.setMsg("添加成功");
			result.setStatus(200);
		}else {
			result.setMsg("添加失败");
		}
		return result;
	}

	@Override
	public MsgResult deleteRole(String id) {
		MsgResult result = new MsgResult();
		String[] ids = id.split(",");
		boolean flag =false;
		for(int i = 0;i<ids.length;i++) {
			int index = roleMapper.deleteRole(Integer.parseInt(ids[i]));
			if(index !=1)
				flag =true;
		}
		if(!flag) {
			result.setStatus(200);
			result.setMsg("操作成功！");
		}else {
			result.setMsg("操作失败！");
		}
		return result;
	}
}
