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
           function shitiDel(shitiId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/shitiDel.action?shitiId="+shitiId;
               }
           }
           function shitiAdd()
           {
                 var url="<%=path %>/admin/shiti/shitiAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
           
           
           function timuAddShiti(shitiId,kechengId)
           {
                //var url="<%=path %>/admin/shiti/kecheng.jsp?shitiId="+shitiId;
                var url="<%=path %>/timuByKecheng1.action?shitiId="+shitiId+"&kechengId="+kechengId;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:800,height:700});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","题目添加");
	            pop.build();
	            pop.show();
           }
           
           function timuDelShiti(shitiId)
           {
                var url="<%=path %>/timuByShiti.action?shitiId="+shitiId;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:800,height:700});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","题目查看");
	            pop.build();
	            pop.show();
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#15A8E4" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="4" background="<%=path %>/images/tbg.gif">&nbsp;试卷管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="30%">试卷名称</td>
					<td width="20%">课程</td>
					<td width="10%">难度</td>
					
					<td width="15%">发布时间</td>
					<td width="25%">操作</td>
		        </tr>	
				<s:iterator value="#request.shitiList" id="shiti">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
							<s:property value="#shiti.shitiName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
							<s:property value="#shiti.kechengName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
							<s:property value="#shiti.shitiNandu"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
							<s:property value="#shiti.shitiShijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <a href="<%=path %>/shitiAutoPre.action?shitiId=<s:property value="#shiti.shitiId"/>"  class="pn-loperator">自动组卷</a>
					    <a href="<%=path %>/shitiEditPre.action?shitiId=<s:property value="#shiti.shitiId"/>"  class="pn-loperator">编辑</a>
						<a style="color: red" href="#" onclick="shitiDel(<s:property value="#shiti.shitiId"/>)" class="pn-loperator">删除</a>
						<a style="color: red" href="#" onclick="timuDelShiti(<s:property value="#shiti.shitiId"/>)" class="pn-loperator">题目查看</a>
						<a style="color: red" href="#" onclick="timuAddShiti(<s:property value="#shiti.shitiId"/>,<s:property value="#shiti.kechengId"/>)" class="pn-loperator">题目添加</a>
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
