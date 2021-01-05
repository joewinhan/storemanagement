package com.seven.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.PurchaseOrder;
import com.seven.service.PurchaseOrderService;

@Controller
public class PurchaseOrderController {

	@Resource
	private PurchaseOrderService purchaseOrderServiceImpl;
	
	//查询所有订单
	@RequestMapping("page/showPurchaseOrder")
	@ResponseBody
	public EasyUIDatagrid showPurchaseOrder(@RequestParam(defaultValue="8")int rows,@RequestParam(defaultValue="1")int page) {
		return purchaseOrderServiceImpl.showAll(rows, page);
	}
	
	//查询所有待采购审核的订单
	@RequestMapping("page/showPurchaseOrderStatusEq1")
	@ResponseBody
	public EasyUIDatagrid showPurchaseOrderStatus1(@RequestParam(defaultValue="8")int rows,@RequestParam(defaultValue="1")int page) {
		return purchaseOrderServiceImpl.showAllStatusEq1(rows, page);
	}
	
	//查询所有待入库审核的订单
	@RequestMapping("page/showPurchaseOrderStatusEq2")
	@ResponseBody
	public EasyUIDatagrid showPurchaseOrderStatus2(@RequestParam(defaultValue="8")int rows,@RequestParam(defaultValue="1")int page) {
		return purchaseOrderServiceImpl.showAllStatusEq2(rows, page);
	}
	
	//根据status分页查询订单
	@RequestMapping("page/showPurchaseOrderByStatus")
	@ResponseBody
	public EasyUIDatagrid showPurchaseOrderStatus(@RequestParam(defaultValue="8")int rows,@RequestParam(defaultValue="1")int page,int status) {
		return purchaseOrderServiceImpl.showAllByStatus(rows, page, status);
	}
	
	//根据搜索条件分页查询订单
	@RequestMapping("page/showPurchaseOrderByParams")
	@ResponseBody
	public EasyUIDatagrid showPurchaseOrderByParams(@RequestParam(defaultValue="8")int rows,@RequestParam(defaultValue="1")int page,String paramName,String paramValue) {
		return purchaseOrderServiceImpl.showByParameter(rows, page, paramName, paramValue);
	}
	
	
	//修改订单状态，以便达到入库审核，和采购审核的功能
	@RequestMapping("page/modifyPurchaseOrderStatus")
	@ResponseBody
	public MsgResult modifyStatus(String id,int status,String amount,String cid) {
		return purchaseOrderServiceImpl.updateStatus(id, status,amount,cid);
	}
	
	@RequestMapping("page/addPurchaseOrder")
	@ResponseBody
	public MsgResult addPurchaseOrder(HttpServletRequest request) {
		PurchaseOrder order = new PurchaseOrder();
		order.setCommodityId(request.getParameter("commodity"));
		order.setAmount(Double.parseDouble(request.getParameter("amount")));
		order.setSupplierId(Integer.parseInt(request.getParameter("supplier")));
		return purchaseOrderServiceImpl.insertPurchaseOrder(order);
	}
	
	@RequestMapping("page/modifyPurchaseOrder")
	@ResponseBody
	public MsgResult modifyPurchaseOrder(PurchaseOrder order) {
		System.out.println("id= "+order.getId()+" commodityId="+order.getCommodityId()+" supplierId="+order.getSupplierId()+" amount="+order.getAmount());
		return purchaseOrderServiceImpl.updPurchaseOrder(order);
	}
}
