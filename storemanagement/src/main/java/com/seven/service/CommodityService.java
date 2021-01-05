package com.seven.service;

import java.util.List;

import com.seven.pojo.Commodity;
import com.seven.pojo.EasyUICombobox;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;

public interface CommodityService {

	EasyUIDatagrid showAll(int pageSize,int pageNumber);
	
	//添加商品
	MsgResult insertCommodity(Commodity commodity);
	
	//下拉框查询所有商品
	List<EasyUICombobox> selAll();
	
	//删除商品
	MsgResult deleteCommodity(String id);

	//修改商品信息
	MsgResult modify(Commodity commodity);

	//查询商品单价
	Commodity selCommodityPrice(String id);

	//查询有库存的商品
	List<EasyUICombobox> selAllWithBalance();
}
