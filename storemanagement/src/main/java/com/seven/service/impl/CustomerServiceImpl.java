package com.seven.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seven.mapper.CustomerMapper;
import com.seven.pojo.Customer;
import com.seven.pojo.EasyUICombobox;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Resource
	private CustomerMapper customerMapper;
	
	@Override
	public EasyUIDatagrid showAll(int pageSize, int pageNumber) {
		EasyUIDatagrid dataGrid = new EasyUIDatagrid();
		dataGrid.setRows(customerMapper.selByPage(pageSize*(pageNumber-1), pageSize));
		dataGrid.setTotal(customerMapper.selCount());
		return dataGrid;
	}

	@Override
	public MsgResult insertCustomer(Customer customer) {
		MsgResult result = new MsgResult();
		customer.setStatus(1);
		int index = customerMapper.insCustomer(customer);
		if(index ==1) {
			result.setMsg("添加成功！");
			result.setStatus(200);
		}else {
			result.setMsg("添加失败！！");
		}
		return result;
	}

	@Override
	public MsgResult updateCustomer(Customer customer) {
		MsgResult result = new MsgResult();
		int index = customerMapper.updCustomer(customer);
		if(index==1) {
			result.setStatus(200);
			result.setMsg("修改成功！");
		}else {
			result.setMsg("修改失败！");
		}
		return result;
	}

	@Override
	public MsgResult deleteCustomer(String id) {
		MsgResult result = new MsgResult();
		String[] ids = id.split(",");
		boolean flag =false;
		for(int i = 0;i<ids.length;i++) {
			int index = customerMapper.delCustomer((Integer.parseInt(ids[i])));
			if(index !=1)
				flag =true;
		}
		if(!flag) {
			result.setStatus(200);
			result.setMsg("操作成功！");
		}else {
			result.setMsg("操作失败！");
		}
		return result;
	}

	@Override
	public List<EasyUICombobox> selComboboxCustomer() {
		List<Customer> customerLists = customerMapper.selAll();
		List<EasyUICombobox> cbxLists = new ArrayList<EasyUICombobox>();
		for(Customer customer:customerLists) {
			EasyUICombobox cbx = new EasyUICombobox();
			cbx.setId(customer.getId());
			cbx.setText(customer.getName());
			cbxLists.add(cbx);
		}
		return cbxLists;
	}
}
