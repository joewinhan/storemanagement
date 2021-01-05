package com.seven.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.seven.pojo.Supplier;

public interface SupplierMapper {

	//根据ID查询供应商
	@Select("select *from supplier where id =#{0} and status =1")
	Supplier selByID(int id);
	
	//分页查询所有供应商
	@Select("select *from supplier where status=1 limit #{0},#{1}")
	List<Supplier> selByPage(int pageStart,int pageSize);
	
	//查询供应商数目
	@Select("select count(*) from supplier where status=1")
	int selCount();
	
	//查询所有供应商
	@Select("select *from supplier where status=1")
	List<Supplier> selAll();
	
	//根据commodityId查询供应商
	@Select("select *from supplier where id in (select sid from commodity_supplier where cid =#{0}) and status =1")
	List<Supplier> selByCommodityId(String commodityId);
	
	//插入Supplier
	@Insert("insert into supplier values(default,#{name},#{address},#{reputation},#{phoneNum},#{status})")
	int addSupplier(Supplier supplier);
	
	//根据ID删除记录
	@Update("update supplier set status =0 where id=#{0}")
	int deleteSupplier(int id);
	
	//修改供应商信息
	@Update("update supplier set name=#{name},address=#{address},reputation=#{reputation},phoneNum=#{phoneNum} where id=#{id}")
	int updateSupplier(Supplier supplier);
}
