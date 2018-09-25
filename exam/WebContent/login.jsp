<%@ page language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<title>login.jsp</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
    <style type="text/css">
    body 
    {
	   margin-left: 0px;
	   background-image: url(<%=path %>/images/bhj.jpg);
    }
    .style2 {color: #990000}
    .input2 
    {
 	   font-size: 12px;
	   border: 3px double #A8D0EE;
	   color: #344898;
    }
    .submit1 
    {
	   border: 3px double #416C9C;
	   height: 22px;
	   width: 45px;
	   background-color: #F2F2F2;
	   font-size: 12px;
	   padding-top: 1px;
	   background-image: url(bt.gif);
	   cursor: hand;
    }
    .STYLE12 {font-family: Georgia, "Times New Roman", Times, serif}
    .STYLE13 {color: #316BD6; }
    .STYLE15 {color: #fdsere; font-size: 9pt; }
 </style>
 
 
 <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
 <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
 <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
      
 <script language="javascript">
 function check1()
 {                                                                                         
     if(document.ThisForm.userName.value=="")
	 {
	 	alert("请输入用户名");
		document.ThisForm.userName.focus();
		return false;
	 }
	 if(document.ThisForm.userType.value=="-1")
	 {
	 	alert("请选择登陆身份");
		document.ThisForm.userType.focus();
		return false;
	 }
	 document.getElementById("indicator").style.display="block";
	 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,document.ThisForm.userType.value,callback);
 }

 function callback(data)
 {
    document.getElementById("indicator").style.display="none";
    if(data=="no")
    {
        alert("用户名或密码错误");
    }
    if(data=="yes")
    {
        alert("通过验证,系统登录成功");
        window.location.href="<%=path %>/loginSuccess.jsp";
    }
 }
 </script>
</HEAD>
<body style="background-color: #FFFFFF; background-image:url('images/bg.gif')">

<form name="ThisForm" action="<%=path %>/login.action" method="POST">
<br><br><br>
       <table width="1000" height="600" border="0" align="center" cellpadding="0" cellspacing="0" background="images/backpic.png">
          <tr>
            <td style="width: 150px"></td>
            <td >　</td>
            <td height="250" >　</td>
          </tr>
        	<tr>
            <td >　</td>
            <td align="right" >
            </td>
                <td valign="middle" >
                </td>
          </tr>
			<tr>
            <td >　</td>
            <td align="right" ><font face="华文中宋" size="3">用 户 名：</font></td>
            <td valign="middle"  align="left">
                <input name="userName"  type="text" size="21" class="input2" onMouseOver="this.style.background='#F0DAF3';" onMouseOut="this.style.background='#FFFFFF'">
                                 </td>
          </tr>
			<tr>
            <td >　</td>
            <td align="right" ><font face="华文中宋" size="3">密&nbsp;&nbsp; &nbsp;&nbsp;码：</font></td>
            <td valign="middle" >
               <input name="userPw" type="password" size="21" class="input2" align="bottom" onMouseOver="this.style.background='#F0DAF3';" onMouseOut="this.style.background='#FFFFFF'">
                                  </td>
          </tr>
			<tr>
            <td >　</td>
            <td align="right" ><font face="华文中宋" size="3">类 &nbsp;&nbsp;&nbsp;&nbsp;型：</font></td>
            <td valign="middle">
                <select class="INPUT_text" name="userType">
							    <option value="-1" selected="selected">请选择登陆身份</option>
								<option value="0">管理员</option>
								<option value="1">老师</option>
								<option value="2">学生</option>
							 </select>
                                  </td>
          </tr>
			<tr>
            <td >　</td>
            <td>　</td>
            <td > <input name="button" type="button" class="submit1" value="登录" onClick="check1()"> &nbsp;
							<input name="Submit2" type="reset" class="submit1" value="重置">
							<img id="indicator" src="<%=path %>/images/loading.gif" style="display:none"/></td>
          </tr>
          <tr><td colspan=3 style="height: 200px">
           
          </td></tr>
        </table>
 </form>
</body>