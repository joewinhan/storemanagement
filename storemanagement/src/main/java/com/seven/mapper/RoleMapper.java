package com.seven.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.seven.pojo.Role;

public interface RoleMapper {

	@Select("select *from role where status=1 limit #{0},#{1}")
	List<Role> selByPage(int pageStart,int pageSize);
	
	@Select("select count(*) from role where status=1")
	int selCount();
	
	@Update("update role set name=#{name},status=#{status},remark=#{remark} where id=#{id}")
	int upadate(Role role);
	
	//查询所有角色
	@Select("select *from role where status=1")
	List<Role> selAll();

	//添加角色
	@Insert("insert into role values(default,#{name},#{status},#{remark})")
	int insRole(Role role);
	
	//根据Id修改status
	@Update("update role set status=0 where id=#{0}")
	int deleteRole(int id);
	
}
