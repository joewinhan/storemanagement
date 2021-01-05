<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改供应商信息</title>
</head>
<body>
<script type="text/javascript">

function modify(){
	/*验证输入是否合法*/
 	if(emptyValidate($("#name").val())){
	   	$.messager.alert('系统信息','请输入供应商名称！');
	   	return false;
   	}else if(emptyValidate($("#address").val())){
	   	$.messager.alert('系统信息','请输入供应商地址！');
	   	return false;
   	}else if(emptyValidate($("#phoneNum").val())){
	   	$.messager.alert('系统信息','请选择供应商电话');
	   	return false;
   	}else if(phoneValidate($("#phoneNum").val())){
   		$.messager.alert('系统信息','请输入正确的电话号码');
   		return false;
   	}
	
	$.post("page/modifySupplier", $("#supplier_edit_form").serialize(),function(fn){
		if (fn.status == 200) {
			$.messager.show({
       			title:'系统消息',
       			msg:fn.msg,
       			timeout:5000,
       			showType:'slide'
       		});
       		//弹出框关闭
       		$("#supplier_edit_dialog").dialog("close");
       		$('#supplier_table').datagrid('reload');
		} else {
			$.messager.alert("系统信息","添加失败,请重新添加");
		}
	});
}

$(function(){
	$("#supplier_edit_submit").click(modify)
});


</script>
<div  style="padding:10px;">
供应商管理 >> 修改供应商信息
<hr/>
<form action="" method="post" id="supplier_edit_form">
<input type="hidden" name="id"/>
<table>
	<tr>
		<td>供应商名称:</td>
		<td><input id="name" type="text" name="name"/> </td>
	</tr>
	<tr>
		<td>地址:</td>
		<td><input id="address" type="text" name="address"/> </td>
	</tr>
	<tr>
		<td>信誉:</td>
		<td>
			<input type="text" name="reputation"/> 
		</td>
	</tr>
	<tr>
		<td>电话:</td>
		<td>
			<input id="phoneNum" type="text" name="phoneNum"/>
		</td>
	</tr>
	
	<tr>
		<td colspan="2"> 
		<a id="supplier_edit_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a> 
		</td>
	</tr>
</table>
</form>
</body>
</html>