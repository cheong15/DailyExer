<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>黑马客户关系管理系统  - 登录</title>
    <meta name="keywords" content="CRM,客户关系管理系统,黑马程序员 ">
    <meta name="description" content="CRM,客户关系管理系统,黑马程序员出品">
    <link href="${pageContext.request.contextPath}/static/login/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/login/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/login/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/login/css/style.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/login/css/login.min.css" rel="stylesheet">
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>[ CRM ]</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎使用 <strong>黑马程序员客户关系管理系统</strong></h4>
                    <ul class="m-b">
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一：专业</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二：专注</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三：专功</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四：专心</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五：专一</li>
                    </ul>
                    <strong>还没有账号？ <a href="#">立即注册&raquo;</a></strong>
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post" action="${pageContext.request.contextPath}/user_login">
                    <h4 class="no-margins">登录：</h4>
                    <p class="m-t-md">登录到客户关系管理系统后台</p>
                    <input type="text" class="form-control uname" placeholder="用户账号" name="user_code"/>
                    <input type="password" class="form-control pword m-b" placeholder="密码"  name="user_password"/>
                    <a href="#">忘记密码了？</a> <font color="red" style="float: right">${requestScope.loginFailMsg}</font>
                    <button class="btn btn-success btn-block">登录</button>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 传智播客黑马程序员  2017 All Rights Reserved.
            </div>
        </div>
    </div>
</body>
</html>
