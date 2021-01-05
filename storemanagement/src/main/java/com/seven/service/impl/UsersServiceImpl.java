package com.seven.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seven.mapper.UsersMapper;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.Users;
import com.seven.service.UsersService;

@Service
public class UsersServiceImpl implements UsersService{

	@Resource
	private UsersMapper usersMapper;
	
	@Override
	public List<Users> showAll() {
		return usersMapper.selAll();
	}

	@Override
	public MsgResult selByUsers(Users users) {
		MsgResult result = new MsgResult();
		Users u = usersMapper.selByUsers(users);
		if(u!=null) {
			result.setStatus(200);
			result.setData(u);
			result.setMsg("登陆成功！");
		}
		return result;
	}

	@Override
	public EasyUIDatagrid showAllUsers(int pageSize, int pageNumber) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		datagrid.setRows(usersMapper.selByPage(pageSize*(pageNumber-1), pageSize));
		datagrid.setTotal(usersMapper.selCount());
		return datagrid;
	}

	@Override
	public MsgResult insertUser(Users user) {
		MsgResult result = new MsgResult();
		Users u = usersMapper.selByUsername(user.getUsername());
		if(u!=null) {
			result.setStatus(404);
			result.setMsg("用户名已存在！");
			return result;
		}
		user.setStatus(1);
		int index = usersMapper.insUser(user);
		if(index == 1) {
			result.setMsg("添加成功！");
			result.setStatus(200);
		}else {
			result.setMsg("添加失败！");
		}
		return result;
	}

	@Override
	public MsgResult updateUser(Users user) {
		MsgResult result = new MsgResult();
		int index = usersMapper.updUser(user);
		if(index ==1) {
			result.setMsg("修改成功");
			result.setStatus(200);
		}else {
			result.setMsg("修改失败！");
		}
		return result;
	}

	@Override
	public MsgResult deleteUser(String id) {
		MsgResult result = new MsgResult();
		String[] ids = id.split(",");
		boolean flag =false;
		for(int i = 0;i<ids.length;i++) {
			int index = usersMapper.delUser(Integer.parseInt(ids[i]));
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
