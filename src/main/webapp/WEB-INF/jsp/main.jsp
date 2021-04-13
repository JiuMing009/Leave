<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/3/28
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>猫玖</title>
    <link rel="stylesheet" type="text/css" href="http://unpkg.com/view-design/dist/styles/iview.css">
    <script type="text/javascript" src="http://vuejs.org/js/vue.min.js"></script>
    <script type="text/javascript" src="http://unpkg.com/view-design/dist/iview.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css">

    <style>
        .layout {
            border: 1px solid #d7dde4;
            background: #f0f5fa;
            position: relative;
            border-radius: 4px;
            overflow: hidden;
            height: 930px;
        }

        .layout-header-bar {
            background: #fff;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .1);
            height: 50px;
        }

        .layout-logo-left {
            width: 90%;
            height: 30px;
            background: #5b6270;
            border-radius: 3px;
            margin: 15px auto;
        }

        .menu-icon {
            transition: all .3s;
            line-height: 50px;
        }

        .rotate-icon {
            transform: rotate(-90deg);
        }

        .logo {
            background-color: #fff;
            height: 50px;
            box-shadow: 0 3px 3px rgba(0, 0, 0, .1);
            border-right: rgba(0, 0, 0, .1) 1px solid;
            text-align: center;
            line-height: 50px;
            font-size: 12px;
        }
        .logo h1{
            margin: 0;
            line-height: 50px;
        }

        .menu-item {
            height: 928px;
        }

        .menu-item span{
            display: inline-block;
            overflow: hidden;
            width: 69px;
            text-overflow: ellipsis;
            white-space: nowrap;
            vertical-align: bottom;
            transition: width .2s ease .2s;
        }
        .menu-item i{
            transform: translateX(0px);
            transition: font-size .2s ease, transform .2s ease;
            vertical-align: middle;
            font-size: 16px;
        }
        .collapsed-menu span{
            width: 0px;
            transition: width .2s ease;
        }
        .collapsed-menu i{
            transform: translateX(5px);
            transition: font-size .2s ease .2s, transform .2s ease .2s;
            vertical-align: middle;
            font-size: 22px;
        }
        Content {
            margin: 10px;
            height: 860px;
            position: relative;
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
            top: 460px;
            right: 200px;
        }
        p{
            text-align: center;
        }
    </style>


</head>


<body>
<div id="app">
    <div class="layout">
        <Layout>
            <Sider ref="side1" hide-trigger collapsible :collapsed-width="78" v-model="isCollapsed">
                <i-menu active-name="1-1" theme="dark" width="auto" :class="menuitemClasses">
                    <div class="logo">
                        <h1>ZY</h1>
                    </div>
                    <Menu-Item name="1-1">
                        <Icon type="ios-navigate"></Icon>
                        <span>首  页</span>
                    </Menu-Item>
                    <Menu-Item name="1-2">
                        <Icon type="ios-search"></Icon>
                        <span>发  现</span>
                    </Menu-Item>
                    <Menu-Item name="1-3">
                        <Icon type="ios-settings"></Icon>
                        <span>设  置</span>
                    </Menu-Item>
                </i-menu>
            </Sider>
            <Layout>
                <Header :style="{padding: 0}" class="layout-header-bar">
                    <Icon @click.native="collapsedSider" :class="rotateIcon" :style="{margin: '0 20px'}" type="md-menu" size="24"></Icon>
                </Header>
                <Content :style="{background: '#fff', minHeight: '400px'}">
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

                </Content>
            </Layout>
        </Layout>
    </div>
</div>

<script>
    var vue = new Vue({
        el: '#app',
        data() {
            return {
                isCollapsed: false
            }
        },
        computed: {
            rotateIcon() {
                return [
                    'menu-icon',
                    this.isCollapsed ? 'rotate-icon' : ''
                ];
            },
            menuitemClasses() {
                return [
                    'menu-item',
                    this.isCollapsed ? 'collapsed-menu' : ''
                ]
            }
        },
        methods: {
            collapsedSider() {
                this.$refs.side1.toggleCollapse();
            }
        }
    })

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

    /* 单击删除*/
    function deleteAll(id){
        if(window.confirm("你要确定删除这条记录吗？"))
        {
            document.location="moreDelete?id="+id;
        }
    }
</script>

</body>

</html>