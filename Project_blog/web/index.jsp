<%--
  Created by IntelliJ IDEA.
  User: baby sorry time
  Date: 2019/11/26
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
      <head>
          <meta charset="UTF-8">
          <title>博客</title>
      </head>
  <body>
  <div >博客</div>
  <div >
      <div >
          <ul >
              <li><a href="/index.jsp">首页</a></li>
              <li><a href="/user/user_info.jsp">用户管理</a></li>
              <li><a href="/user/blog_info.jsp">博客管理</a></li>
              <li><a href="/login.jsp">退出</a></li>
          </ul>
      </div>
      <div><a href="/user/addblog.jsp">添加博客</a></div>
      <div >
          <div >
              <h2>
                  <%
                      if(request.getSession().getAttribute("username")==null)
                      {
                  %>
                  <a href="login.jsp">登录</a>
                  <br/>
                  <a href="regist.jsp">注册</a>
                  <%
                  }
                  else{
                  %>
                  ${sessionScope.get("username")}您好，欢迎登录博客
                  <%
                      }
                  %>
              </h2>
          </div>
      </div>
  </div>
  </body>
</html>
