<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加角色</title>
</head>
<body>
<script type="text/javascript">

 function add(){
	if(emptyValidate($("#name").val())){
    	$.messager.alert('系统信息','角色名不能为空');
    	return false;
    }else if(emptyValidate($(":text:eq(1)").val())){
    	$.messager.alert('系统信息','角色职责描述不能为空');
    	return false;
    }
	$.post("page/addRole", $("#role_add_form").serialize(),function(fn){
		if (fn.status == 200) {
			$.messager.show({
       			title:'系统消息',
       			msg:fn.msg,
       			timeout:5000,
       			showType:'slide'
       		});
       		//弹出框关闭
       		$("#role_add_dialog").dialog("close");
       		$('#role_table').datagrid('reload');
		} else if(fn.status=404){
			$.messager.alert("系统信息",fn.msg);
		}
	});
}
$(function(){
	$("#role_add_submit").click(add)
});

</script>

<div  style="padding:10px;">
账号管理 >> 添加账号
<hr/>
<form action="" method="post" id="role_add_form">
<table>
	<tr>
		<td>角色名:</td>
		<td>
        	<input id ="name" type="text" name="name">
		</td>
	</tr>
	<tr>
		<td>职责:</td>
		<td>
			<input type="text" name="remark"  /> 
		</td>
	</tr>
	<tr>
		<td colspan="2"> 
		<a id="role_add_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a> 
		</td>
	</tr>
</table>
</form>
</body>
</html>