
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/3/29
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>请假表</title>
  <%--  注意${pageContext.request.contextPath}--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" >
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
            background: #5b6270;
            color: #ffffff;
        }
    </style>

</head>
<body>
<div class="ta">
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
        <td >操作</td>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="s" items="${teaIds}" varStatus="vs">
        <tr>
            <td id="tab">${vs.count}</td>
            <td>${s.stuId}</td>
            <td>${s.name}</td>
            <td>${s.phone}</td>
            <td>${s.address}</td>
            <td>${s.cause}</td>
            <td><fmt:formatDate value="${s.leavetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${s.teaId}</td>
            <td>${s.tname}</td>
            <td >
                <a class="btn btn-default btn-success btn-xs" role="button" onclick="agree(${s.id})">
                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    同意</a>
                &nbsp;
                <a class="btn btn-default btn-danger btn-xs"  role="button" onclick="disagree(${s.id})" >
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    不同意</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<h2 id="h2">暂无数据</h2>
</div>
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
                    <a class="page-link" href="${pageContext.request.contextPath}/stuLeave/selectTeaId?page=${page.pageNum-1}" aria-label="Previous" disabled="">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
        <c:forEach items="${list2}" var="num">
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/stuLeave/selectTeaId?page=${num}">${num}</a></li>
        </c:forEach>
        <c:choose>
            <c:when test="${page.isLastPage}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/stuLeave/selectTeaId?page=${page.pageNum+1}" aria-label="Next" style="pointer-events: none;cursor: default;color:gray;background-color:#cbcbcb;">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/stuLeave/selectTeaId?page=${page.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>
</body>
<script>
    function agree(id){
        if(window.confirm("你确定同意该审批吗？"))
        {
            document.location="Agree?id="+id;
        }
    }
    function disagree(id){
        if(window.confirm("你确定不同意该审批吗？"))
        {
            document.location="Disagree?id="+id;
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
</script>
</html>
