package com.seven.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seven.mapper.CommodityMapper;
import com.seven.mapper.PurchaseOrderMapper;
import com.seven.mapper.StoreMapper;
import com.seven.pojo.EasyUIDatagrid;
import com.seven.pojo.MsgResult;
import com.seven.pojo.PurchaseOrder;
import com.seven.pojo.SaleOrder;
import com.seven.pojo.Store;
import com.seven.service.PurchaseOrderService;
import com.seven.utils.DateUtil;
import com.seven.utils.IDUtil;

@Service
public  class PurchaseOrderServiceImpl implements PurchaseOrderService {

	@Resource
	private PurchaseOrderMapper purchaseOrderMapper;
	@Resource
	private StoreMapper storeMapper;
	
	@Resource
	private CommodityMapper commodityMapper;
	
	@Override
	public EasyUIDatagrid showAll(int pageSize, int pageNumber) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		datagrid.setRows(purchaseOrderMapper.selByPage(pageSize*(pageNumber-1), pageSize));
		datagrid.setTotal(purchaseOrderMapper.selCount());
		return datagrid;
	}

	@Override
	public MsgResult insertPurchaseOrder(PurchaseOrder order) {
		MsgResult result = new MsgResult();
		order.setId(IDUtil.getUUID());
		Date now = new Date();
		order.setCreatetime(DateUtil.date2str(now));
		//status字段设为1 表示等待系统管理员审批
		order.setStatus(1);
		
		//计算该采购订单的总价
		double unitPrice = commodityMapper.selByCidAndPid(order.getCommodityId(),order.getSupplierId()).getPrice();
		order.setPrice(order.getAmount()*unitPrice);
		
		int index = purchaseOrderMapper.insertPurchaseOrder(order);
		if(index==1) {
			result.setStatus(200);
			result.setMsg("提交采购申请成功！");
		}else {
			result.setMsg("提交采购申请失败！");
		}
		return result;
	}

	@Override
	public MsgResult updPurchaseOrder(PurchaseOrder order) {
		MsgResult result = new MsgResult();
		//计算该采购订单的总价
		double unitPrice = commodityMapper.selByCidAndPid(order.getCommodityId(),order.getSupplierId()).getPrice();
		order.setPrice(order.getAmount()*unitPrice);
		
		int index = purchaseOrderMapper.updatePurchaseOrder(order);
		if(index == 1) {
			result.setStatus(200);
			result.setMsg("修改成功！");
		}else {
			result.setMsg("修改失败！");
		}
		return result;
	}

	//分页查询所有待采购审核的订单
	@Override
	public EasyUIDatagrid showAllStatusEq1(int pageSize, int pageNumber) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		datagrid.setRows(purchaseOrderMapper.selStatusEq1(pageSize*(pageNumber-1), pageSize));
		datagrid.setTotal(purchaseOrderMapper.SelCountStatusEq1());
		return datagrid;
	}

	//查询所有待入库审核的订单
	@Override
	public EasyUIDatagrid showAllStatusEq2(int pageSize, int pageNumber) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		datagrid.setRows(purchaseOrderMapper.selStatusEq2(pageSize*(pageNumber-1), pageSize));
		datagrid.setTotal(purchaseOrderMapper.SelCountStatusEq2());
		return datagrid;
	}

	//修改订单状态
	@Override
	public MsgResult updateStatus(String id, int status,String amount,String cid) {
		
		MsgResult result = new MsgResult();
		String ids[] = id.split(",");
		//如果是入库,既要修改该订单的状态为5,并且设置finishtime，还要更新store表中商品的库存容量
		if(status ==5) {
			String amounts[] = amount.split(",");
			String cids[] = cid.split(",");
			boolean flag = false;
			for(int i =0;i<ids.length;i++) {
//				System.out.println("cid["+i+"]===="+cids[i]);
				Store s = storeMapper.selByCid(cids[i]);
				if(null==s) {
					Store store = new Store();
					store.setId(IDUtil.getUUID());
					store.setCommodityId(cids[i]);
					store.setStockBalance(Double.parseDouble(amounts[i]));
					store.setStatus(1);
					if(storeMapper.insertStore(store)!=1) {
						flag = true;
						break;
					}
				}else {
					s.setStockBalance(s.getStockBalance()+Double.parseDouble(amounts[i]));
					if(storeMapper.updateStockBalance(s)!=1) {
						flag = true;
						break;
					}
				}
				PurchaseOrder order = purchaseOrderMapper.selById(ids[i]);
				order.setStatus(5);
				order.setFinishtime(DateUtil.date2str(new Date()));
				if(purchaseOrderMapper.updatePurchaseOrder(order)!=1) {
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
		}else if(status==0) {//如果是拒绝入库或者是拒绝采购申请，既要修改status为0，还要添加finishtime
			boolean flag = false;
			for(int i=0;i<ids.length;i++) {
				PurchaseOrder order = purchaseOrderMapper.selById(ids[i]);
				order.setStatus(0);
				order.setFinishtime(DateUtil.date2str(new Date()));
				int index = purchaseOrderMapper.updatePurchaseOrder(order);
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
		else{
			boolean flag = false;
			for(int i=0;i<ids.length;i++) {
				int index = purchaseOrderMapper.updStatus(ids[i], status);
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
	public EasyUIDatagrid showAllByStatus(int pageSize, int pageNumber, int status) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		datagrid.setRows(purchaseOrderMapper.selByPageStatus(pageSize*(pageNumber-1), pageSize, status));
		datagrid.setTotal(purchaseOrderMapper.SelCountByStatus(status));
		return datagrid;
	}

	
	//根据搜索条件模糊查询已完成的订单
	@Override
	public EasyUIDatagrid showByParameter(int pageSize, int pageNumber,String paramName, String paramValue) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		List<PurchaseOrder> orderLists = new ArrayList<PurchaseOrder>();
		int orderCount =0;
		if(paramName.equals("commodity")) {//如果搜索条件是商品名
			/**1.根据商品名去commodity表中找到所有的商品Id
				2.再去purchase_order表中找到商品id对应的订单
			**/
			orderLists = purchaseOrderMapper.selPageByCname(pageSize*(pageNumber-1),pageSize,paramValue);
			orderCount = purchaseOrderMapper.selCountByCname(paramValue);
			datagrid.setRows(orderLists);
			datagrid.setTotal(orderCount);
		}else if(paramName.equals("supplier")){//如果搜索条件是供应商名
			/**1.根据商品名去supplier表中找到所有的supplierId
			2.再去purchase_order表中找到supplierid对应的订单
		**/
			orderLists = purchaseOrderMapper.selPageBySname(pageSize*(pageNumber-1),pageSize,paramValue);
			orderCount = purchaseOrderMapper.selCountBySname(paramValue);
			datagrid.setRows(orderLists);
			datagrid.setTotal(orderCount);
		}
		return datagrid;
	}
}
