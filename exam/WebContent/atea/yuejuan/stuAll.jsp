<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        
        <script language="javascript">
            function dd(theform)
            {  
                if(theform.shitiId.value==0)
                {
                    alert("请选择试题");
                    return false;
                }
                return true;
            }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#15A8E4" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="7" background="<%=path %>/images/tbg.gif">&nbsp;学生管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="14%">学号</td>
					<td width="14%">姓名</td>
					<td width="14%">性别</td>
					<td width="8%">年龄</td>
					<td width="14%">学院</td>
					<td width="16%">班级</td>
					<td width="20%">操作</td>
		        </tr>	
				<s:iterator value="#request.stuList" id="stu">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#stu.stuXuehao"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#stu.stuRealname"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#stu.stuSex"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#stu.stuAge"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#stu.stuXueyuan"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#stu.stuBanji"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <form action="<%=path %>/yuejuan.action" name="form1" method="post" onsubmit="return dd(this)">
					        <input type="hidden" name="stuId" value="<s:property value="#stu.stuId"/>"/>
					        <table border="0">
					           <tr> 
					               <td>  
					                  <select name="shitiId" id="shitiId">
							              <option value="0">--请选择试题--</option>
							              <s:iterator status="" value="#request.shitiList" id="shiti">
							              <option value="<s:property value="#shiti.shitiId"/>"><s:property value="#shiti.shitiName"/></option>
							              </s:iterator>
							          </select>
					               </td>
					               <td>
					                  <input type="submit" class="pn-loperator" value="阅卷"/>
					               </td>
					           </tr>
					        </table>
						</form>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
