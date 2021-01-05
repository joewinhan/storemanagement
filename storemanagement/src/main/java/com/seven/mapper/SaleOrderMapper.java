package com.seven.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.seven.pojo.PurchaseOrder;
import com.seven.pojo.SaleOrder;

public interface SaleOrderMapper {
	
	//根据status分页查询所有销售订单
	@Select("select *from sale_order where status=#{2} limit #{0},#{1}")
	List<SaleOrder> selByPage(int pageStart,int pageSize,int status);
	
	//根据status查询销售订单数目
	@Select("select count(*) from sale_order where status=#{0}")
	int selCount(int status);
	
	//根据Id查询订单
	@Select("select *from sale_order where id=#{0}")
	SaleOrder selByid(String id);
	
	//添加一条销售订单
	@Insert("insert into sale_order values(#{id},#{createtime},#{finishtime},#{status},#{commodityId},#{price},#{customerId},#{amount})")
	int insertSaleOrder(SaleOrder order);

	//更新status字段
	@Update("update sale_order set status=#{1} where id=#{0}")
	int updStatus(String id, int status);
	
	//更新订单信息
	@Update("update sale_order set finishtime=#{finishtime},status=#{status},price=#{price},amount=#{amount} where id=#{id}")
	int updateSaleOrder(SaleOrder order);
	
	/**1.根据商品名去commodity表中找到所有的商品Id
	2.再去sale_order表中找到商品id对应的订单
	 **/
	@Select("select *from sale_order where commodityId in(select id from commodity where name like CONCAT(CONCAT('%',#{2}),'%') and status=1) and status=4 limit #{0},#{1}")
	List<SaleOrder> selPageByCommodityName(int pageStart, int pageSize, String paramValue);
	@Select("select count(*) from sale_order where commodityId in(select id from commodity where name like CONCAT(CONCAT('%', #{0}), '%') and status=1) and status=4 ")
	int selCountByCommodityName(String paramValue);
	
	/**1.根据客户名名去customer表中找到所有的customerid
	2.再去sale_order表中找到customerid对应的订单
	 **/
	@Select("select *from sale_order where customerId in(select id from customer where name like CONCAT(CONCAT('%',#{2}),'%') and status=1) and status=4 limit #{0},#{1}")
	List<SaleOrder> selPageByCustomername(int pageStart, int pageSize, String paramValue);
	@Select("select count(*) from sale_order where customerId in(select id from customer where name like CONCAT(CONCAT('%', #{0}), '%') and status=1) and status=4")
	int selCountByCustomername(String paramValue);
}
