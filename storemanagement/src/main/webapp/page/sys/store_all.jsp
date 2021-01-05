<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>库存统计</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#store_all_table').datagrid({    
	    url:'page/showAllCommodityStockBalance',    
	    columns:[[    
	        {field:'id',title:'编号',width:100,hidden:true},    
	        {field:'commodityId',title:'商品',width:100,align:'right'},    
	        {field:'stockBalance',title:'剩余库存',width:100,align:'right'},
	        {field:'status',title:'库存状态(0:不足,1:正常,2:积压)',width:100,align:'right'},
	    ]],
	    pagination:true,
	    pageList:[8,12,18],
	    pageSize:8,
	    fitColumns:true,
	    striped:true,
	    rownumbers:true,
	    toolbar:"#store_easyui_toolbar"
	});
})

$('#store_searchBox').searchbox({ 
	searcher:function(value,name){
		//如果搜索条件是status，那么需要对用户的输入进行检测
		var m = $('#store_searchBox').searchbox('getName');  
		if(m=='balancestatus'){
			var status = Number(value);
			if(status!=0 && status!=1 && status!=2){
				$.messager.alert('提示','请输入0或1或2！(0:不足,1:正常,2:积压)');   
				return false;
			}
		}
		$('#store_all_table').datagrid({    
		    url:'page/showStoreByParams',    
		    columns:[[    
		    	{field:'id',title:'编号',width:100,hidden:true},    
		        {field:'commodityId',title:'商品',width:100,align:'right'},    
		        {field:'stockBalance',title:'剩余库存',width:100,align:'right'},
		        {field:'status',title:'库存状态(0:不足,1:正常,2:积压)',width:100,align:'right'},
		    ]],
		    pagination:true,
		    pageList:[8,12,18],
		    pageSize:8,
		    fitColumns:true,
		    striped:true,
		    rownumbers:true,
		    toolbar:"#store_easyui_toolbar",
		    queryParams:{paramName:name,paramValue:value},
		});  
	}, 
	menu:'#store_searchParam', 
	prompt:'请输入搜索条件' 
});
</script>
 <div  id="store_easyui_toolbar" style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">
	<div id="store_searchDiv" style="float: left;">
		<input id="store_searchBox"></input> 
		<div id="store_searchParam" style="width:120px"> 
			<div data-options="name:'commodity',selected:true">商品名</div>
			<div data-options="name:'balancestatus'">库存状态</div>
		</div>   
	</div>
</div>
<table id="store_all_table"></table>

</body>
</html>