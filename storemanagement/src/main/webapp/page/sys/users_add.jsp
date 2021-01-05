<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加用户</title>
</head>
<body>
<script type="text/javascript">

 function add(){
	 /*检查输入是否合法*/
	if(notPassword($("#username").val())){
    	$.messager.alert('系统信息','用户名只能由数字和字母组成，长度6-16位！');
    	return false;
    }else if(notPassword($(":password:eq(0)").val())){
    	$.messager.alert('系统信息','请输入正确的密码，只能有数字和字母组成，且长度6-16位！');
    	return false;
    }else if(emptyValidate($('#selectRole').combo('getText'))){
    	$.messager.alert('系统信息','请选择一个角色');
    	return false;
    }
	
	$.post("page/addUser", $("#user_add_form").serialize(),function(fn){
		if (fn.status == 200) {
			$.messager.show({
       			title:'系统消息',
       			msg:fn.msg,
       			timeout:5000,
       			showType:'slide'
       		});
       		//弹出框关闭
       		$("#users_add_dialog").dialog("close");
       		$('#users_table').datagrid('reload');
		} else if(fn.status=404){
			$.messager.alert("系统信息",fn.msg);
		}
	});
}
$(function(){
	$("#user_add_submit").click(add)
});

$('#selectRole').combobox({    
    url:'page/showAllRole',    
    valueField:'id',    
    textField:'text',
    editable:false
});
</script>

<div  style="padding:10px;">
账号管理 >> 添加账号
<hr/>
<form action="" method="post" id="user_add_form">
<table>
	<tr>
		<td>账号名:</td>
		<td>
        	<input id ="username" type="text" name="username">
		</td>
	</tr>
	<tr>
		<td>密码:</td>
		<td>
			<input type="password" name="password"  /> 
		</td>
	</tr>
	<tr>
		<td>角色:</td>
		<td><input id="selectRole" type="text" name="roleId"/> </td>
	</tr>
	<tr>
		<td colspan="2"> 
		<a id="user_add_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a> 
		</td>
	</tr>
</table>
</form>
</body>
</html>