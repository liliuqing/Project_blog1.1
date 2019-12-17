<%--
  Created by IntelliJ IDEA.
  User: baby sorry time
  Date: 2019/12/1
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<c:if test="${not empty errMsg}">
    <p style="color :red">${errMsg}</p>
</c:if>
<form action="/regist" method="post">
    <input type="text" name="email" placeholder="请输入邮箱">
    <span id="msg1"></span><br/>
    <input type="text" name="emailMsg" placeholder="请输入验证码"><br/>
    <input type="button" value="发送验证码" onclick="location.href='${pageContext.request.contextPath}/User/emailServlet'">
    <br/>
    <input type="password" name="password" placeholder="请输入密码">
    <span id="msg2"></span><br/>
    <input type="password" name="password2" placeholder="请再次输入密码">
    <span id="msg3"></span><br/>
    <input type="text" name="username" placeholder="请输入用户名">
    <span id="msg4"></span><br/>
    <input type="text" name="age" placeholder="请输入年龄">
    <span id="msg5"></span><br/>
    男<input type="radio" name="sex" >女<input type="radio" name="sex" >
    <br/>
    <input type="submit" value="注册">
</form>

<script type="text/javascript">
    var xhr = new XMLHttpRequest();
    var email = document.getElementsByName("email")[0];
    var password = document.getElementsByName("password")[0];
    var password2 = document.getElementsByName("password2")[0];
    var username = document.getElementsByName("username")[0];
    var age = document.getElementsByName("age")[0];

    window.onload = function () {
        email.onblur=function(){
            var pwd=email.value;
            var msg=document.getElementById("msg1");
            if(pwd==""){
                msg.innerHTML = "×"
                msg.style.color = "red"
            } else {
                msg.innerHTML="√"
                msg.style.color="green"
            }

        }
        password.onblur=function(){
            var pwd=password.value;
            var msg=document.getElementById("msg2");
            if(pwd==""){
                msg.innerHTML = "×"
                msg.style.color = "red"
            } else {
                msg.innerHTML=""
                msg.style.color="green"
            }

        }
        password2.onblur=function(){
            var pwd=password2.value;
            var msg=document.getElementById("msg3");
            if(pwd==""){
                msg.innerHTML = "×"
                msg.style.color = "red"
            } else {
                msg.innerHTML=""
                msg.style.color="green"
            }

        }
        username.onblur=function(){
            var username=username.value;
            var msg=document.getElementById("msg4");
            if(username==""){
                msg.innerHTML = "×"
                msg.style.color = "red"
            } else {
                msg.innerHTML="√"
                msg.style.color="green"
            }

        }
        age.onblur=function(){
            var age=age.value;
            var msg=document.getElementById("msg5");
            if(age==""){
                msg.innerHTML = "×"
                msg.style.color = "red"
            } else {
                msg.innerHTML="√"
                msg.style.color="green"
            }

        }
    }
</script>

</body>
</html>
