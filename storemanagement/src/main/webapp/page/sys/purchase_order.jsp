<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>采购订单管理</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#purchase_order_table').datagrid({    
	    url:'page/showPurchaseOrder',    
	    columns:[[    
	        {field:'id',title:'编号',width:100,hidden:true},    
	        {field:'createtime',title:'创建时间',width:100},    
	        {field:'finishtime',title:'完成时间',width:100,align:'right'},
	        {field:'supplierId',title:'供应商',width:100,align:'right'},
	        {field:'amount',title:'商品数量',width:100,align:'right'},
	        {field:'price',title:'订单总价',width:100,align:'right'},
	        {field:'commodityId',title:'商品',width:100,align:'right'},
	        {field:'status',title:'订单状态',width:100,align:'right'},
	    ]],
	    pagination:true,
	    pageList:[8,12,18],
	    pageSize:8,
	    fitColumns:true,
	    striped:true,
	    rownumbers:true,
	    toolbar: [{
			iconCls: 'icon-add',
			text:'采购商品',
			handler: function(){
				//弹出窗口
				$('#purchase_order_add_dialog').dialog({    
				    title: '采购申请',    
				    width: 400,    
				    height: 200,    
				    closed: false,    
				    cache: false,    
				    href: 'page/sys/purchaseoder_add.jsp',    
				    modal: true,
				}); 
				
			}
		},'-',{
			iconCls: 'icon-edit',
			text:'修改订单',
			handler: function(){
				if($("#purchase_order_table").datagrid("getSelections").length==1){
					//弹出窗口
					$('#purchase_order_modify_dialog').dialog({    
					    title: '修改订单信息',    
					    width: 400,    
					    height: 200,    
					    closed: false,    
					    cache: false,    
					    href: 'page/sys/purchaseorder_edit.jsp',    
					    modal: true,
					    onLoad:function(){
					    	$.getJSON("page/showCommodityPrice",{ id: $("#purchase_order_table").datagrid("getSelected").commodityId}, function(data){
								$("#edit_unitPrice").val(data.price);
							});
					    	$("#edit_amount").val($("#purchase_order_table").datagrid("getSelected").amount);
					    	$("#purchaseorder_edit_form :hidden:eq(0)").val($("#purchase_order_table").datagrid("getSelected").id);
					    	$('#edit_selectCommodity').combobox('setValue',$("#purchase_order_table").datagrid("getSelected").commodityId);
					    	$('#edit_selectSupplier').combobox('setValue',$("#purchase_order_table").datagrid("getSelected").supplierId);
					    }
					}); 
				}else{
					$.messager.alert("系统信息","请选择<b style='color:red;'>一行</b>")
				}
			}
		}]

	});
}) 
</script>

<div id="purchase_order_add_dialog"></div> 
<div id="purchase_order_modify_dialog"></div> 
<table id="purchase_order_table"></table> 
</body>
</html>