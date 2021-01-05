package com.seven.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seven.pojo.EasyUICombobox;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.Supplier;
import com.seven.service.SupplierService;

@Controller
public class SupplierController {
	@Resource
	private SupplierService supplierServiceImpl;
	
	@RequestMapping("page/showSupplier")
	@ResponseBody
	public EasyUIDatagrid showAll(@RequestParam(defaultValue="6")int rows,@RequestParam(defaultValue="1")int page) {
		return supplierServiceImpl.showAll(rows, page);
	}
	
	@RequestMapping("page/comboboxSupplier")
	@ResponseBody
	public List<EasyUICombobox> showCombobox(String commodityId){
		return supplierServiceImpl.selByCommodityId(commodityId);
	}
	
	@RequestMapping("page/showAllSupplier")
	@ResponseBody
	public List<EasyUICombobox> showAllSupplier(){
		return supplierServiceImpl.selAll();
	}
	
	@RequestMapping("page/addSupplier")
	@ResponseBody
	public MsgResult addSupplier(Supplier supplier) {
		return supplierServiceImpl.insertSupplier(supplier);
	}
	
	@RequestMapping("page/deleteSupplier")
	@ResponseBody
	public MsgResult delSupplier(String id) {
		return supplierServiceImpl.deleteSupplier(id);
	}
	
	@RequestMapping("page/modifySupplier")
	@ResponseBody
	public MsgResult delSupplier(Supplier supplier) {
		return supplierServiceImpl.updateSupplier(supplier);
	}
}
