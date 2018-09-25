<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
               var i=0;
                   
           function kechengSelect()
           {
               if(i==0)
               {
                   document.getElementById("indicator").style.display="block";
                   loginService.kechengSelect(callback);
                   i=1;
               }
               
           }
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("kechengId",data,"kechengId","kechengName");
               var kechengId= document.getElementById("kechengId");
               kechengId.value="<s:property value="#request.shiti.kechengId"/>";
               
           }
           function check()
           {
               if(document.formAdd.shitiName.value=="")
               {
                   alert("试卷名称不能空");
                   return false;
               }
               if(document.formAdd.kechengId.value==0)
               { 
                   alert("请选择课程");
                   return false;
               }
               return true;
           }
        </script>
	</head>

	<body   leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/shitiEdit.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#15A8E4" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span>试卷信息</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        试卷名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="shitiName" size="20"  value="<s:property value="#request.shiti.shitiName"/>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        试卷介绍：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						    <textarea  name="shitiJieshao"  rows="4" cols="30"><s:property value="#request.shiti.shitiJieshao"/></textarea>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        课程：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">

						       <select  name="kechengId" id="kechengId" >
							   		<c:choose>
									  <c:when test="${empty kechengList}">   
										  <option value="0" >无课程数据</option>
									  </c:when>
									  <c:otherwise>
										<c:forEach items="${kechengList}" var="t">	
							                <c:if test="${shiti.kechengId==t.kechengId}"><option  value="${t.kechengId}"  selected="selected">${t.kechengName}</option> </c:if> 
							                <c:if test="${shiti.kechengId!=t.kechengId}"><option value="${t.kechengId}" >${t.kechengName}</option> </c:if>						                   
										</c:forEach>
									  </c:otherwise>
									</c:choose>
							  </select>

						    </td>
						</tr>	
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        难度：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <input type="text" name="shitiNandu" size="20"  value="<s:property value="#request.shiti.shitiNandu"/>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						     <input type="hidden" name="shitiId" value="<s:property value="#request.shiti.shitiId"/>">
						      <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
