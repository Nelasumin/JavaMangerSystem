<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/default.css">
<link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath}/daterangepicker/daterangepicker.css" />
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<script src="${pageContext.request.contextPath}/js/functions.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
function selectAll() {
	var o = $(".userId");
	//alert("aaaaa"+o.length);
	if (o!=null) {//
		for (i=0; i<o.length; i++) {
			o[i].checked = true;
		}
	} 
}
//CheckBox
function unSelectAll(formName, cbName) {
	var o = $(".userId");
	//alert("aaaaa"+o.length);
	if (o!=null) {//
		for (i=0; i<o.length; i++) {
			o[i].checked = false;
		}
	} 
}
</script>