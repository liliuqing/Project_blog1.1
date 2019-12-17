<%@ page import="Dao.BlogDaoImp" %>
<%@ page import="Dao.BlogDao" %>
<%@ page import="entity.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
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
</div>
<div>

    <table>
        <tr>
            <th>类型</th>
            <th>标题</th>
       <!--
         <th>配图</th>
       -->
            <th>发布时间</th>
            <th>发布人</th>
            <th>操作</th>
        </tr>
<%
    BlogDao dao = new BlogDaoImp();
    List<Blog> blogList=dao.viewAll();
    Iterator iterator=blogList.iterator();
    while (iterator.hasNext()){
        Blog blog=(Blog)iterator.next();
        %>

        <tr>
            <td><%=blog.getType()%></td>
            <td>
                <input type="hidden" name="blogid" value="<%=blog.getId()%>">
                <a href="/user/viewblog.jsp">
                    <%=blog.getTitle()%>
                </a>
            </td>
            <!--
             <td>
                <img width="50" height="50" src="{pageContext.request.contextPath}{blog.imgUrl}" />
            </td>
             -->

            <td><%=blog.getCreateTime()%></td>
            <td><%=blog.getUsername()%></td>
            <td>
                <input type="hidden" name="blogid" value="<%=blog.getId()%>">
                <a href="/ChangeBlog">修改</a>
                <input type="hidden" name="blogid" value="<%=blog.getId()%>">
                <a href="/DelBlog">删除</a>
            </td>
        </tr>

        <%

    }
%>


    </table>

</div>
</body>
</html>
