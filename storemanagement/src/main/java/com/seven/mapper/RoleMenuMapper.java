package com.seven.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.seven.pojo.RoleMenu;

public interface RoleMenuMapper {

	//插入数据
	@Insert("insert into role_menu values(default,#{0},#{1})")
	int insertOne(int rid,int mid);
	
	//根据rid和mid来查找数据
	@Select("select *from role_menu where rid=#{0} and mid=#{1}")
	RoleMenu selectByRidMid(int rid,int mid);
	
}
