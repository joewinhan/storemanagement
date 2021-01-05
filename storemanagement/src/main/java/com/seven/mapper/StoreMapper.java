package com.seven.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.seven.pojo.Store;


public interface StoreMapper {

	//分页查询所有商品库存信息
	@Select("select *from stores limit #{0},#{1}")
	List<Store> selByPage(int pageStart,int pageSize);
	
	//查询库存数目
	@Select("select count(*) from stores")
	int selCount();
	
	//插入一条商品的库存信息
	@Insert("insert into stores values(#{id},#{commodityId},#{stockBalance},#{status})")
	int insertStore(Store store);
	
	//出入库时修改商品的库存量
	@Update("update stores set stockBalance=#{stockBalance} where commodityId=#{commodityId}")
	int updateStockBalance(Store store);
	
	//根据商品ID查询库存信息
	@Select("select *from stores where commodityId=#{0}")
	Store selByCid(String cid);
	
	//根据status字段分页查找库存信息
	@Select("select *from stores where status=#{2} limit #{0},#{1}")
	List<Store> selByStatus(int pageStart,int pageSize,int paramValue);
	@Select("select count(*) from stores where status=#{0}")
	int selCountByStatus(int status);
	
	//根据商品名模糊查询库存信息
	@Select("select *from stores where commodityId in(select id from commodity where name like CONCAT('%',#{2},'%') and status=1) limit #{0},#{1}")
	List<Store> selByCname(int pagetStart,int pageSize,String paramValue);
	@Select("select count(*) from stores where commodityId in(select id from commodity where name like CONCAT('%',#{0},'%') and status=1)")
	int selCountByCname(String paramValue);
}
