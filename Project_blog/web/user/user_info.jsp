<%--
  Created by IntelliJ IDEA.
  User: baby sorry time
  Date: 2019/12/10
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div >

    <div >个人中心</div>
    <div >
        <ul>
            <li><a href="/user/ChangeName.jsp" >修改用户名</a></li>
            <li><a href="/user/ChangeEmail.jsp" >修改邮箱</a></li>
            <li><a href="/backPwd.jsp" >修改密码</a></li>
            <li><a href="/user/ChangeAge.jsp" >修改年龄</a></li>
            <li><a href="/user/ChangeSex.jsp" >修改性别</a></li>
        </ul>
    </div>
</div>
<div >
    <div >我的资料</div>
    <p  >用户名：${sessionScope.get("username")}</p>
    <p  >邮箱：${sessionScope.get("email")}</p>
    <p  >年龄：${sessionScope.get("age")}</p>
    <p  >性别：${sessionScope.get("sex")}</p>
    <br/><br/>
</div>
</body>
</html>
