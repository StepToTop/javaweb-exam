<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.sun.management.OperatingSystemMXBean" %>
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
	</head>

	<body>
	    <br/><br/><br/><br/><br/>
	    <table align="center" border="0" cellpadding="4" cellspacing="1">
		  <tr>
		    <td style="font-size: 40px;">欢迎使用考试管理系统</td>
		  </tr>
		</table>
	</body>
</html>
