<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#commodity_table').datagrid({    
	    url:'page/showCommodity',    
	    columns:[[    
	        {field:'id',title:'编号',width:100,hidden:true},    
	        {field:'name',title:'商品名称',width:100},    
	        {field:'price',title:'单价',width:100,align:'right'},
	        {field:'supplierId',title:'供应商',width:100,align:'right'},
	        {field:'place',title:'产地',width:100,align:'right'},
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
				$('#commodity_add_dialog').dialog({    
				    title: '添加商品信息',    
				    width: 400,    
				    height: 200,    
				    closed: false,    
				    cache: false,    
				    href: 'page/sys/commodity_add.jsp',    
				    modal: true,
				}); 
			}
		},'-',{
			iconCls: 'icon-remove',
			text:'删除',
			handler: function(){
				if($("#commodity_table").datagrid('getSelections').length != 0){
    				$.messager.confirm('确认','您确认要删除选中的记录吗?',function(r){    
	    			    if (r){    
	    			    	var arr = $('#commodity_table').datagrid("getSelections")
			    			var ids = "";
			    			for(var i in arr){
			    				if(i == arr.length-1){
			    					ids += arr[i].id;
			    				}else{
			    					ids = ids + arr[i].id+",";
			    				}
			    			}
			    			$.getJSON("page/deleteCommodity",{ id: ids}, function(data){
								if(data.status == 200){
									alert(data.msg);
									$('#commodity_table').datagrid('reload');
								}
			    			});  
	    			    }    
	    			});
    			}else{
    				$.messager.alert('系统消息','<b style="color:red">你还没有选择记录呢！</b>'); 
    			}  
			}
		},'-',{
			iconCls: 'icon-edit',
			text:'修改',
			handler: function(){
				if($("#commodity_table").datagrid("getSelections").length==1){
					//弹出窗口
					$('#commodity_modify_dialog').dialog({    
					    title: '修改商品信息',    
					    width: 400,    
					    height: 250,    
					    closed: false,    
					    cache: false,    
					    href: 'page/sys/commodity_edit.jsp',    
					    modal: true,
					    onLoad:function(){
					    	$("#commodity_edit_form :text:eq(0)").val($("#commodity_table").datagrid("getSelected").name);
					    	$("#commodity_edit_form :text:eq(1)").val($("#commodity_table").datagrid("getSelected").price);
					    	$("#commodity_edit_form :text:eq(2)").val($("#commodity_table").datagrid("getSelected").place);
					    	$('#selectSupplier').combobox('setValue',$("#commodity_table").datagrid("getSelected").supplierId);
					    	$("#commodity_edit_form :hidden:eq(0)").val($("#commodity_table").datagrid("getSelected").id);
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
<div id="commodity_add_dialog"></div>
<div id="commodity_modify_dialog"></div> 
<table id="commodity_table"></table> 
</body>
</html>