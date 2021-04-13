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
    <title>请假系统</title>
    <link rel="stylesheet" type="text/css" href="http://unpkg.com/view-design/dist/styles/iview.css">
    <script type="text/javascript" src="http://vuejs.org/js/vue.min.js"></script>
    <script type="text/javascript" src="http://unpkg.com/view-design/dist/iview.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" >

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
            position: relative;
        }
        .xx{
            position: absolute;
            height: 49px;
            top:0px;
            right: 100px;
        }
        .xx h2{
            line-height: 14px;
            font-size: 16px;
        }
        #zhuxiao{
            position: absolute;
            top: 15px;
            right: 35px;
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
            font-size: 20px;
        }

        .menu-item {
            height: 928px;
        }

        .menu-item span{
            display: inline-block;
            overflow: hidden;
            /*width: 69px;*/
            text-overflow: ellipsis;
            white-space: nowrap;
            vertical-align: bottom;
            transition: width .2s ease .2s;
        }

        .menu-item i {
            transform: translateX(0px);
            transition: font-size .2s ease, transform .2s ease;
            vertical-align: middle;
            font-size: 16px;
        }

        .collapsed-menu span{
            width: 0px;
            transition: width .2s ease;
        }

        .collapsed-menu i {
            transform: translateX(5px);
            transition: font-size .2s ease .2s, transform .2s ease .2s;
            vertical-align: middle;
            font-size: 22px;
        }

        Content {
            margin: 10px;
            height: 860px;
        }

        iframe {
            height: 860px;
            width: 100%;
        }
    </style>


</head>


<body>
<div id="app">
    <div class="layout">
        <Layout>
            <Sider class="s1" ref="side1" hide-trigger collapsible :collapsed-width="78" v-model="isCollapsed">
                <i-menu active-name="1-1" theme="dark" width="auto" :class="menuitemClasses">
                    <div class="logo">
                        <Icon type="md-list-box"></Icon>
                        <span style="font-size: 25px">我是学生</span>
                    </div>
                    <Menu-Item name="1-1" id="m1" onclick="m1()">
                        <Icon type="md-send" ></Icon>
                        <span>我的请假</span>
                    </Menu-Item>
                    <Menu-Item name="1-2" id="m2" onclick="m2()">
                        <Icon type="md-checkmark-circle" ></Icon>
                        <span>已同意的</span>

                    </Menu-Item>
                    <Menu-Item name="1-3" id="m3" onclick="m3()">
                        <Icon type="md-close-circle" ></Icon>
                        <span>已拒绝的</span>
                    </Menu-Item>
                </i-menu>
            </Sider>
            <Layout>
                <Header :style="{padding: 0}" class="layout-header-bar">
                    <Icon @click.native="collapsedSider" :class="rotateIcon" :style="{margin: '0 20px'}" type="md-menu" size="24"></Icon>
                    <div class="xx">
                       <h2>您好！<%=session.getAttribute("name") %></h2>
                    </div>
                    <a id="zhuxiao" class="btn btn-default btn-xs" href="${pageContext.request.contextPath}/student/logout">注销</a>
                </Header>
                <Content :style="{background: '#fff', minHeight: '400px'}">
                    <iframe id="show" name="show" src="${pageContext.request.contextPath}/stuLeave/selectStuId" frameborder="0" frameborder="no" scrolling="no"></iframe>

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
    var sh = document.getElementById("show");
    function m1() {
       sh.src="${pageContext.request.contextPath}/stuLeave/selectStuId";
    }
    function m2() {
        sh.src="${pageContext.request.contextPath}/stuLeave/AgreeStuId";
    }
    function m3() {
        sh.src="${pageContext.request.contextPath}/stuLeave/DisagreeStuId";
    }

</script>

</body>

</html>