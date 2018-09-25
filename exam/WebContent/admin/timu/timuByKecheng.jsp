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
           function timuDel(timuId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/timuDel.action?timuId="+timuId;
               }
           }
           function timuEdit(timuId,leixing)
           {

               window.location.href="<%=path %>/timu_"+leixing+"_EditPre.action?timuId="+timuId;

           }
           
       </script>
	</head>

	<body>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#15A8E4" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="9" background="<%=path %>/images/tbg.gif">&nbsp;题库管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">题目名称</td>
					<td width="12%">选项A</td>
					<td width="15%">选项B</td>
					<td width="15%">选项C</td>
					<td width="15%">选项C</td>
					<td width="10%">答案</td>
					<td width="5%">分数</td>
					<td width="5%">题目类型</td>
					<td width="5%">操作</td>
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
						<s:if test="#timu.timuLeixing=='chengxusheji'">
						   课程设计
						</s:if>
						<s:if test="#timu.timuLeixing=='jianda'">
						    简答题
						</s:if>
						
					</td>
					<td bgcolor="#FFFFFF" align="center">
					<a href="#" onclick="timuEdit(<s:property value="#timu.timuId"/>,'<s:property value="#timu.timuLeixing"/>')" class="pn-loperator">编辑</a>
						<a href="#" onclick="timuDel(<s:property value="#timu.timuId"/>)" class="pn-loperator">删除</a>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
