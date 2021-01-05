package com.seven.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seven.mapper.StoreMapper;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.Store;
import com.seven.service.StoreService;

@Service
public class StoreServiceImpl implements StoreService {

	@Resource
	private StoreMapper storeMapper;
	
	@Override
	public EasyUIDatagrid showAll(int pageSize, int pageNumber) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		datagrid.setRows(storeMapper.selByPage(pageSize*(pageNumber-1), pageSize));
		datagrid.setTotal(storeMapper.selCount());
		return datagrid;
	}

	@Override
	public MsgResult insertStore(Store store) {
		
		return null;
	}

	@Override
	public MsgResult updStockBalance(Store store) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Store selectByCid(String cid) {
		return storeMapper.selByCid(cid);
	}

	@Override
	public EasyUIDatagrid showStoreByParams(int pageSize, int pageNumber, String paramName, String paramValue) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		List<Store> storeLists = new ArrayList<Store>();
		int count=0;
		if(paramName.equals("commodity")) {
			storeLists = storeMapper.selByCname(pageSize*(pageNumber-1), pageSize, paramValue);
			count = storeMapper.selCountByCname(paramValue);
		}else if(paramName.equals("balancestatus")) {
			storeLists = storeMapper.selByStatus(pageSize*(pageNumber-1), pageSize, Integer.parseInt(paramValue));
			count = storeMapper.selCountByStatus(Integer.parseInt(paramValue));
		}
		datagrid.setRows(storeLists);
		datagrid.setTotal(count);
		return datagrid;
	}

}
