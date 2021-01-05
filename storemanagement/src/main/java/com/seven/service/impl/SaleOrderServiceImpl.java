package com.seven.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seven.mapper.CommodityMapper;
import com.seven.mapper.SaleOrderMapper;
import com.seven.mapper.StoreMapper;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.PurchaseOrder;
import com.seven.pojo.SaleOrder;
import com.seven.pojo.Store;
import com.seven.service.SaleOrderService;
import com.seven.utils.DateUtil;
import com.seven.utils.IDUtil;

@Service
public class SaleOrderServiceImpl implements SaleOrderService {

	@Resource
	private SaleOrderMapper saleOrderMapper;
	
	@Resource
	private CommodityMapper commodityMapper;
	
	@Resource
	private StoreMapper storeMapper;
	
	@Override
	public EasyUIDatagrid showAll(int pageSize, int pageNumber,int status) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		datagrid.setRows(saleOrderMapper.selByPage(pageSize*(pageNumber-1), pageSize,status));
		datagrid.setTotal(saleOrderMapper.selCount(status));
		return datagrid;
	}

	@Override
	public MsgResult insertSaleorder(SaleOrder order,double price) {
		MsgResult result = new MsgResult();
		Date now = new Date();
		order.setCreatetime(DateUtil.date2str(now));
		order.setStatus(1);
		order.setId(IDUtil.getUUID());
		
		//计算该采购订单的总价
		order.setPrice(order.getAmount()*price);
		//添加销售订单
		int index = saleOrderMapper.insertSaleOrder(order);
		//添加销售订单的时候就要修改该商品的库存信息了
		Store s = storeMapper.selByCid(order.getCommodityId());
		s.setStockBalance(s.getStockBalance()-order.getAmount());
		index += storeMapper.updateStockBalance(s);
		
		if(index == 2) {
			result.setStatus(200);
			result.setMsg("添加成功！");
		}else {
			result.setMsg("添加失败");
		}
		return result;
	}

	@Override
	public MsgResult updateStatus(String id, int status, String amount, String cid) {
		MsgResult result = new MsgResult();
		String ids[] = id.split(",");
		//如果是拒绝出库，既要修改订单状态为0，还有将之前添加订单时减少的库存容量重新加回来
		if(status ==0) {
			String amounts[] = amount.split(",");
			String cids[] = cid.split(",");
			boolean flag = false;
			for(int i =0;i<ids.length;i++) {
				Store s = storeMapper.selByCid(cids[i]);
				//更新该商品的库存信息
				s.setStockBalance(s.getStockBalance()+Double.parseDouble(amounts[i]));
				if(storeMapper.updateStockBalance(s)!=1) {
					flag = true;
					break;
				}
				//修改订单的status为0，并且设置finishtime
				SaleOrder order = saleOrderMapper.selByid(ids[i]);
				order.setFinishtime(DateUtil.date2str(new Date()));
				order.setStatus(0);
				if(saleOrderMapper.updateSaleOrder(order)!=1) {
					flag = true;
					break;
				}
			}
			if(!flag) {
				result.setMsg("操作成功");
				result.setStatus(200);
			}else {
				result.setMsg("操作失败");
			}
		}else if(status==4) {//出库时既要修改status，还要修改finishtime
			boolean flag = false;
			for(int i=0;i<ids.length;i++) {
				SaleOrder s = saleOrderMapper.selByid(ids[i]);
				s.setStatus(4);
				s.setFinishtime(DateUtil.date2str(new Date()));
				int index = saleOrderMapper.updateSaleOrder(s);
				if(index!=1) {
					flag = true;
					break;
				}
					
			}
			if(!flag) {
				result.setStatus(200);
				result.setMsg("操作成功");
			}else {
				result.setMsg("操作失败");
			}
		}else {
			boolean flag = false;
			for(int i=0;i<ids.length;i++) {
				int index = saleOrderMapper.updStatus(ids[i], status);
				if(index!=1) {
					flag = true;
					break;
				}
			}
			if(!flag) {
				result.setStatus(200);
				result.setMsg("操作成功");
			}else {
				result.setMsg("操作失败");
			}
		}
		return result;
	}

	@Override
	public EasyUIDatagrid showByParameter(int pageSize, int pageNumber, String paramName, String paramValue) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		List<SaleOrder> orderLists = new ArrayList<SaleOrder>();
		int orderCount =0;
		if(paramName.equals("commodity")) {//如果搜索条件是商品名
			orderLists = saleOrderMapper.selPageByCommodityName(pageSize*(pageNumber-1),pageSize,paramValue);
			orderCount = saleOrderMapper.selCountByCommodityName(paramValue);
			datagrid.setRows(orderLists);
			datagrid.setTotal(orderCount);
		}else if(paramName.equals("customer")){//如果搜索条件是供应商名
			orderLists = saleOrderMapper.selPageByCustomername(pageSize*(pageNumber-1),pageSize,paramValue);
			orderCount = saleOrderMapper.selCountByCustomername(paramValue);
			datagrid.setRows(orderLists);
			datagrid.setTotal(orderCount);
		}
		return datagrid;
	}

}
