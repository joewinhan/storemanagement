<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改权限</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$("#privilege_submit").click(function(){
		var arr =$('#privilege_tree').tree('getChecked', ['checked','indeterminate']);
		var result = "";
		for(var i = 0;i<arr.length-1;i++){
			result+=arr[i].text+",";
		}
		result += arr[arr.length-1].text;
		encodeURI(encodeURI(result));
		var id = $("#rid").val();
		$.getJSON("page/modifyPrivilege",{ rid: id,names:result}, function(data){
			if(data.status == 200){
				alert(data.msg);
				$('#role_table').datagrid('reload');
				$('#role_edit_dialog').dialog('close');
			}
		});
		
		/* $.ajax({
		    type: "POST",
		    url: "page/modifyPrivilege",
		    contentType: "application/json; charset=utf-8",
		    dataType: "json",
		    data: {'rid':id,'names':result},
		    success: function(json) {
		    	if(data.status == 200){
					alert(data.msg);
					$('#role_table').datagrid('reload');
				}else{
					alert(data.msg);
				}
		    },
		   
		}); */
	});
})
</script>
<form id="privilege_form" method="post"> 
<input id="rid" type="hidden" name="id"/>
菜单导航：<ul id="privilege_tree"></ul>
<a id="privilege_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">提交</a>  
</form>
</body>
</html>