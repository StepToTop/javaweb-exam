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
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script language="javascript">
           
           var s=0;
           function timuDelShiti(timuId,shitiId)
           {
               s=timuId;
               document.getElementById("indicator"+s).style.display="block";
               loginService.timuDelShiti(timuId,shitiId,callback);
           }
          
             function callback(data)
			 {
			    document.getElementById("indicator"+s).style.display="none";
			    if(data=="no")
			    {
			        alert("发生错误");
			    }
			    if(data=="yes")
			    {
			        alert("删除题目成功");
			        document.location.reload();
			    }
			 }
       </script>
	</head>

	<body>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#15A8E4" align="center" style="margin-top:8px">
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="11%">题目名称</td>
					<td width="11%">选项A</td>
					<td width="11%">选项B</td>
					<td width="11%">选项C</td>
					<td width="11%">选项C</td>
					<td width="11%">答案</td>
					<td width="11%">分数</td>
					<td width="11%">题目类型</td>
					<td width="11%">操作</td>
		        </tr>	
				<s:iterator value="#request.timuList" id="timu">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#timu.timuName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#timu.timuXuanxianga"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#timu.timuXuanxiangb"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#timu.timuXuanxiangc"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#timu.timuXuanxiangd"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#timu.timuDaan" escape="false"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#timu.timuFenshu"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:if test="#timu.timuLeixing=='danxuan'">
						    单选题
						</s:if>
						<s:if test="#timu.timuLeixing=='duoxuan'">
						    多选题
						</s:if>
						<s:if test="#timu.timuLeixing=='panduan'">
						    判断题
						</s:if>
						<s:if test="#timu.timuLeixing=='jianda'">
						    简答题
						</s:if>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a style="color: red" href="#" onclick="timuDelShiti(<s:property value="#timu.timuId"/>,<s:property value="#request.shitiId"/>)" class="pn-loperator">删除</a>
						<img id="indicator<s:property value="#timu.timuId"/>" src="<%=path %>/images/loading.gif" style="display:none"/>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
