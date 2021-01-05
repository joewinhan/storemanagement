package com.seven.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.seven.pojo.Users;

public interface UsersMapper {

	//查询全部
	@Select("select *from users where status=1")
	List<Users> selAll();
	
	@Select("select *from users where username=#{username} and password=#{password} and status=1")
	Users selByUsers(Users users);
	
	//分页查询所有用户
	@Select("select *from users where status=1 limit #{0},#{1}")
	List<Users> selByPage(int pageStart,int pageSize);
	
	//查询用户数目
	@Select("select count(*) from users where status=1")
	int selCount();
	
	//根据用户名查看数据
	@Select("select *from users where username=#{0}")
	Users selByUsername(String username);
	//添加账号信息
	@Insert("insert into users values(default,#{username},#{password},#{roleId},#{status})")
	int insUser(Users user);
	
	//修改账号信息
	@Update("update users set password=#{password},roleId=#{roleId} where id=#{id}")
	int updUser(Users user);
	
	//逻辑删除账号
	@Update("update users set status=0 where id=#{id}")
	int delUser(int id);
}
