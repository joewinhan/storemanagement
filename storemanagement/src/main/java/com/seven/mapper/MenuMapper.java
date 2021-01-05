package com.seven.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.seven.pojo.Menu;

public interface MenuMapper {

	//查询所有一级菜单
	@Select("select *from menu where pid=0")
	List<Menu> selAll();
	
	//查询所有一级菜单下的二级菜单
	@Select("select *from menu where pid=#{0}")
	List<Menu> selByPid(int pid);
	
	@Select("select *from menu where pid=#{0} and id in (select mid from role_menu where rid=#{1})")
	List<Menu> selByPidRid(int pid,int rid);
	
	//根据rid到role_menu中查询到mid，然后在根据mid去menu中查询到menu
	@Select("select *from menu where mid in(select mid from role_menu where rid =#{0})")
	List<Menu> selByRid(int rid);
	
	//根据name查找Id
	@Select("select id from menu where name=#{0}")
	int selIdByName(String name);
}
