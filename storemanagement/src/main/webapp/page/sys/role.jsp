<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>角色管理</title>

</head>
<body>
<script type="text/javascript">

function abc(obj){
	$('#role_edit_dialog').dialog({    
	    title: '分配权限',    
	    width: 600,    
	    height: 300,    
	    closed: false,    
	    cache: false,    
	    href: 'page/sys/privilege.jsp',    
	    modal: true,
	    onLoad:function(){
	    	$("#privilege_form :hidden:eq(0)").val($(obj).parent().parent().siblings("[field='id']").children().eq(0).html());
	    	$('#privilege_tree').tree({    
	    	    url:'showPrivilege?id='+$(obj).parent().parent().siblings("[field='id']").children().eq(0).html(),
	    	    checkbox:true		
	    	}); 
	    }
	}); 
}

$(function(){
	$('#role_table').datagrid({    
	    url:'page/showRole',    
	    columns:[[    
	        {field:'id',title:'编号',width:100,hidden:true},    
	        {field:'name',title:'角色名称',width:100},    
	        {field:'status',title:'角色状态',width:100,align:'right'},    
	        {field:'remark',title:'备注',width:100,align:'right'},
	        {field:'qwe',title:'操作',width:100,align:'right',
	        	formatter: function(value,row,index){
					return "<a href='javascript:void(0)' onclick='javascript:abc(this);return false;'>分配权限</a>";
				}
	        }
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
				$('#role_add_dialog').dialog({    
				    title: '添加角色',    
				    width: 400,    
				    height: 200,    
				    closed: false,    
				    cache: false,    
				    href: 'page/sys/role_add.jsp',    
				    modal: true,
				});
			}
		},'-',{
			iconCls: 'icon-remove',
			text:'删除',
			handler: function(){
				if($("#role_table").datagrid('getSelections').length != 0){
    				$.messager.confirm('确认','您确认要删除选中的记录吗?',function(r){    
	    			    if (r){    
	    			    	var arr = $('#role_table').datagrid("getSelections")
			    			var ids = "";
			    			for(var i in arr){
			    				if(i == arr.length-1){
			    					ids += arr[i].id;
			    				}else{
			    					ids = ids + arr[i].id+",";
			    				}
			    			}
			    			$.getJSON("page/deleteRole",{ id: ids}, function(data){
								if(data.status == 200){
									alert(data.msg);
									$('#users_table').datagrid('reload');
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
				if($("#role_table").datagrid("getSelections").length==1){
					//弹出窗口
					$('#role_edit_dialog').dialog({    
					    title: '修改角色',    
					    width: 400,    
					    height: 200,    
					    closed: false,    
					    cache: false,    
					    href: 'page/sys/role_edit.jsp',    
					    modal: true,
					    onLoad:function(){
					    	$("#role_edit_form :text:eq(0)").val($("#role_table").datagrid("getSelected").name);
					    	$("#role_edit_form :text:eq(1)").val($("#role_table").datagrid("getSelected").status);
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
<table id="role_table"></table> 
<div id="role_add_dialog"></div> 
<div id="role_edit_dialog"></div>
</body>
</html>