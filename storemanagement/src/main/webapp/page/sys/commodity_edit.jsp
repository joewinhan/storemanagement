<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改商品</title>
</head>
<body>
<script type="text/javascript">

function modify(){
	
	/*验证输入是否合法*/
	 if($(emptyValidate("#name").val())){
   	$.messager.alert('系统信息','请输入商品名称！');
   	return false;
   }else if(numberValidate($("#unitPrice").val())){
   	$.messager.alert('系统信息','请输入正确的单价！');
   	return false;
   }else if(emptyValidate($('#chooseSupplier').combo('getText'))){
   	$.messager.alert('系统信息','请选择一个供应商');
   	return false;
   }else if(emptyValidate($("#place").val())){
   	$.messager.alert('系统信息','请输入商品产地！');
   	return false;
   }
	
	$.post("page/modifyCommodity", $("#commodity_edit_form").serialize(),function(fn){
		if (fn.status == 200) {
			$.messager.show({
       			title:'系统消息',
       			msg:fn.msg,
       			timeout:5000,
       			showType:'slide'
       		});
       		//弹出框关闭
       		$("#commodity_modify_dialog").dialog("close");
       		$('#commodity_table').datagrid('reload');
		} else {
			$.messager.alert("系统信息","添加失败,请重新添加");
		}
	});
}

$(function(){
	$("#commodity_edit_submit").click(modify)
});

$('#selectSupplier').combobox({    
    url:'page/showAllSupplier',    
    valueField:'id',    
    textField:'text'   
});

</script>
<div  style="padding:10px;">
商品管理 >> 修改商品信息
<hr/>
<form action="" method="post" id="commodity_edit_form">
<input type="hidden" name="id"/>
<table>
	<tr>
		<td>商品名称:</td>
		<td><input id="name" type="text" name="name"/> </td>
	</tr>
	<tr>
		<td>单价:</td>
		<td><input id="unitPrice" type="text" name="price"/> </td>
	</tr>
	<tr>
		<td>产地:</td>
		<td>
			<input id="place" type="text" name="place"/> 
		</td>
	</tr>
	<tr>
		<td>供应商:</td>
		<td>
			<input id="selectSupplier" type="text" name="supplierId"/>
		</td>
	</tr>
	
	<tr>
		<td colspan="2"> 
		<a id="commodity_edit_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a> 
		</td>
	</tr>
</table>
</form>
</body>
</html>