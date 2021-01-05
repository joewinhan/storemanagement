function numberValidate(num)
{
	var n = Number(num);
	if(n>0){
		return false;
	}
	return true;
}

function emptyValidate(val){
	if(val == '' || val == undefined || val == null)
		return true;
	else{
		var str = val.trim();
	    if (str == '') 
	        return true;
        else
        	return false;
	}
}

function phoneValidate(phone){
	return false;
}

function notPassword(s){
	   var regu = "^[0-9a-zA-Z]{6,16}$"; 
	   var re = new RegExp(regu); 
	   if (re.test(s)) { 
	       return false; 
	   }else{ 
	      return true; 
	   }
}