package com.seven.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.Store;
import com.seven.service.StoreService;

@Controller
public class StoreController {
	
	@Resource
	private StoreService storeServiceImpl;

	@RequestMapping("page/showCommodityStockBalance")
	@ResponseBody
	public Store showStockBalance(String cid) {
		return storeServiceImpl.selectByCid(cid);
	}
	
	@RequestMapping("page/showAllCommodityStockBalance")
	@ResponseBody
	public EasyUIDatagrid showAllStore(@RequestParam(defaultValue="8")int rows,@RequestParam(defaultValue="1")int page) {
		return storeServiceImpl.showAll(rows, page);
	}
	
	//根据搜索条件分页查询库存
	@RequestMapping("page/showStoreByParams")
	@ResponseBody
	public EasyUIDatagrid showStoreByParams(@RequestParam(defaultValue="8")int rows,@RequestParam(defaultValue="1")int page,String paramName,String paramValue) {
		return storeServiceImpl.showStoreByParams(rows, page, paramName, paramValue);
	}
}
