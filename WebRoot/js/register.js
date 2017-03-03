/**
 * �����ڸÿ�����ʾ��ʾ��Ϣ
 * @return
 */
function showDesc(id)
{  	
	var obj = document.getElementById(id);
	obj.style.display ="inline";
}

/**
 * ���UserName��ʽ�Ƿ���ȷ
 * @return
 */

function checkusername()
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
    	var flag;
    	$.ajax({
        	data:{
        		username: username
        	},
        	type: 'Get',
        	async: false,
        	url: 'servlet/Register',
        	success: function(resp) {
        		//console.log(resp);
        		if(resp.isExist=="false")  //如果数据库中有当前注册用户名	
        		{
        			obj.innerHTML="User name has been used";
        			obj.style.color="red";
        			flag=false;
        		}
        		else        //如果数据库中没有当前注册用户名
        		{
        	    	obj.style.color="#008400";
        	    	obj.style.display="none";
        	    	flag=true;
        		}
        		console.log("ajax success");
        	},
        	error: function(err) {
        		console.log("ajax error");
        	}
        });
    	return flag;
    }
}
/**
 * ���NickName��ʽ�Ƿ���ȷ
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
 * ��������ʽ�Ƿ���ȷ
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
 * ��������ȷ�������Ƿ�һ��
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
 * ���School��ʽ�Ƿ���ȷ
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
 * ���Email��ʽ�Ƿ���ȷ
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
function check(){	
	if(checkUsername()==true && checkPassword()==true && checkPassword2()==true && checkNickname()==true && checkEmail()==true)
	{
		//alert(checkUsername()+"  " +checkPassword()+"  " +checkPassword2()+"   "+checkNickname()+"    "+checkEmail())
		var username = document.getElementById("user_id").value;
		var nickname = document.getElementById("nick").value;
	    var passwd = document.getElementById("password").value;
	    var passwd2 = document.getElementById("rptPassword").value;
	    var school = document.getElementById("school").value;
	    var email =  document.getElementById("email").value;
	    
    	$.ajax({
        	data:{
        		username: username,
        		nickname: nickname,
        		password: passwd,
        		school: school,
        		email: email
        	},
        	type: 'Post',
        	url: 'servlet/Register',
        	success: function(resp) {
        		window.location.href=resp.url;
        		console.log("ajax success");
        	},
        	error: function(err) {
        		alert("++++++++");
        		console.log("ajax error");
        	}
        });
	}
}