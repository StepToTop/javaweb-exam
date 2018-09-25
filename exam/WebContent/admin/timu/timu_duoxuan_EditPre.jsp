<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 

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
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/timu_duoxuan_Edit.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#15A8E4" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span>多选题</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        题目名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="timuName" size="20" value="<s:property value="#request.timu.timuName"/>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" id="timuXuanxianga" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        选项A：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="timuXuanxianga" size="20" value="<s:property value="#request.timu.timuXuanxianga"/>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" id="timuXuanxiangb" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        选项B：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="timuXuanxiangb" size="20" value="<s:property value="#request.timu.timuXuanxiangb"/>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" id="timuXuanxiangc" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        选项C：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="timuXuanxiangc" size="20" value="<s:property value="#request.timu.timuXuanxiangc"/>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" id="timuXuanxiangd" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        选项D：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="timuXuanxiangd" size="20" value="<s:property value="#request.timu.timuXuanxiangd"/>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22" id="radioo">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        正确答案：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="timuDaan" size="20"  value="<s:property value="#request.timu.timuDaan"/>"/>
						        (<font style="color: red;font-size: 11px;">
						            直接输入答案即可。比如ABC
						        </font>)
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        分数：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <input type="text" value="<s:property value="#request.timu.timuFenshu"/>" name="timuFenshu" size="20" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        难度：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="timuNandu"  size="20" value="<s:property value="#request.timu.timuNandu"/>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						    <input type="hidden" name="timuId" value="<s:property value="#request.timu.timuId"/>"/>

						       <input type="submit" value="提交"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
