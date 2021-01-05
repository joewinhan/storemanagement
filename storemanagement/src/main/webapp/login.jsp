<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录界面</title>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">   
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>   
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script> 

<script type="text/javascript">
var LOGIN = {
		checkInput:function() {
			//非空验证
	    	if($(":text:eq(0)").val()==""){
	        	$.messager.alert('系统信息','用户名不能为空');
	        	return false;
	        }
	        else if($(":password:eq(0)").val()==""){
	        	$.messager.alert('系统信息','密码不能为空');
	        	return false;
	        }
			return true;
		},
		doLogin:function() {
			$.post("login", $("#login_form").serialize(),function(fn){
				if (fn.status == 200) {
					location.href="main?rid="+fn.data.roleId+"&username="+fn.data.username;
				} else {
					$.messager.alert('系统消息','用户名或密码错误!');
				}
			});
		},
		login:function() {
			if (this.checkInput()) {
				this.doLogin();
			}
		}
	
};

$(function(){
	$("#login_submit").click(function(){
		LOGIN.login();
	});
});


/* $(function(){
	$("#login_submit").click(function(){
		$('#login_form').form('submit', {    
		    url:"login",    
		    onSubmit: function(){    
		        //非空验证
		    	if($(":text:eq(0)").val()==""){
		        	$.messager.alert('系统信息','用户名不能为空');
		        	return false;
		        }
		        else if($(":password:eq(0)").val()==""){
		        	$.messager.alert('系统信息','密码不能为空');
		        	return false;
		        }
		    },    
		    success:function(fn){  
		    	alert(fn);
		    	if(fn.status==200){
		    		alert(fn.data.username);
		       	 	location.href="page/main.jsp"; 
		       	}else{
		       		$.messager.alert('系统信息','登录失败');  
		       	}    
		    }    
		}); 
	})
}) */
</script>
</head>
<body style="background-color:#E9F1FF;">
	<div style="margin:150px auto;width:400px;">
		<div id="p" class="easyui-panel" title="登录"     
        style="width:400px;height:200px;padding:10px;background:#fafafa;"   
        data-options="iconCls:'icon-login',closable:false,    
                collapsible:false,minimizable:false,maximizable:false">   
	    <form action="login" method="post" id="login_form">
	    	<table width="225px" align="center">
	    		<tr>
	    			<td colspan="2" style="text-align: center;font-size: 20px">登录系统</td>
	    		</tr>
	    		<tr style="height: 40px">
	    			<td>用户名</td>
	    			<td><input type="text" name="username"></td>
	    		</tr>
	    		<tr style="height: 40px">
	    			<td>密码</td>
	    			<td><input type="password" name="password"></td>
	    		</tr>
	    		<tr>
	    			<td colspan="2" align="right">
	    				<a id="login_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">登录</a> 
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>  
	</div>
</body>
</html>