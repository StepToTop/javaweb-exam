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
           function kechengDel(kechengId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/kechengDel.action?kechengId="+kechengId;
               }
           }
           
           function kechengAdd()
           {
                 var url="<%=path %>/admin/kecheng/kechengAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#15A8E4" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="2" background="<%=path %>/images/tbg.gif">&nbsp;课程管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50%">课程名称</td>
					<td width="50%">操作</td>
		        </tr>	
				<s:iterator value="#request.kechengList" id="kecheng">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#kecheng.kechengName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="<%=path %>/kechengEditPre.action?kechengId=<s:property value="#kecheng.kechengId"/>"  class="pn-loperator">编辑</a>
						<a href="#" onclick="kechengDel(<s:property value="#kecheng.kechengId"/>)" class="pn-loperator">删除</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="kechengAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
