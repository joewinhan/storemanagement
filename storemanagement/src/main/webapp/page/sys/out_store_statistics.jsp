<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>出库统计</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#out_store_statistics_table').datagrid({    
	    url:'page/showSaleOrderByStatus?status=4',    
	    columns:[[    
	    	{field:'id',title:'编号',width:100,hidden:true},    
	        {field:'createtime',title:'创建时间',width:100,align:'right'},    
	        {field:'finishtime',title:'完成时间',width:100,align:'right'},
	        {field:'customerId',title:'客户',width:100,align:'right'},
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
	    toolbar:"#out_easyui_toolbar"
	    
	});
}) 

$('#out_searchBox').searchbox({ 
	searcher:function(value,name){ 
		$('#out_store_statistics_table').datagrid({    
		    url:'page/showSaleOrderByParams',    
		    columns:[[    
		        {field:'id',title:'编号',width:100,hidden:true},    
		        {field:'createtime',title:'创建时间',width:100,align:'right'},    
		        {field:'finishtime',title:'完成时间',width:100,align:'right'},
		        {field:'customerId',title:'客户',width:100,align:'right'},
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
		    toolbar:"#out_easyui_toolbar",
		    queryParams:{paramName:name,paramValue:value},
		});  
	}, 
	menu:'#out_searchParam', 
	prompt:'请输入搜索条件' 
});
</script>
  <div  id="out_easyui_toolbar" style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">
	<div id="out_searchDiv" style="float: left;">
		<input id="out_searchBox"></input> 
		<div id="out_searchParam" style="width:120px"> 
			<div data-options="name:'commodity',selected:true">商品名</div>
			<div data-options="name:'customer'">客户名</div>
		</div>   
	</div>
</div>
<table id="out_store_statistics_table"></table> 
</body>
</html>