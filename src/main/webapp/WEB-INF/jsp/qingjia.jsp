<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/3/29
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请假页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" >
    <style>
        .form-horizontal{
            margin: 100px auto;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/stuLeave/addLeave" method="post" class="form-horizontal" >
    <div class="form-group">
        <label class="col-sm-2 control-label">学号:</label>
        <div class="col-sm-2">
            <input type="text" class="form-control"   name="stuId" value="<%=session.getAttribute("stuId") %>">
        </div>
        <label class="col-sm-2 control-label">姓名:</label>
        <div class="col-sm-2">
            <input type="text" class="form-control"  name="name">
        </div>
    </div>
    <p></p><br>
    <div class="form-group">
        <label class="col-sm-2 control-label">电话:</label>
        <div class="col-sm-2">
            <input type="text" class="form-control"  name="phone">
        </div>

        <label class="col-sm-2 control-label">去向:</label>
        <div class="col-sm-2">
            <input type="text" class="form-control"  name="address">
        </div>
    </div>
    <p></p><br>
    <div class="form-group">
        <label class="col-sm-2 control-label">原因:</label>
        <div class="col-sm-2">
            <input type="text" class="form-control"  name="cause">
        </div>

        <label class="col-sm-2 control-label">时间:</label>
        <div class="col-sm-2">
            <input type="text" class="form-control"  name="leavetime">
        </div>
    </div>
    <p></p><br>
    <div class="form-group">
        <label class="col-sm-2 control-label">教师工号:</label>
        <div class="col-sm-2">
            <input type="text" class="form-control"  name="teaId">
        </div>

        <label class="col-sm-2 control-label">教师姓名:</label>
        <div class="col-sm-2">
            <input type="text" class="form-control"  name="tname">
        </div>
    </div>
    <p></p><br>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10 ">
            <input type="submit" class="btn btn-primary" value="请假">
        </div>
    </div>
</form>

</body>
</html>
