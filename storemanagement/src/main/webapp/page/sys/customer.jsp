<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客户管理</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#customer_table').datagrid({    
	    url:'page/showCustomer',    
	    columns:[[    
	        {field:'id',title:'编号',width:100,hidden:true},    
	        {field:'name',title:'客户',width:100},    
	        {field:'address',title:'地址',width:100,align:'right'},
	        {field:'reputation',title:'信誉度',width:100,align:'right'},
	        {field:'priority',title:'优先级',width:100,align:'right'},
	        {field:'phoneNum',title:'电话',width:100,align:'right'},
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
				$('#customer_add_dialog').dialog({    
				    title: '添加客户信息',    
				    width: 400,    
				    height: 250,    
				    closed: false,    
				    cache: false,    
				    href: 'page/sys/customer_add.jsp',    
				    modal: true,
				}); 
			}
		},'-',{
			iconCls: 'icon-remove',
			text:'删除',
			handler: function(){
				if($("#customer_table").datagrid('getSelections').length != 0){
    				$.messager.confirm('确认','您确认要删除选中的记录吗?',function(r){    
	    			    if (r){    
	    			    	var arr = $('#customer_table').datagrid("getSelections")
			    			var ids = "";
			    			for(var i in arr){
			    				if(i == arr.length-1){
			    					ids += arr[i].id;
			    				}else{
			    					ids = ids + arr[i].id+",";
			    				}
			    			}
			    			$.getJSON("page/deleteCustomer",{ id: ids}, function(data){
								if(data.status == 200){
									alert(data.msg);
									$('#customer_table').datagrid('reload');
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
				if($("#customer_table").datagrid("getSelections").length==1){
					//弹出窗口
					$('#customer_edit_dialog').dialog({    
					    title: '修改商品信息',    
					    width: 400,    
					    height: 250,    
					    closed: false,    
					    cache: false,    
					    href: 'page/sys/customer_edit.jsp',    
					    modal: true,
					    onLoad:function(){
					    	$("#customer_edit_dialog :text:eq(0)").val($("#customer_table").datagrid("getSelected").name);
					    	$("#customer_edit_dialog :text:eq(1)").val($("#customer_table").datagrid("getSelected").address);
					    	$("#customer_edit_dialog :text:eq(2)").val($("#customer_table").datagrid("getSelected").reputation);
					    	$("#customer_edit_dialog :text:eq(3)").val($("#customer_table").datagrid("getSelected").priority);
					    	$("#customer_edit_dialog :text:eq(4)").val($("#customer_table").datagrid("getSelected").phoneNum);
					    	$("#customer_edit_dialog :hidden:eq(0)").val($("#customer_table").datagrid("getSelected").id);
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

<div id="customer_edit_dialog"></div> 
<div id="customer_add_dialog"></div> 
<table id="customer_table"></table> 
</body>
</html>