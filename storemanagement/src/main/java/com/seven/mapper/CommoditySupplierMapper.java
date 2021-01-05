package com.seven.mapper;

import org.apache.ibatis.annotations.Insert;

public interface CommoditySupplierMapper {

	//添加一条商品与供应商关联数据
	@Insert("insert into commodity_supplier values(default,#{0},#{1})")
	int insertOne(String cid,int sid);
	
}
