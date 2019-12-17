<%@ page import="entity.Blog" %><%--
  Created by IntelliJ IDEA.
  User: baby sorry time
  Date: 2019/12/17
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Blog blog=(Blog) request.getSession().getAttribute("blog");
%>

<tr>
    <td><%=blog.getType()%></td>
    <td>
        <input type="hidden" name="blogid" value="<%=blog.getId()%>">
        <a href="/ViewBlog">
            <%=blog.getTitle()%>
        </a>
    </td>
    <td><%=blog.getCreateTime()%></td>
    <td><%=blog.getUsername()%></td>
    <td>
        <input type="hidden" name="blogid" value="<%=blog.getId()%>">
        <a href="/ChangeBlog">修改</a>
            <input type="hidden" name="blogid" value="<%=blog.getId()%>">
            <a href="/DelBlog">删除</a>
    </td>
</tr>
<b/>
<%=blog.getContent()%>
</body>
</html>
