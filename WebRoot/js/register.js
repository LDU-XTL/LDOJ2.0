/**
 * 焦点在该框上显示提示信息
 * @return
 */
function showDesc(id)
{  	
	var obj = document.getElementById(id);
	obj.style.display ="inline";
}

/**
 * 检查UserName格式是否正确
 * @return
 */

function checkUsername()
{
    var user = document.getElementById("user_id");
    var obj = document.getElementById("clue_user");
    var username=user.value;
    var patrn = /^[a-zA-Z0-9_]{5,15}$/;
    if(username.length==0)
    {
    	obj.style.display="none";
    	return false;
    }
    else if(!patrn.test(username))//
    {
    	obj.style.color = "red";
      	return false;
    }
    else
    {
    	obj.style.color="#008400";	
    	obj.style.display="none";
    	return true;
    }
}
/**
 * 检查NickName格式是否正确
 * @return
 */

function checkNickname(){
	var nickname = document.getElementById("nick").value;
	var obj = document.getElementById("clue_nick_name");
	var patrn = /^[\\u4e00-\\u9fa5_a-zA-Z0-9\W]{1,18}$/;
	//!patrn.exec(NickName)
	if(nickname.length==0)
	{
		obj.style.display="none";
		return false;
	}
	else if (!patrn.test(nickname)) 
	{	
		obj.style.color="red";
		return false;
	}
	else
	{
		obj.style.color="#008400";
		obj.style.display="none";
		return true;
	}
}

/**
 * 检查密码格式是否正确
 * @return
 */

function checkPassword()
{
	var passwd = document.getElementById("password").value;
	var obj = document.getElementById("clue_password");
	var patrn = /^[a-zA-Z0-9_]{6,20}$/;
	if(passwd.length==0)
	{
		obj.style.display="none";
		return false;
	}
	else if (!patrn.test(passwd))
	{	
		obj.style.color="red";
		return false;
	}
	else
	{
		obj.style.color="#008400";
		obj.style.display="none";
		return true;
	}
}

/**
 * 检查密码和确认密码是否一致
 * @return
 */

function checkPassword2()
{
     var id=document.getElementById("password");
     var id2=document.getElementById("rptPassword");
     var obj = document.getElementById("clue_rptpassword");
     var password1 = id.value;    
     var password2 = id2.value;
     if(password1!=password2)
     {
        obj.innerHTML="Password and new password do not match.";
        obj.style.color="red";
        return false;
     }
     else
     {
     	obj.innerHTML="6 - 16 letters and digits allowed";
     	obj.style.color="#008400";
     	obj.style.display="none";
     	return true;
     }
         
}

/**
 * 检查School格式是否正确
 * @return
 */

function checkSchool(){
	var id =  document.getElementById("school")
   	var Email = id.value;
   	var obj = document.getElementById("clue_school");
	obj.style.display="none";
	return true;
}
/**
 * 检查Email格式是否正确
 * @return
 */

function checkEmail()
{
   var id =  document.getElementById("email")
   var Email = id.value;
   var obj = document.getElementById("clue_email");
   var patrn = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    if(Email.length==0)
	{
		obj.style.display="none";
		return true;
	}
	else if (!patrn.exec(Email)) 
	{	
		obj.style.color="red";
		return false;
	}
	else
	{
		obj.style.color="#008400";
		obj.style.display="none";
		return true;
	}
}