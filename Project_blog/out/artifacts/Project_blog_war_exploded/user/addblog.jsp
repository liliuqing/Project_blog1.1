<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>博客</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">

    <style>
        .line lable{
            display: inline-block;
            width: 100px;
            height: 42px;
            line-height: 42px;
            margin-right: 10px;
            text-align: right;
        }
        .line .ipt{
            height: 16px;
            padding: 11px 10px;
            width: 328px;
            border: 1px solid #ddd;
        }
        .line textarea{
            height: 100px;
            padding: 11px 10px;
            width: 328px;
            border: 1px solid #ddd;
        }
        .btn{
            background-color: #3f89ec;
            width: 350px;
            height: 50px;
            color: #ffffff;
            border: 0;
            font-size: 20px;
            cursor: pointer;
        }
    </style>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/editor/themes/default/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/editor/plugins/code/prettify.css" />
    <script charset="utf-8" src="${pageContext.request.contextPath}/editor/kindeditor-all.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/editor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/editor/plugins/code/prettify.js"></script>
</head>
<body>
<div id="div1">博客</div>
<div id="div2">
    <div id="left">
        <ul class="menu">
            <li><a href="/index.jsp">首页</a></li>
            <li><a href="/user/user_info.jsp">用户管理</a></li>
            <li><a href="/user/blog_info.jsp">博客管理</a></li>
            <li><a href="/login.jsp">退出</a></li>
        </ul>
    </div>
    <div id="right">
        <div class="content">
            <h2>新增博客</h2>
            <hr/>
            <form action="/AddBlog" method="post" >
                <p class="line">
                    <lable>标题：</lable>
                    <input class="ipt" type="text" name="title" />
                </p>
              <!--
              <p class="line">
                    <lable>配图：</lable>
                    <input class="ipt" type="file" name="file" />
                </p>
              -->


                <p class="line">
                    <lable>类型：</lable>
                    <select name="type">
                        <option>动态</option>
                        <option>Java</option>
                        <option>Python</option>
                        <option>前端</option>
                        <option>架构</option>
                        <option>数据库</option>
                    </select>
                </p>
                <p class="line">
                    <lable>内容：</lable>
                    <textarea name="content" cols="100" rows="10"
                              style="width:700px;height:300px;visibility:hidden;"></textarea>
                </p>
                <p class="line">
                    <lable>&nbsp;</lable>
                    <input class="btn" type="submit" value="发布"/>
                </p>
            </form>
        </div>
    </div>
    <div style="clear: both;"></div>
</div>
<div id="div3">博客</div>
<script>
    KindEditor.ready(function(K) {
        var editor1 = K.create('textarea[name="content"]', {
            cssPath : '${pageContext.request.contextPath}/editor/plugins/code/prettify.css',
            uploadJson : '${pageContext.request.contextPath}/upload_json.jsp',
            fileManagerJson : '${pageContext.request.contextPath}/file_manager_json.jsp',
            allowFileManager : true,
            afterCreate : function() {
                var self = this;
                K.ctrl(document, 13, function() {
                    self.sync();
                    document.forms['myForm'].submit();
                });
                K.ctrl(self.edit.doc, 13, function() {
                    self.sync();
                    document.forms['myForm'].submit();
                });
            }
        });
        prettyPrint();
    });
</script>
</body>
</html>