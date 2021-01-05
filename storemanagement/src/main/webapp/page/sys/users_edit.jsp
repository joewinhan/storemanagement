<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改账号信息</title>
</head>
<body>
<script type="text/javascript">

function modify(){
	
	 /*检查输入是否合法*/
	if(notPassword($("#username").val())){
    	$.messager.alert('系统信息','用户名只能由数字和字母组成，长度6-16位！');
    	return false;
    }else if(notPassword($(":password:eq(0)").val())){
    	$.messager.alert('系统信息','请输入正确的密码，只能有数字和字母组成，且长度6-16位！');
    	return false;
    }else if(emptyValidate($('#edit_selectRole').combo('getText'))){
    	$.messager.alert('系统信息','请选择一个角色');
    	return false;
    }
	
	$.post("page/modifyUser", $("#user_edit_form").serialize(),function(fn){
		if (fn.status == 200) {
			$.messager.show({
       			title:'系统消息',
       			msg:fn.msg,
       			timeout:5000,
       			showType:'slide'
       		});
       		//弹出框关闭
       		$("#users_edit_dialog").dialog("close");
       		$('#users_table').datagrid('reload');
		} else {
			$.messager.alert("系统信息","修改失败,请重新添加");
		}
	});
}

$(function(){
	$("#user_edit_submit").click(modify)
});

$('#edit_selectRole').combobox({    
    url:'page/showAllRole',    
    valueField:'id',    
    textField:'text',
    editable:false
});

</script>
<div  style="padding:10px;">
账号管理 >> 修改账号信息
<hr/>
<form action="" method="post" id="user_edit_form">
<input type="hidden" name="id"/>
<table>
	<tr>
		<td>账号名:</td>
		<td><input type="text" name="username" disabled="disabled"/> </td>
	</tr>
	<tr>
		<td>密码:</td>
		<td><input type="password" name="password"/> </td>
	</tr>
	<tr>
		<td>角色:</td>
		<td>
			<input id="edit_selectRole" type="text" name="roleId"/> 
		</td>
	</tr>

	<tr>
		<td colspan="2"> 
		<a id="user_edit_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a> 
		</td>
	</tr>
</table>
</form>
</body>
</html>