package com.seven.service;

import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.SaleOrder;

public interface SaleOrderService {

	EasyUIDatagrid showAll(int pageSize,int pageNumber,int status);

	//添加销售订单
	MsgResult insertSaleorder(SaleOrder order,double price);
	
	//修改订单状态
	MsgResult updateStatus(String id,int status,String amount,String cid);
	
	//根据搜索条件模糊查询已完成的订单
	EasyUIDatagrid showByParameter(int pageSize, int pageNumber,String paramName, String paramValue);
}
