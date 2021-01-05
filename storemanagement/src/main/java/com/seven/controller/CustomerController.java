package com.seven.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seven.pojo.Customer;
import com.seven.pojo.EasyUICombobox;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.service.CustomerService;

@Controller
public class CustomerController {

	@Resource
	private CustomerService customerServiceImpl;
	
	@RequestMapping("page/showCustomer")
	@ResponseBody
	public EasyUIDatagrid showCustomer(@RequestParam(defaultValue="6")int rows,@RequestParam(defaultValue="1")int page) {
		return customerServiceImpl.showAll(rows, page);
	}
	
	@RequestMapping("page/modifyCustomer")
	@ResponseBody
	public MsgResult modifyCustomer(Customer customer) {
		return customerServiceImpl.updateCustomer(customer);
	}
	
	@RequestMapping("page/deleteCustomer")
	@ResponseBody
	public MsgResult deleteCustomer(String id) {
		return customerServiceImpl.deleteCustomer(id);
	}
	
	@RequestMapping("page/addCustomer")
	@ResponseBody
	public MsgResult addCustomer(Customer customer) {
		return customerServiceImpl.insertCustomer(customer);
	}
	
	@RequestMapping("page/comboboxCustomer")
	@ResponseBody
	public List<EasyUICombobox> showComboxCustomer(){
		return customerServiceImpl.selComboboxCustomer();
	}
}
