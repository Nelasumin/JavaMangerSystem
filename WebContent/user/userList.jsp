<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="container-fluid">
     <div class="row">
          <div class="text-center">
              <a href="index.jsp">返回注册页面</a>
          </div>
     </div>
         <div class="row">
        <div class="col-md-offset-4">
           <form action="${pageContext.request.contextPath}/SearchUser" method="post">
              <div class="form-group">
                 <label for="searchUsername"></label>
                 <input type="text" class="form-control" id="searchUsername" name="searchUsername"
                        placeholder="用户名"/>
              </div>
              <button type="submit" class="btn btn-info">按用户名查询</button>
           </form>
        </div>
    </div>
    <c:if test="${!empty requestScope.userList}">
     <div class="row">
         <form action="${pageContext.request.contextPath}/BatchDeleteUser"
         name="deleteForm" method="post">
            <div class="text-left">
               <button type="button" class="btn btn-info"
                  onclick="javascript:selectAll()">全选 </button>
               <button type="button" class="btn btn-default"
                  onclick="javascript:unSelectAll()">取消全选 </button>
               <input type="submit" value="批量删除" class="btn btn-danger"/>
            </div>
         
            <table class="table table-striped">
                <thead>
                   <tr class="title">
                      <th>序号</th>
                      <th>用户姓名</th>
                      <th>真实姓名</th>
                      <th>出生日期</th>
                      <th>性别</th>
                      <th>爱好</th>
                      <th>学历</th>
                      <th>自我介绍</th>
                      <th>操作</th>
                   </tr>
                </thead>
             <tbody>
                <c:forEach items="${requestScope.userList}" var="user">
                   <tr>
                      <td>
                         <input type="checkbox" class="userId" name="userId" value="${user.userid}"/>    ${user.userid}
                      </td>
                      <td>${user.username}</td>
                      <td>${user.realname}</td>
                      <td>${user.birthdate}</td>
                      <td>
                         <c:if  test="${!empty user.gender}">
                           ${user.gender==1?'男':'女'}
                          </c:if>
                      </td>
                      <td> 
                      <c:if  test="${!empty user.interest}">
                          ${user.interest}
                      </c:if>
                      <c:if  test="${empty user.interest}">
                                                   无爱好
                      </c:if>
                      </td>
                      <td>
                         <c:if test="${user.degree==1}">高中</c:if>
                         <c:if test="${user.degree==2}">专科</c:if>
                         <c:if test="${user.degree==3}">本科</c:if>
                         <c:if test="${user.degree==4}">研究生</c:if>
                         <c:if test="${user.degree==5}">博士</c:if>
                         <c:if test="${user.degree==6}">更高</c:if>
                      </td>
                      <td>${user.intro}</td>
                      <td>
                      <a href="${pageContext.request.contextPath}/UpdateUser?uid=${user.userid}">修改</a>
                     |<a href="${pageContext.request.contextPath}/DeleteUser?uid=${user.userid}"
                     onclick="return confirm('确定要删除吗？')">删除</a>
                      </td>
                   </tr>
                </c:forEach>
             </tbody>
            </table>
            </c:if>
             <c:if test="${empty requestScope.userList}">
                             没有查询到任何用户信息！！！
             </c:if>
         </form>
     </div>
 </div>
  
</body>
</html>