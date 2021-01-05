<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改客户信息</title>
</head>
<body>
<script type="text/javascript">

function modify(){
	
	/*验证输入是否合法*/
	if(emptyValidate($("#name").val())){
    	$.messager.alert('系统信息','请输入客户名！');
    	return false;
    }else if(emptyValidate($("#address").val())){
    	$.messager.alert('系统信息','请输入客户地址！');
    	return false;
    }else if(emptyValidate($('#phoneNum').val())){
    	$.messager.alert('系统信息','请输入客户电话号码');
    	return false;
    }else if(phoneValidate($('#phoneNum').val())){
    	$.messager.alert('系统信息','请输入正确的电话号码');
    	return false;
    }
	
	$.post("page/modifyCustomer", $("#customer_edit_form").serialize(),function(fn){
		if (fn.status == 200) {
			$.messager.show({
       			title:'系统消息',
       			msg:fn.msg,
       			timeout:5000,
       			showType:'slide'
       		});
       		//弹出框关闭
       		$("#customer_edit_dialog").dialog("close");
       		$('#customer_table').datagrid('reload');
		} else {
			$.messager.alert("系统信息","添加失败,请重新添加");
		}
	});
}

$(function(){
	$("#customer_edit_submit").click(modify)
});


</script>
<div  style="padding:10px;">
客户管理 >> 修改客户信息
<hr/>
<form action="" method="post" id="customer_edit_form">
<input type="hidden" name="id"/>
<table>
	<tr>
		<td>客户名:</td>
		<td><input id="name" type="text" name="name"/> </td>
	</tr>
	<tr>
		<td>地址:</td>
		<td><input id="address" type="text" name="address"/> </td>
	</tr>
	<tr>
		<td>信誉度:</td>
		<td>
			<input id="reputation" type="text" name="reputation"/> 
		</td>
	</tr>
	<tr>
		<td>重要性:</td>
		<td><input type="text" name="priority"/> </td>
	</tr>
	<tr>
		<td>电话:</td>
		<td><input id="phoneNum" type="text" name="phoneNum"/> </td>
	</tr>
	
	<tr>
		<td colspan="2"> 
		<a id="customer_edit_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a> 
		</td>
	</tr>
</table>
</form>
</body>
</html>