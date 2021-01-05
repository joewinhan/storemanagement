package com.seven.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seven.mapper.CommodityMapper;
import com.seven.mapper.CommoditySupplierMapper;
import com.seven.mapper.SupplierMapper;
import com.seven.pojo.Commodity;
import com.seven.pojo.EasyUICombobox;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.service.CommodityService;
import com.seven.utils.IDUtil;

@Service
public class CommodityServiceImpl implements CommodityService {

	@Resource
	private CommodityMapper commodityMapper;
	@Resource
	private SupplierMapper supplierMapper;
	@Resource
	private CommoditySupplierMapper commoditySupplierMapper;
	
	@Override
	public EasyUIDatagrid showAll(int pageSize, int pageNumber) {
		EasyUIDatagrid dataGrid = new EasyUIDatagrid();
		List<Commodity> commodityList = commodityMapper.selByPage((pageNumber-1)*pageSize, pageSize);
		dataGrid.setRows(commodityList);
		dataGrid.setTotal(commodityMapper.selCount());
		return dataGrid;
	}

	@Override
	public MsgResult insertCommodity(Commodity commodity) {
		MsgResult result = new MsgResult();
		commodity.setId(IDUtil.getUUID());
		int index = commodityMapper.addCommodity(commodity);
		index += commoditySupplierMapper.insertOne(commodity.getId(), commodity.getSupplierId());
		if(index == 2) {
			result.setStatus(200);
			result.setMsg("添加成功！");
		}else {
			result.setMsg("添加失败！");
		}
		return result;
	}

	//采购订单下拉框获取所有商品
	@Override
	public List<EasyUICombobox> selAll() {
		List<Commodity> commodityLists = commodityMapper.selAllCommodity();
		List<EasyUICombobox> comboboxLists = new ArrayList<EasyUICombobox>();
		for(Commodity commodity:commodityLists) {
			EasyUICombobox cbx = new EasyUICombobox();
			cbx.setId(commodity.getId());
			cbx.setText(commodity.getName());
			comboboxLists.add(cbx);
		}
		return comboboxLists;
	}
	
	//销售订单下拉框获取所有有库存的商品
	@Override
	public List<EasyUICombobox> selAllWithBalance() {
		List<Commodity> commodityLists = commodityMapper.selAllCommodityWithBalance();
		List<EasyUICombobox> comboboxLists = new ArrayList<EasyUICombobox>();
		for(Commodity commodity:commodityLists) {
			EasyUICombobox cbx = new EasyUICombobox();
			cbx.setId(commodity.getId());
			cbx.setText(commodity.getName());
			comboboxLists.add(cbx);
		}
		return comboboxLists;
	}
	

	@Override
	public MsgResult deleteCommodity(String id) {
		MsgResult result = new MsgResult();
		String[] ids = id.split(",");
		boolean flag =false;
		for(int i = 0;i<ids.length;i++) {
			int index = commodityMapper.delById(ids[i]);
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

	/*
	 * 这里有个问题，
	 * 修改Commodity的时候应该还要修改commodity_supplier表，这里没有实现
	 */
	@Override
	public MsgResult modify(Commodity commodity) {
		MsgResult msg = new MsgResult();
		commodity.setStatus(1);
		int index = commodityMapper.updateCommodity(commodity);
		if(index ==1) {
			msg.setStatus(200);
			msg.setMsg("修改成功！");
		}else {
			msg.setMsg("修改失败！");
		}
		return msg;
	}

	@Override
	public Commodity selCommodityPrice(String id) {
		return commodityMapper.selById(id);
	}


}
