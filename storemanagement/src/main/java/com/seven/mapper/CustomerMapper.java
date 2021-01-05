package com.seven.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.seven.pojo.Customer;

public interface CustomerMapper {

	//分页查询所有客户
	@Select("select *from customer where status =1 limit #{0},#{1}")
	List<Customer> selByPage(int pageStart,int pageSize);
	
	//查询客户数目
	@Select("select count(*) from customer where status =1")
	int selCount();
	
	//查询所有客户
	@Select("select *from customer where status =1")
	List<Customer> selAll();
	
	//添加客户
	@Insert("insert into customer values(default,#{name},#{address},#{reputation},#{priority},#{phoneNum},#{status})")
	int insCustomer(Customer customer);
	
	//修改客户信息
	@Update("update customer set name=#{name},address=#{address},reputation=#{reputation},priority=#{priority},phoneNum=#{phoneNum} where id=#{id}")
	int updCustomer(Customer customer);
	
	//逻辑删除客户
	@Update("update customer set status=0 where id=#{0}")
	int delCustomer(int id);
}
