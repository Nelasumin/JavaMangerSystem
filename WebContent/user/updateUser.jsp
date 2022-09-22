<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  $(document).ready(function()
    {
	  $("#realname").blur(checkRealName);
	  $("#pw1").blur(checkPassword);
    }
		  
  )
  function checkPassword()
  {
	  var pw=$("#pw").val();
	  var pw1=$("#pw1").val();
	  if(pw!=pw1)
	  {
		  $("#checkPassReslt").html("两次输入的密码不一致");
	  }
	  else
      {
		  $("#checkPassReslt").html("");
      }
	  
  }
  function checkRealName()
  {
	  var name=$("#realname").val();
	  if(name=="")
	   {
		  $("#checkPassReslt").html("realname不能为空");
		  $("#realname").focus();
	   }else
	   {
		  $("#checkPassReslt").html("");
	   }
  }
</script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
       <div>
         <a href="${pageContext.request.contextPath}/GetAllUsers">查看所有用户信息</a>
       </div>
    </div>
    <hr>
    <div class="row">
       <div class="col-md-12">
         <form action="${pageContext.request.contextPath}/DealUpdateUser" name="myForm" method="post">
            <input type="hidden" name="uid" value="${user.userid}">
            <div class="panel panel-default">
              <div class="panel-heading text-center">
                                请填写用户信息
              </div>
              <div class="panel-body col-md-offset-2">
                 <div class="row">
                   <div class="form-group">
                      <div class="col-md-2">
                          <label for="username">用户名</label>
                      </div>
                      <div class="col-md-6">
                         ${user.username}
                      </div>
                   </div>
                 </div>
                 <div class="row">
                    <div class="form-group">
                        <div class="col-md-2">
                           <label for="password">密码</label>
                        </div>
                        <div class="col-md-6">
                          <input type="password" name="password" id="pw" class="form-control input-sm" 
                          value="${user.password}"/>
                        </div>
                    </div>
                 </div>
                 
                 <div class="row">
                    <div class="form-group">
                        <div class="col-md-2">
                           <label for="password">密码确认</label>
                        </div>
                        <div class="col-md-6">
                          <input type="password" name="password1" id="pw1" class="form-control input-sm" 
                          value="${user.password}"/>
                        </div>
                        <div class="col-md-4">
                           <span>
                            <p class="text-danger" id="checkPassReslt"></p>
                           </span>
                        </div>
                    </div>
                 </div>
                 
                 <div class="row">
                    <div class="form-group">
                        <div class="col-md-2">
                           <label for="realname">姓名</label>
                        </div>
                     <div class="col-md-6">
                        <input type="text" name="realname" id="realname" 
                        class="form-control input-sm" value="${user.realname}"/>
                     </div>
                    </div>
                 </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-md-2">
                           <label for="birthdate">出生日期</label>
                        </div>
                     <div class="col-md-6">
                        <input type="text" name="birthdate" class="form-control input-sm" 
                        value="${user.birthdate}">
                        <script type="text/javascript" src="${pageContext.request.contextPath}/daterangepicker/require.js"
                           data-main="${pageContext.request.contextPath}/daterangepicker/main.js">
                        </script>
                     </div>
                    </div>
                 </div>
                 <div class="row">
                    <div class="form-group">
                        <div class="col-md-2">
                           <label for="sex">性别</label>
                        </div>
                     <div class="col-md-6">
                        <c:if test="${user.gender==1}">
                           <input type="radio" name="gender" value="1" checked>男
                           <input type="radio" name="gender" value="0">女
                        </c:if>
                        <c:if test="${user.gender==0}">
                           <input type="radio" name="gender" value="1" >男
                           <input type="radio" name="gender" value="0" checked>女
                        </c:if>
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
                       <input type="checkbox" name="interest" value="读书">读书<br>
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
                           <option>请选择</option>
          
                           <c:if test="${user.degree==1}">
                             <option value="1" selected>高中</option>
                           </c:if>
                           <c:if test="${user.degree!=1}">
                             <option value="1" selected>高中</option>
                           </c:if>
                           
                           <c:if test="${user.degree==2}">
                             <option value="2" selected>专科</option>
                           </c:if>
                                <c:if test="${user.degree!=2}">
                             <option value="2" selected>专科</option>
                           </c:if>
                           
                           <c:if test="${user.degree==3}">
                             <option value="3" selected>本科</option>
                           </c:if>
                           
                           <c:if test="${user.degree!=3}">
                             <option value="3" selected>本科</option>
                           </c:if>
                           <c:if test="${user.degree==4}">
                             <option value="4" selected>研究生</option>
                           </c:if>
                           <c:if test="${user.degree!=4}">
                             <option value="4" selected>研究生</option>
                           </c:if>
                           <c:if test="${user.degree==5}">
                             <option value="5" selected>博士</option>
                           </c:if>
                           
                           <c:if test="${user.degree!=5}">
                             <option value="5" selected>博士</option>
                           </c:if>
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
                        <textarea name="intro" rows="5" cols="20" class="form=control">${user.intro}</textarea>
                     </div>
                    </div>
                 </div>
              
            </div>
            <div class="panel-footer">
               <div class="form-group">
                   <div class="text-center">
                     <button class="btn btn-primary" type="submit">修改</button>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <button class="btn btn-primary" type="reset">重置</button>
                   </div>
               </div>
            </div>
         </form>
       </div>
    </div>
</div>
</body>
</html>