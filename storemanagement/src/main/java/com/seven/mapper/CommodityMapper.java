package com.seven.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.seven.pojo.Commodity;

public interface CommodityMapper {

	//分页查询商品
	@Select("select *from commodity where status=1 limit #{0},#{1} ")
	List<Commodity> selByPage(int pageStart,int pageSize);
	
	//查询商品数目
	@Select("select count(*) from commodity where status=1")
	int selCount();
	
	//添加商品
	@Insert("insert into commodity values(#{id},#{name},#{price},#{supplierId},#{place},#{status})")
	int addCommodity(Commodity commodity);
	
	//添加销售订单时要查询仓库中有库存的所有商品
	@Select("select *from commodity where id in(select commodityId from stores where stockBalance>0) and status=1")
	List<Commodity> selAllCommodityWithBalance();
	
	//添加采购订单时查询所有商品
	@Select("select *from commodity where status = 1")
	List<Commodity> selAllCommodity();
	//根据ID查询商品
	@Select("select *from commodity where id=#{0} and status =1")
	Commodity selById(String id);
	
	//根据ID逻辑删除商品
	@Update("update commodity set status = 0 where id=#{0}")
	int delById(String id);
	
	//修改商品信息
	@Update("update commodity set name=#{name},status=#{status},price=#{price},place=#{place},status=#{status},supplierId=#{supplierId} where id=#{id}")
	int updateCommodity(Commodity commodity);

	//根据commodityId和supplierId查询商品
	@Select("select *from commodity where id=#{0} and supplierId=#{1}")
	Commodity selByCidAndPid(String id, int supplierId);
	
}
