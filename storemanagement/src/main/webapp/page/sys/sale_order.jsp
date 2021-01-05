<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>销售订单</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#sale_order_table').datagrid({    
	    url:'page/showSaleOrderByStatus',    
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
			text:'增加',
			handler: function(){
				//弹出窗口
				$('#sale_order_add_dialog').dialog({    
				    title: '出售商品',    
				    width: 400,    
				    height: 280,    
				    closed: false,    
				    cache: false,    
				    href: 'page/sys/saleorder_add.jsp',    
				    modal: true,
				}); 
			}
		},'-',{
			iconCls: 'icon-remove',
			text:'删除',
			handler: function(){
				
			}
		},'-',{
			iconCls: 'icon-edit',
			text:'修改',
			handler: function(){
				if($("#sale_order_table").datagrid("getSelections").length==1){
					//弹出窗口
					$('#sale_order_dialog').dialog({    
					    title: '修改商品信息',    
					    width: 400,    
					    height: 200,    
					    closed: false,    
					    cache: false,    
					    href: 'page/sys/commodity_edit.jsp',    
					    modal: true,
					    onLoad:function(){
					    	$("#role_edit_form :text:eq(0)").val($("#role_table").datagrid("getSelected").name);
					    	$("#role_edit_form :text:eq(1)").val($("#role_table").datagrid("getSelected").sort);
					    	$("#role_edit_form :text:eq(2)").val($("#role_table").datagrid("getSelected").remark);
					    	$("#role_edit_form :hidden:eq(0)").val($("#role_table").datagrid("getSelected").id);
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
<div id="sale_order_add_dialog"></div>
<div id="sale_order_edit_dialog"></div> 
<table id="sale_order_table"></table> 

</body>
</html>