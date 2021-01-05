<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>采购申请</title>
</head>
<body>
<script type="text/javascript">
function add(){
	/*验证输入是否合法*/
	if(emptyValidate($("#amount").val())){
    	$.messager.alert('系统信息','请输入商品数量！');
    	return false;
    }else if(numberValidate($("#amount").val())){
    	$.messager.alert('系统信息','请输入正确的商品数量！');
    	return false;
    }else if(emptyValidate($('#selectCommodity').combo('getText'))){
    	$.messager.alert('系统信息','请选择一个商品');
    	return false;
    }else if(emptyValidate($('#selectSupplier').combo('getText'))){
    	$.messager.alert('系统信息','请选择一个供应商');
    	return false;
    }
	
	$.post("page/addPurchaseOrder", $("#purchaseorder_add_form").serialize(),function(fn){
		if (fn.status == 200) {
			$.messager.show({
       			title:'系统消息',
       			msg:fn.msg,
       			timeout:5000,
       			showType:'slide'
       		});
       		//弹出框关闭
       		$("#purchase_order_add_dialog").dialog("close");
       		$('#purchase_order_table').datagrid('reload');
		} else {
			$.messager.alert("系统信息","添加失败,请重新添加");
		}
	});
}

$(function(){
	$("#purchaseorder_add_form_submit").click(add)
});

$('#selectCommodity').combobox({    
    url:'page/comboboxCommodity',    
    valueField:'id',  
    textField:'text',
    onSelect:function(rec){    
        var url = 'page/comboboxSupplier?commodityId='+rec.id;    
		$('#selectSupplier').combobox('reload', url);
		//获取选中商品的价格
		$.getJSON("page/showCommodityPrice",{ id: rec.id}, function(data){
			$("#unitPrice").val(data.price);
		});
    }
});

</script>

<div  style="padding:10px;">
商品管理 >> 采购商品
<hr/>
<form action="" method="post" id="purchaseorder_add_form">
<table>
	<tr>
		<td>请选择商品:</td>
		<td>
			<!-- <input id="selectCommodity" name="commodity" class="easyui-combobox" data-options="valueField: 'id',textField: 'text',editable:false,url: 'page/comboboxCommodity',onSelect:function(rec){    
            var url = 'page/comboboxSupplier?commodityId='+rec.id;    
    		$('#selectSupplier').combobox('reload', url);  
        }" />  -->
        <input id="selectCommodity" name="commodity" type="text">
		</td>
	</tr>
	<tr>
		<td>选择供应商:</td>
		<td>
			<input id="selectSupplier" name="supplier" class="easyui-combobox" data-options="valueField:'id',textField:'text',editable:false" /> 
		</td>
	</tr>
	<tr>
		<td>单价:</td>
		<td><input id="unitPrice" type="text" name="price" disabled="disabled"/> </td>
	</tr>
	<tr>
		<td>采购数量:</td>
		<td><input id="amount" type="text" name="amount"/> </td>
	</tr>
	
	<tr>
		<td colspan="2"> 
		<a id="purchaseorder_add_form_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确定</a> 
		</td>
	</tr>
</table>
</form>
</body>
</html>