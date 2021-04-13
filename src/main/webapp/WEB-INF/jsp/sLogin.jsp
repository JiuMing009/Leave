<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/3/29
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" >
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <style>
        body {
            background-image:url("/img/bpic.588ku.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }


        #login-box {
            background-color: rgba(255, 255, 255, 0.9);
            text-align: center;
            margin: 200px auto 0;
            width: 350px;
            height: 400px;
            border-radius: 15px;
        }

        #login-box h1 {
            padding-top: 60px;
            color: #000;
        }

        #login-box .input-box {
            margin-top: 15px;
        }

        #login-box .input-box input {
            border: none;
            background: none;
            border: #000 1px solid;
            border-radius: 12px;
            padding: 5px 10px;
            outline: none;
            color: #000;
        }

        #login-box .login input {
            margin-top: 20px;
            width: 190px;
            height: 30px;
            border-radius: 13px;
            outline: none;
            border: none;
            color: #fff;
            background-image: linear-gradient(120deg, #a6c0fe 0%, #f68084 100%);
        }
        .btn{
            margin-top: 20px;
            width: 190px;
            height: 30px;
            border-radius: 13px;
            outline: none;
            border: none;
            color: #fff;
            line-height: 30px;
            background-image: linear-gradient(120deg, #a6c0fe 0%, #f68084 100%);
        }
    </style>
</head>
<body>
<form id="login-box" method="post" action="${pageContext.request.contextPath}/student/loginCheck">
    <h1>Login</h1>

    <div class="input-box">
        <input type="text" placeholder="学号" name="stuId" id="stuId"><span id="s1"></span>
    </div>
    <div class="input-box">
        <input type="password" placeholder="密码" name="password" id="password"><span id="s2"></span>
    </div>

    <div class="login">
        <input type="submit" value="登录" onclick="login()">
    </div>

    <a class="btn btn-xs" role="button" href="/teacher/loginCheck" >我是老师</a>

</form>

</body>
<script>
    function login(){
        var stuId = ($("#stuId").val());
        var password =($("#password").val());
        if (stuId == ""){
            alert("请输入学号");
            return false;
        }
        else if(password == ""){
            alert("请输入密码");
            return false;
        }
        var data = {stuId:stuId,password:password};
        $.ajax({
            type:"POST",
            url:"/student/loginCheck",
            data:data,
            dataType:"json",
            success:function (data){
                if (data != null){
                    window.location.href="${pageContext.request.contextPath}/student/loginCheck";
                }
                else{
                    alert("学号或密码错误！");
                }
            }
        })
    }


</script>
</html>
