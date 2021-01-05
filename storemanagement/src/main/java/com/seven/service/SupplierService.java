package com.seven.service;

import java.util.List;

import com.seven.pojo.EasyUICombobox;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.Supplier;

public interface SupplierService {

	//根据ID查询供应商
	Supplier queryById(int id);
	
	//分页查询所有供应商信息
	EasyUIDatagrid showAll(int pageSize,int pageNumber);
	
	//下拉框根据商品查询供应商信息
	List<EasyUICombobox> selByCommodityId(String commodityId);
	
	//下拉框查询所有供应商
	List<EasyUICombobox> selAll();
	
	//添加supplier
	MsgResult insertSupplier(Supplier supplier);
	
	//删除Supplier
	MsgResult deleteSupplier(String id);
	
	//修改Supplier
	MsgResult updateSupplier(Supplier supplier);
}
