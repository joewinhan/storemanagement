package com.seven.service;

import java.util.List;

import com.seven.pojo.Customer;
import com.seven.pojo.EasyUICombobox;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;

public interface CustomerService {

	//分页查询所有客户信息
	EasyUIDatagrid showAll(int pageSize,int pageNumber);
	
	//添加客户
	MsgResult insertCustomer(Customer customer);
	
	//修改客户信息
	MsgResult updateCustomer(Customer customer);
	
	//逻辑删除客户信息
	MsgResult deleteCustomer(String id);
	
	//下拉框选择客户
	List<EasyUICombobox> selComboboxCustomer();
}
