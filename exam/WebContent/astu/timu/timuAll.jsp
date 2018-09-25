<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<body>
			<form action="<%=path %>/jiaoyuanAdd.action" name="" method="post">		
			<table cellspacing="2" cellpadding="2">
			   <tr><td><font color="red" style="font-size: 16px;">每道题目都有默认值。请不要被默认值所误导</font></td></tr>
			</table>
			<c:forEach items="${sessionScope.timuList}"  varStatus="sta" var="timu">
			<table cellspacing="2" cellpadding="2">
				<tr>
					<td colspan="2">
						${sta.index+1 }：${timu.timuName }(${timu.timuLeixing },&nbsp;本题${timu.timuFenshu }分)
					</td>
				</tr>
				<tr>
					<td width="10">
					</td>
					<td>
						<c:if test="${timu.timuLeixing=='单选题'}">
						    A:<input type="radio" name="${timu.timuId}" value="A" style="border: 0" checked="checked"/>${timu.timuXuanxianga }<br/>
						    B:<input type="radio" name="${timu.timuId}" value="B" style="border: 0"/>${timu.timuXuanxiangb }<br/>
						    C:<input type="radio" name="${timu.timuId}" value="C" style="border: 0"/>${timu.timuXuanxiangc }<br/>
						    D:<input type="radio" name="${timu.timuId}" value="D" style="border: 0"/>${timu.timuXuanxiangd }<br/>
						</c:if>
						<c:if test="${timu.timuLeixing=='多选题'}">
						    A:<input type="checkbox" name="${timu.timuId}" value="A" style="border: 0" checked="checked"/>${timu.timuXuanxianga }<br/>
						    B:<input type="checkbox" name="${timu.timuId}" value="B" style="border: 0"/>${timu.timuXuanxiangb }<br/>
						    C:<input type="checkbox" name="${timu.timuId}" value="C" style="border: 0"/>${timu.timuXuanxiangc }<br/>
						    D:<input type="checkbox" name="${timu.timuId}" value="D" style="border: 0"/>${timu.timuXuanxiangd }<br/>
						</c:if>
						<c:if test="${timu.timuLeixing=='判断题'}">
						    A:<input type="radio" name="${timu.timuId}" value="A" style="border: 0" checked="checked"/>${timu.timuXuanxianga }<br/>
						    B:<input type="radio" name="${timu.timuId}" value="B" style="border: 0"/>${timu.timuXuanxiangb }<br/>
						</c:if>
						<c:if test="${timu.timuLeixing=='简答题'}">
						    <input name="${timu.timuId}" type="text"/>
						</c:if>
					</td>
				</tr>
			</table><br>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="交卷" style="width: 120px;"/>
			</form>
	</body>
</html>
