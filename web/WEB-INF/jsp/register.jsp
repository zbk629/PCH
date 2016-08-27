<%--
  Created by IntelliJ IDEA.
  User: zhu
  Date: 2016/8/15
  Time: 15:06
  des：来回拼车注册界面
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>来回拼车-登陆界面</title>
    <link rel="shortcut icon" href="/resource/images/pc_logo.ico"/>
    <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="/resource/js/style.js" type="text/javascript"></script>
    <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .login_container{
            height: 100%;
            width: 100%;
            overflow: hidden;
        }
        input:focus{
            border:none;
            outline: none;
        }
        .login_title{
            width: 12rem;
            margin: 6rem auto 2rem;
        }
        .login_title img{
            width: 100%;
        }
        .login_mid{
            background-color: #fff;
            border: 1px solid #e8e8e8;
            border-left: none;
            border-right: none
        }
        .login_input_box{
            position: relative;
        }
        .login_input_box input[type=text]{
            width: 100%;
            line-height: 4rem;
            height: 4rem;
            text-indent: 1.8rem;
            border:none;
        }
        .login_line{
            border-top: 1px solid #e8e8e8;
            width: 95%;
            float: right;
        }
        .login_submit{
            text-align: center;
            margin-top: 4rem;
        }
        .login_submit_btn{
            background-color: #F5ad4e;
            border: none;
            color: #fff;
            width: 90%;
            border-radius: 5px;
            height: 4rem;
            line-height: 4rem;
        }
    </style>
    <link href="/resource/css/auto.css" rel="stylesheet" type="text/css">
    <script>
        $(document).ready(function () {
            changeFontSize();

        });

    </script>
</head>
<body>
<div class="login_container">
    <div class="login_title">
        <img src="/resource/images/pch_logo.png">
    </div>
    <form method="post" id="form_login" onsubmit="return false" action="/">
        <div class="login_mid">
            <div class="login_input_box">
                <input type="text" placeholder="请输入手机号">
            </div>
            <div class="login_line"></div>
            <div class="login_input_box">
                <input type="text" placeholder="验证码" style="width: 60%">
                <input type="button" value="获取验证码">
            </div>
        </div>
        <div class="login_submit">
            <input type="submit" value="登陆" class="btn login_submit_btn" onclick="loginCheck()">
        </div>
    </form>
    <div class="login_other">
        <div class="login_other_tips">
            <div class="login_line"></div>
            <span>其他社交网站登陆</span>
        </div>
    </div>
</div>
</body>
</html>
