<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>入库审核</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#verify_in_table').datagrid({    
	    url:'page/showPurchaseOrderByStatus?status=3',    
	    columns:[[    
	        {field:'id',title:'编号',width:100,hidden:true},    
	        {field:'createtime',title:'创建时间',width:100,align:'right'},    
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
			iconCls: 'icon-ok',
			text:'通过申请',
			handler: function(){
				if($("#verify_in_table").datagrid('getSelections').length != 0){
    				$.messager.confirm('确认','您确认要通过选中的入库申请吗?',function(r){    
	    			    if (r){    
	    			    	var arr = $('#verify_in_table').datagrid("getSelections")
			    			var ids = "";
			    			for(var i in arr){
			    				if(i == arr.length-1){
			    					ids += arr[i].id;
			    				}else{
			    					ids = ids + arr[i].id+",";
			    				}
			    			}
			    			$.getJSON("page/modifyPurchaseOrderStatus",{ id: ids,status:4}, function(data){
								if(data.status == 200){
									alert(data.msg);
									$('#verify_in_table').datagrid('reload');
								}
			    			});  
	    			    }    
	    			});
    			}else{
    				$.messager.alert('系统消息','<b style="color:red">你还没有选择记录呢！</b>'); 
    			}			
			}
		},'-',{
			iconCls: 'icon-remove',
			text:'拒绝申请',
			handler: function(){
				if($("#verify_in_table").datagrid('getSelections').length != 0){
    				$.messager.confirm('确认','您确认要拒绝选中的入库申请吗?',function(r){    
	    			    if (r){    
	    			    	var arr = $('#verify_in_table').datagrid("getSelections")
			    			var ids = "";
			    			for(var i in arr){
			    				if(i == arr.length-1){
			    					ids += arr[i].id;
			    				}else{
			    					ids = ids + arr[i].id+",";
			    				}
			    			}
			    			$.getJSON("page/modifyPurchaseOrderStatus",{ id: ids,status:0}, function(data){
								if(data.status == 200){
									alert(data.msg);
									$('#verify_in_table').datagrid('reload');
								}
			    			});  
	    			    }    
	    			});
    			}else{
    				$.messager.alert('系统消息','<b style="color:red">你还没有选择记录呢！</b>'); 
    			}
			}
		},]
	});
}) 
</script>
<table id="verify_in_table"></table> 
</body>
</html>