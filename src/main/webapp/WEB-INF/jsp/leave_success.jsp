
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/3/29
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>成功</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" >
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>

    <style>
        body{
            position: relative;
            margin: 0;
            padding: 0;
            width: 100%;
        }
        .ta{
            width: 100%;
            height: 443px;
        }
        .table{
            margin-top: 30px;
            width: 98%;
            margin-right: 20px;
            margin-left: 20px;
            text-align: center;
        }
        .fen{
            position: absolute;
            top: 430px;
            right: 110px;
        }
        p{
            text-align: center;
        }
        h1{
            text-align: center;
        }
        h2{
            margin: 200px auto;
            text-align: center;
            font-size: 20px;
        }

        .head{
            background:#5b6270;
            color: #ffffff;
        }
        .modal-content{
            margin: 110px auto;
            position: relative;

        }
        #que{
            position: absolute;
            top: 452px;
           right:100px;
        }
        label.col-sm-4::before{
            content: '* ';
            color: red;
        }
        .modal-title{
            text-align: center;
        }

    </style>
</head>
<body>

<%--弹出输入框开始--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="exampleModalLabel"></h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/stuLeave/addLeave" method="post" class="form-horizontal" name="myform" >
                    <div class="form-group">
                        <label class="col-sm-4 control-label">学号:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"   name="stuId" value="<%=session.getAttribute("stuId") %>">
                        </div>
                    </div>
                    <p></p>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">姓名:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  name="name" value="<%=session.getAttribute("name") %>">
                        </div>
                    </div>
                    <p></p>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">电话:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  name="phone" value="<%=session.getAttribute("phone") %>">
                        </div>
                    </div>
                    <p></p>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">去向:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  name="address">
                        </div>
                    </div>
                    <p></p>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">原因:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  name="cause">
                        </div>
                    </div>
                    <p></p>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">时间:</label>
                        <div class="col-sm-6">
                            <jsp:useBean id="now" class="java.util.Date"/>
                            <fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" var="curr"/>
                            <input type="text" class="form-control"  name="leavetime" value="${curr}">
                        </div>
                    </div>
                    <p></p>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">教师工号:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  name="teaId">
                        </div>
                    </div>
                    <p></p>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">教师姓名:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  name="tname">
                        </div>
                    </div>
                    <p></p>

                    <div class="form-group">
                        <div class="col-sm-2" id="que">
                            <button type="button" class="btn btn-primary" onclick="q(this.form)" >确定</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<%--弹出输入框结束--%>
<%--表格开始--%>
<div class="ta">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="btn" style="margin-top: 10px;margin-left: 10px">请&nbsp;假</button>
    <table class="table table-bordered table-striped" id="table">
        <thead>
        <tr class="head">
            <td>序号</td>
            <td>学号</td>
            <td>姓名</td>
            <td>电话</td>
            <td>去向</td>
            <td>原因</td>
            <td>时间</td>
            <td>工号</td>
            <td>教师</td>
            <td >操作
            </td>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="s" items="${stuIds}" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${s.stuId}</td>
                <td>${s.name}</td>
                <td>${s.phone}</td>
                <td>${s.address}</td>
                <td>${s.cause}</td>
                <td><fmt:formatDate value="${s.leavetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${s.teaId}</td>
                <td>${s.tname}</td>
                <td >
                    <a class="btn btn-default btn-success btn-xs" role="button" onclick="remind()">
                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                        提醒</a>
                    &nbsp;
                    <a class="btn btn-default btn-danger btn-xs"  role="button" onclick="cancel(${s.id})">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        撤销</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h2 id="h2">暂无数据</h2>
</div>

<%--分页开始--%>
<nav aria-label="Page navigation example" class="fen" id="pg">
    <ul class="pagination">
        <c:choose>
            <c:when test="${page.isFirstPage}">
                <li class="page-item">
                    <a class="page-link" href="" aria-label="Previous" style="pointer-events: none;cursor: default;color:gray;background-color:#cbcbcb;">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/stuLeave/selectStuId?page=${page.pageNum-1}" aria-label="Previous" disabled="">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
        <c:forEach items="${list2}" var="num">
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/stuLeave/selectStuId?page=${num}">${num}</a></li>
        </c:forEach>
        <c:choose>
            <c:when test="${page.isLastPage}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/stuLeave/selectStuId?page=${page.pageNum+1}" aria-label="Next" style="pointer-events: none;cursor: default;color:gray;background-color:#cbcbcb;">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/stuLeave/selectStuId?page=${page.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>
<%--分页结束--%>
</body>
<script>
    function remind(){
        alert("已经提醒老师啦！");

    }
    function cancel(id){
        if(window.confirm("你要确定撤销该审批吗？"))
        {
            document.location="Cancel?id="+id;
        }
    }

    /*当表格没有数据时，显示暂无数据*/
    var a = <%=session.getAttribute("list")%>;
    var table = document.getElementById("table");
    var h2 = document.getElementById("h2");
    var pg = document.getElementById("pg");
    if(a > 0) {
        table.hidden=false;
        pg.hidden=false;
        h2.hidden=true;

    }
    else{
        table.hidden=true;
        pg.hidden=true;
        h2.hidden=false;
    }

    $('#exampleModal').on('show.bs.modal', function (event) {
        var modal = $(this);
        modal.find('.modal-title').text("请假条");
    })

    /*输入为空提示*/
    function q(form) {
        if(form.stuId.value == ''){
            alert("请输入学号");
            form.stuId.focus();
            return false;
        }
        if(form.name.value == ''){
            alert("请输入姓名");
            form.name.focus();
            return false;
        }
        if(form.phone.value == ''){
            alert("请输入电话");
            form.phone.focus();
            return false;
        }
        if(form.address.value == ''){
            alert("请输入去向");
            form.address.focus();
            return false;
        }
        if(form.cause.value == ''){
            alert("请输入原因");
            form.cause.focus();
            return false;
        }
        if(form.leavetime.value == ''){
            alert("请输入时间");
            form.leavetime.focus();
            return false;
        }
        if(form.teaId.value == ''){
            alert("请输入教师工号");
            form.teaId.focus();
            return false;
        }
        if(form.tname.value == ''){
            alert("请输入教师姓名");
            form.tname.focus();
            return false;
        }
        document.myform.submit();

    }
</script>
</html>
