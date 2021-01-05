<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改角色</title>
</head>
<body>
<script type="text/javascript">

function modify(){
	
	 /*检查输入是否合法*/
	if(emptyValidate($('#name').val())){
	   	$.messager.alert('系统信息','请输入角色名');
	   	return false;
   }else if(emptyValidate($('#remark').val())){
	   $.messager.alert('系统信息','请输入备注');
	   	return false;
   }else if(emptyValidate($('#status').val())){
	   $.messager.alert('系统信息','请输入状态');
	   	return false;
   }
	
	$.post("page/modifyRole", $("#role_edit_form").serialize(),function(fn){
		if (fn.status == 200) {
			$.messager.show({
      			title:'系统消息',
      			msg:fn.msg,
      			timeout:5000,
      			showType:'slide'
      		});
      		//弹出框关闭
      		$("#role_edit_dialog").dialog("close");
      		$('#role_table').datagrid('reload');
		} else {
			$.messager.alert("系统信息","修改失败,请重新添加");
		}
	});
}

$(function(){
	$("#role_edit_submit").click(modify)
});

</script>
<div  style="padding:10px;">
系统设置 >> 角色管理
<hr/>
<form action="" method="post" id="role_edit_form">
<input type="hidden" name="id"/>
<table>
	<tr>
		<td>角色名称:</td>
		<td><input id="name" type="text" name="name"/> </td>
	</tr>
	<tr>
		<td>角色状态:</td>
		<td><input id="status" type="text" name="status"/> </td>
	</tr>
	<tr>
		<td>角色备注:</td>
		<td><input id="remark" type="text" name="remark"/> </td>
	</tr>
	<tr>
		<td colspan="2"> 
		<a id="role_edit_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">修改</a> 
		</td>
	</tr>
</table>
</form>
</body>
</html>