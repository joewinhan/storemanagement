<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申请出库</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#approval_out_table').datagrid({    
	    url:'page/showSaleOrderByStatus',    
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
			text:'提交出库申请',
			handler: function(){
				if($("#approval_out_table").datagrid('getSelections').length != 0){
    				$.messager.confirm('确认','您确认要提交出库申请吗?',function(r){    
	    			    if (r){    
	    			    	var arr = $('#approval_out_table').datagrid("getSelections")
			    			var ids = "";
			    			for(var i in arr){
			    				if(i == arr.length-1){
			    					ids += arr[i].id;
			    				}else{
			    					ids = ids + arr[i].id+",";
			    				}
			    			}
			    			$.getJSON("page/modifySaleOrderStatus",{ id: ids,status:2}, function(data){
								if(data.status == 200){
									alert(data.msg);
									$('#approval_out_table').datagrid('reload');
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
<table id="approval_out_table"></table> 
</body>
</html>