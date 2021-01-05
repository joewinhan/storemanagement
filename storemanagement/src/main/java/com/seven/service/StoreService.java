package com.seven.service;

import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.Store;

public interface StoreService {

	//分页查询所有商品库存信息
	EasyUIDatagrid showAll(int pageSize,int pageNumber);
	
	//插入一个商品的库存信息
	MsgResult insertStore(Store store);
	
	//更新商品的库存信息
	MsgResult updStockBalance(Store store);

	//根据商品Id查询库存信息
	Store selectByCid(String cid);
	
	//根据条件分页查找商品库存信息
	EasyUIDatagrid showStoreByParams(int pageSize,int pageNumber,String paramName,String paramValue);
	
}
