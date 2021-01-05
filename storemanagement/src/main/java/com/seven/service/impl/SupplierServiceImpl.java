package com.seven.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seven.mapper.CommodityMapper;
import com.seven.mapper.SupplierMapper;
import com.seven.pojo.Commodity;
import com.seven.pojo.EasyUICombobox;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.Supplier;
import com.seven.service.SupplierService;

@Service
public class SupplierServiceImpl implements SupplierService {

	@Resource
	private SupplierMapper supplierMapper;
	@Resource
	private CommodityMapper commodityMapper;
	
	@Override
	public Supplier queryById(int id) {
		
		return supplierMapper.selByID(id);
	}

	@Override
	public EasyUIDatagrid showAll(int pageSize, int pageNumber) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		datagrid.setRows(supplierMapper.selByPage(pageSize*(pageNumber-1), pageSize));
		datagrid.setTotal(supplierMapper.selCount());
		return datagrid;
	}

	@Override
	public List<EasyUICombobox> selByCommodityId(String commodityId) {
		List<Supplier> supplierLists = supplierMapper.selByCommodityId(commodityId);
		List<EasyUICombobox> list = new ArrayList<EasyUICombobox>();
		for(Supplier supplier:supplierLists) {
			EasyUICombobox cbx = new EasyUICombobox();
			cbx.setId(supplier.getId());
			cbx.setText(supplier.getName());
			list.add(cbx);
		}
		return list;
	}

	@Override
	public List<EasyUICombobox> selAll() {
		List<Supplier> supplierLists = supplierMapper.selAll();
		List<EasyUICombobox> listsCombobox = new ArrayList<EasyUICombobox>();
		for(Supplier supplier:supplierLists) {
			EasyUICombobox cbx = new EasyUICombobox();
			cbx.setId(supplier.getId());
			cbx.setText(supplier.getName());
			listsCombobox.add(cbx);
		}
		return listsCombobox;
	}

	@Override
	public MsgResult insertSupplier(Supplier supplier) {
		MsgResult result = new MsgResult();
		supplier.setStatus(1);
		int index = supplierMapper.addSupplier(supplier);
		if(index ==1) {
			result.setStatus(200);
			result.setMsg("添加成功！");
		}else {
			result.setMsg("添加失败");
		}
		return result;
	}

	//删除Supplier
	@Override
	public MsgResult deleteSupplier(String id) {
		MsgResult result = new MsgResult();
		String[] ids = id.split(",");
		boolean flag =false;
		for(int i = 0;i<ids.length;i++) {
			int index = supplierMapper.deleteSupplier((Integer.parseInt(ids[i])));
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
	public MsgResult updateSupplier(Supplier supplier) {
		MsgResult result = new MsgResult();
		int index = supplierMapper.updateSupplier(supplier);
		if(index == 1) {
			result.setStatus(200);
			result.setMsg("修改成功！");
		}else {
			result.setMsg("修改失败，请重新修改！");
		}
		return result;
	}

}
