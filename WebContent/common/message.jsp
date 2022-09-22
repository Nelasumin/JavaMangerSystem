<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>统一信息提示</title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="text-center">
				<div class="alert alert-info" role="alert">
					${messageInfo}
				</div>
				<a href="${pageContext.request.contextPath}/GetAllUsers">返回</a>
			</div>
		</div>
	</body>
</html>
