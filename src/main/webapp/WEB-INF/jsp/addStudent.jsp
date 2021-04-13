<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/3/25
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/addStu" method="post">
    学号<input type="text" name="stuId" ><br>
    姓名<input type="text" name="name" ><br>
    性别<input type="radio" name="sex" checked="checked" value="男">男
        <input type="radio" name="sex" value="女">女<br>
    年级<input type="text" name="grade" ><br>
    电话<input type="text" name="phone" ><br>
    <input type="submit" value="确定">

</form>

</body>
</html>
