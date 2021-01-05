<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加供应商</title>
</head>
<body>

<script type="text/javascript">

function add(){
	/*验证输入是否合法*/
 	if(emptyValidate($("#name").val())){
	   	$.messager.alert('系统信息','请输入供应商名称！');
	   	return false;
   	}else if(emptyValidate($("#address").val())){
	   	$.messager.alert('系统信息','请输入供应商地址！');
	   	return false;
   	}else if(emptyValidate($("#phoneNum").val())){
	   	$.messager.alert('系统信息','请输入供应商电话');
	   	return false;
   	}else if(phoneValidate($("#phoneNum").val())){
   		$.messager.alert('系统信息','请输入正确的电话号码');
   		return false;
   	}
	
	$.post("page/addSupplier", $("#supplier_add_form").serialize(),function(fn){
		if (fn.status == 200) {
			$.messager.show({
       			title:'系统消息',
       			msg:fn.msg,
       			timeout:5000,
       			showType:'slide'
       		});
       		//弹出框关闭
       		$("#supplier_add_dialog").dialog("close");
       		$('#supplier_table').datagrid('reload');
		} else {
			$.messager.alert("系统信息","添加失败,请重新添加");
		}
	});
}

$(function(){
	$("#supplier_add_submit").click(add)
});

</script>

<div  style="padding:10px;">
供应商管理 >> 添加供应商
<hr/>
<form action="" method="post" id="supplier_add_form">
<table>
	<tr>
		<td>供应商名称:</td>
		<td>
        	<input id="name" type="text" name="name">
		</td>
	</tr>
	<tr>
		<td>供应商地址:</td>
		<td>
			<input id="address" type="text" name="address"  /> 
		</td>
	</tr>
	<tr>
		<td>信誉度:</td>
		<td><input type="text" name="reputation"/> </td>
	</tr>
	<tr>
		<td>电话:</td>
		<td><input id="phoneNum" type="text" name="phoneNum"/> </td>
	</tr>
	<tr>
		<td colspan="2"> 
		<a id="supplier_add_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a> 
		</td>
	</tr>
</table>
</form>
</body>
</html>