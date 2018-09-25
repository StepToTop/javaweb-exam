<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

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
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
           
           function kaishikaoshi(shitiId)
           {
                var url="<%=path %>/timuByShiti_kaoshi.action?shitiId="+shitiId;
                window.location.href=url;
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#15A8E4" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="4" background="<%=path %>/images/tbg.gif">&nbsp;试卷管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="25%">试卷名称</td>
					<td width="25%">试卷介绍</td>
					<td width="25%">发布时间</td>
					<td width="25%">操作</td>
		        </tr>	
				<s:iterator value="#request.shitiList" id="shiti">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
							<s:property value="#shiti.shitiName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
							<s:property value="#shiti.shitiJieshao"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
							<s:property value="#shiti.shitiShijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a style="color: red" href="#" onclick="kaishikaoshi(<s:property value="#shiti.shitiId"/>)" class="pn-loperator">开始考试</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			        <input type="button" value="添加" style="width: 80px;" onclick="shitiAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
