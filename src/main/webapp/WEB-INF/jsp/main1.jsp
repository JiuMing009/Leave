
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/3/16
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生信息</title>
    <%--引入bootstarp--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css">
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
    </style>

</head>
<body>
<div class="ta">
    <table  class="table table-bordered table-hover table-striped" >
        <thead>
            <tr class="info">
                <td width="50">选择</td>
                <td>序号</td>
                <td>ID</td>
                <td>学号</td>
                <td>姓名</td>
                <td>性别</td>
                <td>年级</td>
                <td>电话</td>
                <td>操作&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="btn btn-default btn-success btn-xs" role="button" href="addStudent" >
                        <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                        添加</a>
                </td>
            </tr>
        </thead>

        <tbody>
        <c:forEach var="s" items="${stu}" varStatus="vs">
            <tr>
                <td><input type="checkbox" name="check" value="${s.id}"></td>
                <td>${vs.count}</td>
                <td>${s.id}</td>
                <td>${s.stuId}</td>
                <td>${s.name}</td>
                <td>${s.sex}</td>
                <td>${s.grade}</td>
                <td>${s.phone}</td>
                <td>
                    <a class="btn btn-default btn-primary btn-xs" role="button" >
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        编辑</a>
                    &nbsp; &nbsp;
                    <a class="btn btn-default btn-danger btn-xs"  role="button" onclick="deleteStudent(${s.id})">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                        删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<nav aria-label="Page navigation example" class="fen">
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
                    <a class="page-link" href="${pageContext.request.contextPath}/stuAll?page=${page.pageNum-1}" aria-label="Previous" disabled="">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
        <c:forEach items="${list}" var="num">
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/stuAll?page=${num}">${num}</a></li>
        </c:forEach>
        <c:choose>
            <c:when test="${page.isLastPage}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/stuAll?page=${page.pageNum+1}" aria-label="Next" style="pointer-events: none;cursor: default;color:gray;background-color:#cbcbcb;">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/stuAll?page=${page.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>
<a class="btn btn-default btn-primary btn-xs" role="button" onclick="selectAll()" >
    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
    全选</a>

<a class="btn btn-default btn-danger btn-xs" role="button" onclick="noAll()" >
    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
    取消</a>

<a class="btn btn-default btn-danger btn-xs" role="button" onclick="deleteAll(${s.id})" >
    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
    批量</a>

<p>总共${page.pages}页，当前是${page.pageNum}页</p>

</body>
<script type="text/javascript">
   /* 单击删除*/
    function deleteStudent(id){
        if(window.confirm("你要确定删除这条记录吗？"))
        {
            document.location="deleteStu?id="+id;
        }
    }

   /* 全选*/
    function selectAll(){
        var checkBox = document.getElementsByName("check");
        for(var i = 0 ; i < checkBox.length;i++){
            checkBox[i].checked = true;
        }
    }

    /*取消全选*/
    function noAll(){
        var checkBox = document.getElementsByName("check");
        for(var i = 0 ; i < checkBox.length;i++){
            checkBox[i].checked = false;
        }
    }


   function deleteAll(id){
       if(window.confirm("你要确定删除这条记录吗？"))
       {
           document.location="moreDelete?id="+id;
       }
   }
</script>
</html>
