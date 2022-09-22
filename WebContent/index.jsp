<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#username").blur(checkName);
	});
	function checkName(){
		var name=$("#username").val();
		$.post("${pageContext.request.contextPath}/CheckUser",{username:name},function(result){
			if(result=="true")
			{
				$("#result").html("用户名可用");
			}else
			{
				$("#result").html("用户名已经存在，请重新输入用户名！！！");
			}
		});
	} 
</script>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="text-center">
			<a href="GetAllUsers">查看所有用户信息</a>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-12">
		<form class="form" action="${pageContext.request.contextPath}/RegUser" name="myForm" method="post">
			<div class="panel panel-default">
				<div class="panel-heading text-center">请填写注册信息</div>
				<div class="panel-body col-md-offset-2">	
					<div class="row">
					<div class="form-group">
						<div class="col-md-2">
							<label for="username">用户名</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="username" id="username" class="form-control input-sm"/> 	
						</div>
						<div class="col-md-4">
							<!-- <button class="btn btn-primary btn-sm" type="button" onclick="checkName()">验证该用户名是否可用</button> -->
							<span id="result"></span>
						</div>
					</div>
					</div>
					<div class="row">
					<div class="form-group">
						<div class="col-md-2">
							<label for="password">密码</label>
						</div>
						<div class="col-md-6">
							<input type="password" name="password" class="form-control input-sm"/>
						</div>
					</div>
					</div>
					<div class="row">
					<div class="form-group">
						<div class="col-md-2">
							<label for="password">密码确认</label>
						</div>
						<div class="col-md-6">
							<input type="password" name="password1" class="form-control input-sm"/>
						</div>
					</div>
					</div>
					<div class="row">
					<div class="form-group">
						<div class="col-md-2">
							<label for="realname">姓名</label>
						</div>
						<div class="col-md-6">
							<input type="text" name="realname" class="form-control input-sm" />
						</div>
					</div>
					</div>
					<div class="row">
					<div class="form-group">
						<div class="col-md-2">
							<label for="birthdate">出生日期</label>
						</div>
						<div class="col-md-6">
							<input type="text" id="birthdate" name="birthdate" class="form-control input-sm">
							<script type="text/javascript" src="${pageContext.request.contextPath}/daterangepicker/require.js" data-main="${pageContext.request.contextPath}/daterangepicker/main.js"></script>
						</div>
					</div>
					</div>
					<div class="row">
					<div class="form-group">
						<div class="col-md-2">
							<label for="sex">性别</label>
						</div>
						<div class="col-md-6">
							<input type="radio" name="gender" value="1" checked >男 
							<input type="radio" name="gender" value="0">女
						</div>
					</div>
					</div>
					<div class="row">
					<div class="form-group">
						<div class="col-md-2">
							<label for="interest">爱好</label>
						</div>
						<div class="col-md-6">
							<input type="checkbox" name="interest" value="旅游">旅游<br>
							<input type="checkbox" name="interest" value="登山">登山<br>
							<input type="checkbox" name="interest" value="健身">健身<br>
							<input type="checkbox" name="interest" value="上网">上网<br>
							<input type="checkbox" name="interest" value="游泳">游泳<br>
						</div>
					</div>
					</div>
					<div class="row">
					<div class="form-group">
						<div class="col-md-2">
							<label for="degree">学历</label>
						</div>
						<div class="col-md-6">
							<select name="degree" class="form-control">
								<option>--请选择--</option>
								<option value="1">高中</option>
								<option value="2">专科</option>
								<option value="3">本科</option>
								<option value="4">研究生</option>
							</select>
						</div>
					</div>
					</div>
					<div class="row">
					<div class="form-group">
						<div class="col-md-2">
							<label for="intro">自我介绍</label>
						</div>
						<div class="col-md-6">
							<textarea name="intro" rows="5" cols="20" class="form-control"></textarea>
						</div>
					</div>
					</div>
				</div>
				<div class="panel-footer">
					<div class="form-group">
						<div class="text-center">
							<button class="btn btn-primary" type="submit" >确定</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary" type="reset" >重置</button>
						</div>
					</div>
				</div>			
			</div>
		</form>
		</div>
	</div>
</div>
</body>
</html>
