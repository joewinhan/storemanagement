package com.seven.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seven.pojo.Commodity;
import com.seven.pojo.EasyUICombobox;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.service.CommodityService;

@Controller
public class CommodityController {

	@Resource
	private CommodityService commodityServiceImpl;
	
	@RequestMapping("page/showCommodity")
	@ResponseBody
	public EasyUIDatagrid showCommodity(@RequestParam(defaultValue="6")int rows,@RequestParam(defaultValue="1")int page) {
		return commodityServiceImpl.showAll(rows, page);
	}
	
	@RequestMapping("page/addCommodity")
	@ResponseBody
	public MsgResult addCommodity(HttpServletRequest request) {
		Commodity commodity = new Commodity();
		commodity.setName(request.getParameter("commodityName"));
		commodity.setPlace(request.getParameter("place"));
		commodity.setPrice(Double.parseDouble(request.getParameter("price")));
		commodity.setSupplierId(Integer.parseInt(request.getParameter("supplier")));
		commodity.setStatus(1);
		return commodityServiceImpl.insertCommodity(commodity);
	}
	
	//添加采购订单选择商品时查询所有商品
	@RequestMapping("page/comboboxCommodity")
	@ResponseBody
	public List<EasyUICombobox> showAll(){
		return commodityServiceImpl.selAll();
	}
	//添加销售订单时选择商品时查询所有有库存的商品
	@RequestMapping("page/comboboxCommodityWithBalance")
	@ResponseBody
	public List<EasyUICombobox> showAllWithBalance(){
		return commodityServiceImpl.selAllWithBalance();
	}
	
	@RequestMapping("page/deleteCommodity")
	@ResponseBody
	public MsgResult delCommodity(String id) {
		return commodityServiceImpl.deleteCommodity(id);
	}
	
	@RequestMapping("page/modifyCommodity")
	@ResponseBody
	public MsgResult modifyCommodity(Commodity commodity) {
		return commodityServiceImpl.modify(commodity);
		
	}
	
	@RequestMapping("page/showCommodityPrice")
	@ResponseBody
	public Commodity showPrice(String id) {
		return commodityServiceImpl.selCommodityPrice(id);
	}
}
