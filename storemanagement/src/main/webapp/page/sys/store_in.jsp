<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>入库</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#store_in_table').datagrid({    
	    url:'page/showPurchaseOrderByStatus?status=4',    
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
	    toolbar: [
	    	{
			/*仓库管理员将这批货物入库后，点击该按钮后修改订单的status为5，订单完成*/
			iconCls: 'icon-add',
			text:'入库',
			handler: function(){
				if($("#store_in_table").datagrid('getSelections').length != 0){
    				$.messager.confirm('确认','您确认要入库吗?',function(r){    
	    			    if (r){    
	    			    	var arr = $('#store_in_table').datagrid("getSelections")
			    			var ids = "";
	    			    	var amounts="";
	    			    	var cids="";
			    			for(var i in arr){
			    				if(i == arr.length-1){
			    					ids += arr[i].id;
			    					amounts += arr[i].amount;
			    					cids += arr[i].commodityId;
			    				}else{
			    					ids = ids + arr[i].id+",";
			    					amounts = amounts + arr[i].amount+",";
			    					cids = cids + arr[i].commodityId+",";
			    				}
			    			}
			    			$.getJSON("page/modifyPurchaseOrderStatus",{ id: ids,status:5,amount:amounts,cid:cids}, function(data){
								if(data.status == 200){
									alert(data.msg);
									$('#store_in_table').datagrid('reload');
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
<table id="store_in_table"></table> 
</body>
</html>