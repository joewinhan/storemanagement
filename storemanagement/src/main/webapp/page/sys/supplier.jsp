<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>供应商管理</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('#supplier_table').datagrid({    
	    url:'page/showSupplier',    
	    columns:[[    
	        {field:'id',title:'编号',width:100,hidden:true},  
	        {field:'name',title:'供应商',width:100,align:'right'},  
	        {field:'address',title:'地址',width:100,align:'right'},
	        {field:'phoneNum',title:'电话',width:100,align:'right'},
	        {field:'reputation',title:'信誉度',width:100,align:'right'},
	        /* {field:'qwe',title:'操作',width:100,align:'right',
	        	formatter: function(value,row,index){
					return "<a href='javascript:void(0)' onclick='javascript:abc(this);return false;'>分配权限</a>  <a href='javascript:void(0)' onclick='javascript:abc(this);return false;'>查看</a>";
				}
	        } */
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
				$('#supplier_add_dialog').dialog({    
				    title: '添加商品信息',    
				    width: 400,    
				    height: 200,    
				    closed: false,    
				    cache: false,    
				    href: 'page/sys/supplier_add.jsp',    
				    modal: true,
				}); 
				
			}
		},'-',{
			iconCls: 'icon-remove',
			text:'删除',
			handler: function(){
				if($("#supplier_table").datagrid('getSelections').length != 0){
    				$.messager.confirm('确认','您确认要删除选中的记录吗?',function(r){    
	    			    if (r){    
	    			    	var arr = $('#supplier_table').datagrid("getSelections")
			    			var ids = "";
			    			for(var i in arr){
			    				if(i == arr.length-1){
			    					ids += arr[i].id;
			    				}else{
			    					ids = ids + arr[i].id+",";
			    				}
			    			}
			    			$.getJSON("page/deleteSupplier",{ id: ids}, function(data){
								if(data.status == 200){
									alert(data.msg);
									$('#supplier_table').datagrid('reload');
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
				if($("#supplier_table").datagrid("getSelections").length==1){
					//弹出窗口
					$('#supplier_edit_dialog').dialog({    
					    title: '修改商品信息',    
					    width: 400,    
					    height: 200,    
					    closed: false,    
					    cache: false,    
					    href: 'page/sys/supplier_edit.jsp',    
					    modal: true,
					    onLoad:function(){
					    	$("#supplier_edit_form :text:eq(0)").val($("#supplier_table").datagrid("getSelected").name);
					    	$("#supplier_edit_form :text:eq(1)").val($("#supplier_table").datagrid("getSelected").address);
					    	$("#supplier_edit_form :text:eq(2)").val($("#supplier_table").datagrid("getSelected").reputation);
					    	$("#supplier_edit_form :text:eq(3)").val($("#supplier_table").datagrid("getSelected").phoneNum);
					    	$("#supplier_edit_form :hidden:eq(0)").val($("#supplier_table").datagrid("getSelected").id);
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

<div id="supplier_edit_dialog"></div> 
<div id="supplier_add_dialog"></div> 
<table id="supplier_table"></table> 
</body>
</html>