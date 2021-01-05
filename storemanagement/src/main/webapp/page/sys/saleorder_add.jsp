<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品添加</title>
</head>
<body>
<script type="text/javascript">

function validate(num)
{
	var n = Number(num);
	if(n>0){
		return true;
	}
	return false;
}

function add(){
	/*验证输入是否合法*/
	if($("#amount").val()==""){
    	$.messager.alert('系统信息','请输入商品数量！');
    	return false;
    }else if(Number($("#amount").val()) > Number($("#stockBalance").val())){
	   	$.messager.alert('系统信息','购买数量不能超过库存，请重新输入数量！');
	   	return false;
   	}else if(!validate($("#amount").val())){
    	$.messager.alert('系统信息','请输入正确的商品数量！');
    	return false;
    }else if($('#selectCommodity').combo('getText')==""){
    	$.messager.alert('系统信息','请选择一个商品');
    	return false;
    }else if($('#selectSupplier').combo('getText')==""){
    	$.messager.alert('系统信息','请选择一个供应商');
    	return false;
    }else  if($('#selectCustomer').combo('getText')==""){
    	$.messager.alert('系统信息','请选择一个客户');
    	return false;
    }
	
	$.post("page/addSaleOrder", $("#saleorder_add_form").serialize(),function(fn){
		if (fn.status == 200) {
			$.messager.show({
       			title:'系统消息',
       			msg:fn.msg,
       			timeout:5000,
       			showType:'slide'
       		});
       		//弹出框关闭
       		$("#sale_order_add_dialog").dialog("close");
       		$('#sale_order_table').datagrid('reload');
		} else {
			$.messager.alert("系统信息","添加订单失败,请重新添加");
		}
	});
}

$(function(){
	$("#saleorder_add_form_submit").click(add)
});

$('#selectCommodity').combobox({    
    url:'page/comboboxCommodityWithBalance',    
    valueField:'id',  
    textField:'text',
    onSelect:function(rec){    
        var url = 'page/comboboxSupplier?commodityId='+rec.id;    
		$('#selectSupplier').combobox('reload', url);
		//获取选中商品的价格
		$.getJSON("page/showCommodityPrice",{ id: rec.id}, function(data){
			$("#unitPrice").val(data.price);
		});
		//获取选中商品的库存剩余量
		$.getJSON("page/showCommodityStockBalance",{ cid: rec.id}, function(data){
			$("#balance").html("库存剩余:"+data.stockBalance);
			$("#balance").css("color","red");
			$("#stockBalance").val(data.stockBalance);
		});
		
    }
});

$('#selectCustomer').combobox({    
    url:'page/comboboxCustomer',    
    valueField:'id',  
    textField:'text',
});

</script>

<div  style="padding:10px;">
销售订单管理 >> 出售商品
<hr/>
<form action="" method="post" id="saleorder_add_form">
<table>
	<tr>
		<td>请选择商品:</td>
		<td>
        	<input id="selectCommodity" name="commodityId" type="text">
		</td>
	</tr>
	<tr>
		<td>选择供应商:</td>
		<td>
			<input id="selectSupplier" name="supplierId" class="easyui-combobox" data-options="valueField:'id',textField:'text',editable:false" /> 
		</td>
	</tr>
	<tr>
		<td>选择客户:</td>
		<td>
			<input id="selectCustomer" name="customerId" class="easyui-combobox" data-options="valueField:'id',textField:'text',editable:false" /> 
		</td>
	</tr>
	<tr>
		<td>单价:</td>
		<td><input id="unitPrice" type="text" name="price" readonly="readonly"/> </td>
	</tr>
	<tr>
		<td>数量:</td>
		<td><input id="amount" type="text" name="amount"/></td>
		<td><span id="balance"></span></td>
		<td><input type="hidden" id="stockBalance" name="stockBalance"></span></td>
	</tr>
	<tr>
		<td colspan="2"> 
		<a id="saleorder_add_form_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确定</a> 
		</td>
	</tr>
</table>
</form>
</body>
</html>