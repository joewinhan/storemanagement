package com.seven.service;

import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.PurchaseOrder;

public interface PurchaseOrderService {

	EasyUIDatagrid showAll(int pageSize,int pageNumber);
	
	//添加采购订单
	MsgResult insertPurchaseOrder(PurchaseOrder order);
	
	//修改订单信息
	MsgResult updPurchaseOrder(PurchaseOrder order);
	
	//查询所有待采购审核的订单
	EasyUIDatagrid showAllStatusEq1(int pageSize,int pageNumber);
	
	//查询所有待入库审核的订单
	EasyUIDatagrid showAllStatusEq2(int pageSize,int pageNumber);
	
	//根据Status分页查询订单
	EasyUIDatagrid showAllByStatus(int pageSize,int pageNumber,int status);
	
	//修改订单状态
	MsgResult updateStatus(String id,int status,String amount,String cid);
	
	//根据搜索条件模糊查询已完成的订单
	EasyUIDatagrid showByParameter(int pageSize, int pageNumber,String paramName, String paramValue);
}
