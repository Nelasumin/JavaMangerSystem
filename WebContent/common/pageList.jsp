<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<script language="javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script language="javascript">
function goPage(curPage){
	var pageList=document.getElementById("pageList");
	document.getElementById("curPage").value=curPage;
	pageList.submit();
}
</script>
<center>
<c:set var="curPage" value="1"/>
<c:set var="pNames" value="${pageContext.request.parameterNames}"/>
<!--<c:set var="temp"/>-->
<c:forEach items="${pNames}" var="pn">
<!-- 	<c:set var="temp" value="${param[pn]}"/>-->
	<%
		/* String t=(String)pageContext.getAttribute("temp");
		t=java.net.URLEncoder.encode(t,"UTF-8");
		pageContext.setAttribute("temp",t); */
	%> 
	<c:if test="${pn!='curPage'}">
		<c:set var="params" value="${params}&${pn}=${temp}"/>
		<c:set var="hid" >
			${hid} <input type='hidden' name='${pn}' value='${param[pn]}'>
		</c:set>
	</c:if>
	<c:if test="${pn=='curPage'}">
		<c:set var="curPage" value="${param[pn]}"/>
	</c:if>
</c:forEach>

<c:set var="aNames" value="${pageContext.request.attributeNames}"/>
<c:forEach items="${aNames}" var="an">
<c:if test="${requestScope.attribute[an]}">
	<c:if test="${an.list!=null&&an.totalPage!=null}">
		<c:set var="totalPage" value="${an.totalPage}"/>
	</c:if>
</c:if>
</c:forEach>

<form id="pageList" action="${pageContext.request.contextPath}${actionUrl}" Method="post" onSubmit="return validateForm(this)">
${hid}
<!--当前页不是第一页，则应该有"上一页"；当前页不是最后一页，则应该有"下一页"-->
<c:if test="${curPage>1}"> 
	<a href="javaScript:goPage(1)">首页</a>&nbsp;
	<a href="javaScript:goPage(${curPage-1})">上一页</a>&nbsp;
</c:if>
<c:if test="${curPage<=1}">
	首页&nbsp;上一页&nbsp;
</c:if>
<c:if test="${curPage<pageInfo.totalPage}"> 
	<a href="javaScript:goPage(${curPage+1})"  >下一页</a>&nbsp;
	<a href="javaScript:goPage(${pageInfo.totalPage})">尾页</a>&nbsp;
</c:if>
<c:if test="${curPage>=pageInfo.totalPage}">
	下一页&nbsp;尾页&nbsp;
</c:if>
  转去第 <input type="text" id="curPage" name="curPage" size="3" numberInfo="请输入有效页码！"> 页<input type="submit" value="Go">
  页数：<font color="red">${curPage}/${pageInfo.totalPage}</font> 
</form>
</center>