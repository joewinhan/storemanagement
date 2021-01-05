package com.seven.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.seven.pojo.PurchaseOrder;

public interface PurchaseOrderMapper {

	//分页查询所有采购订单信息
	@Select("select *from purchase_order limit #{0},#{1}")
	List<PurchaseOrder> selByPage(int pageStart,int pageSize);
	
	//查询采购订单数目
	@Select("select count(*) from purchase_order")
	int selCount();
	
	//插入新的采购订单
	@Insert("insert into purchase_order values(#{id},#{createtime},#{finishtime},#{supplierId},#{price},#{status},#{amount},#{commodityId})")
	int insertPurchaseOrder(PurchaseOrder order);
	
	//修改订单信息
	@Update("update purchase_order set finishtime=#{finishtime},supplierId=#{supplierId},price=#{price},status=#{status},amount=#{amount},commodityId=#{commodityId} where id=#{id}")
	int updatePurchaseOrder(PurchaseOrder order);
	
	//分页查询所有待采购审核的订单，即status=1的订单
	@Select("select *from purchase_order where status=1 limit #{0},#{1}")
	List<PurchaseOrder> selStatusEq1(int pageStart,int pageSize);
	
	//查询所有status=1的订单的数目
	@Select("select count(*) from purchase_order where status=1")
	int SelCountStatusEq1();
	
	//分页查询所有待入库审核的订单，即status=2的订单
	@Select("select *from purchase_order where status=2 limit #{0},#{1}")
	List<PurchaseOrder> selStatusEq2(int pageStart,int pageSize);
	
	//根据status字段分页插叙
	@Select("select *from purchase_order where status=#{2} limit #{0},#{1}")
	List<PurchaseOrder> selByPageStatus(int pageStart,int pageSize,int status);
	@Select("select count(*) from purchase_order where status=#{0}")
	int SelCountByStatus(int status);
	
	//查询所有status=1的订单的数目
	@Select("select count(*) from purchase_order where status=2")
	int SelCountStatusEq2();
	
	//根据订单Id修改status字段
	@Update("update purchase_order set status=#{1} where id=#{0}")
	int updStatus(String id,int status);

	//根据Id查询订单
	@Select("select *from purchase_order where id=#{0}")
	PurchaseOrder selById(String id);

	/**1.根据商品名去commodity表中找到所有的商品Id
	2.再去purchase_order表中找到商品id对应的订单
	 **/
	@Select("select *from purchase_order where commodityId in(select id from commodity where name like CONCAT('%',#{2},'%') and status=1) and status=5 limit #{0},#{1}")
	List<PurchaseOrder> selPageByCname(int pageStart, int pageSize, String paramValue);
	@Select("select count(*) from purchase_order where commodityId in(select id from commodity where name like CONCAT('%', #{0},'%') and status=1) and status=5 ")
	int selCountByCname(String paramValue);
	
	/**1.根据商品名去supplier表中找到所有的supplierId
	2.再去purchase_order表中找到supplierid对应的订单
	 **/
	@Select("select *from purchase_order where supplierId in(select id from supplier where name like CONCAT('%',#{2},'%') and status=1) and status=5 limit #{0},#{1}")
	List<PurchaseOrder> selPageBySname(int pageStart, int pageSize, String paramValue);
	@Select("select count(*) from purchase_order where supplierId in(select id from supplier where name like CONCAT('%', #{0},'%') and status=1) and status=5")
	int selCountBySname(String paramValue);
}
