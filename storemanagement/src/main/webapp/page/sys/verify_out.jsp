<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>出库审核</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#verify_out_table').datagrid({    
	    url:'page/showSaleOrderByStatus?status=2',    
	    columns:[[    
	        {field:'id',title:'编号',width:100,hidden:true},    
	        {field:'createtime',title:'创建时间',width:100,align:'right'},    
	        {field:'finishtime',title:'完成时间',width:100,align:'right'},
	        {field:'commodityId',title:'商品',width:100,align:'right'},
	        {field:'amount',title:'商品数量',width:100,align:'right'},
	        {field:'price',title:'订单总价',width:100,align:'right'},
	        {field:'customerId',title:'客户',width:100,align:'right'},
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
			/*该按钮与查看待入库审核订单配合使用，用户点击待入库审核订单按钮后可以查看所有还未提交入库请求的订单，
			选择一个上述订单，然后点击该按钮将该订单的status字段设为3，表示提价了入库申请。
			*/
			iconCls: 'icon-add',
			text:'允许出库',
			handler: function(){
				if($("#verify_out_table").datagrid('getSelections').length != 0){
    				$.messager.confirm('确认','您确认要批准出库吗?',function(r){    
	    			    if (r){    
	    			    	var arr = $('#verify_out_table').datagrid("getSelections")
			    			var ids = "";
			    			for(var i in arr){
			    				if(i == arr.length-1){
			    					ids += arr[i].id;
			    				}else{
			    					ids = ids + arr[i].id+",";
			    				}
			    			}
			    			$.getJSON("page/modifySaleOrderStatus",{ id: ids,status:3}, function(data){
								if(data.status == 200){
									alert(data.msg);
									$('#verify_out_table').datagrid('reload');
								}
			    			});  
	    			    }    
	    			});
    			}else{
    				$.messager.alert('系统消息','<b style="color:red">你还没有选择记录呢！</b>'); 
    			}
			}
		},{
			/*拒绝出库申请
			*/
			iconCls: 'icon-add',
			text:'拒绝出库',
			handler: function(){
				if($("#verify_out_table").datagrid('getSelections').length != 0){
    				$.messager.confirm('确认','您确认要拒绝出库吗?',function(r){    
	    			    if (r){    
	    			    	var arr = $('#verify_out_table').datagrid("getSelections")
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
			    			$.getJSON("page/modifySaleOrderStatus",{ id: ids,status:0,amount:amounts,cid:cids}, function(data){
								if(data.status == 200){
									alert(data.msg);
									$('#verify_out_table').datagrid('reload');
								}
			    			});  
	    			    }    
	    			});
    			}else{
    				$.messager.alert('系统消息','<b style="color:red">你还没有选择记录呢！</b>'); 
    			}
			}
		}]
	});
}) 
</script>
<table id="verify_out_table"></table> 
</body>
</html>