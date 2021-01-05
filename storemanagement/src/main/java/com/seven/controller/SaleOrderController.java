package com.seven.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.SaleOrder;
import com.seven.pojo.Store;
import com.seven.service.SaleOrderService;

@Controller
public class SaleOrderController {

	@Resource
	private SaleOrderService saleOrderServiceImpl;
	
	@RequestMapping("page/showSaleOrderByStatus")
	@ResponseBody
	public EasyUIDatagrid showSaleOrder(@RequestParam(defaultValue="8") int rows,@RequestParam(defaultValue="1") int page,@RequestParam(defaultValue="1") int status) {
		return saleOrderServiceImpl.showAll(rows, page,status);
	}
	
	//根据搜索条件分页查询订单
	@RequestMapping("page/showSaleOrderByParams")
	@ResponseBody
	public EasyUIDatagrid showPurchaseOrderByParams(@RequestParam(defaultValue="8")int rows,@RequestParam(defaultValue="1")int page,String paramName,String paramValue) {
		return saleOrderServiceImpl.showByParameter(rows, page, paramName, paramValue);
	}
	
	@RequestMapping("page/addSaleOrder")
	@ResponseBody
	public MsgResult addSaleOrder(SaleOrder order,HttpServletRequest request) {
//		System.out.println("unitpirce=="+request.getParameter("price")+"cid=="+order.getCommodityId()+" customerId="+order.getCustomerId());
		return saleOrderServiceImpl.insertSaleorder(order,Double.parseDouble(request.getParameter("price")));
	}
	
	@RequestMapping("page/modifySaleOrderStatus")
	@ResponseBody
	public MsgResult modifyStatus(String id, int status, String amount, String cid) {
		return saleOrderServiceImpl.updateStatus(id, status, amount, cid);
				
	}
}
