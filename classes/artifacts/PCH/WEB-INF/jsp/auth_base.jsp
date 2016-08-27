<%--
  Created by IntelliJ IDEA.
  User: zhu
  Date: 2016/8/15
  Time: 15:06
  des：来回拼车个人信息
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
  <link href="/resource/css/auto.css" rel="stylesheet" type="text/css">
  <style type="text/css">
    html{
      height: 100%;
    }
    input:focus{
      border:none;
      outline: none;
    }
    .message_top{
      height: 9rem;
      position: relative;
      background-color: #f5ad4e;
    }
    .message_header{
      width: 80%;
      float: left;
      padding-top: 3rem;
      padding-left: 2rem;
      height: 4rem;
    }
    .message_header img{
      width: 4rem;
      border-radius: 50%;
      /* display: inline-block; */
      float: left;
      border: 2px solid #fff;
    }
    .user_name{
      display: block;
      line-height: 4rem;
      float: left;
      color: #fff;
      margin-left: 1rem;
    }
    .layout{
      display: inline-block;
      color: #555;
      margin-top: 1rem;
      padding: 1rem;
    }
    .message_mid{
      background-color: #fff;
    }
    .message_mid_li{
      line-height: 3.4rem;
      height: 3.4rem;
      padding-left: 2.2rem;
    }
    .right_icon{
      float: right;
      margin-right: 1rem;
      color: #999;
      font-size: 2rem;
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
<div class="hover"></div>
<div class="float_container">
  <div class="float_box">
    <span class="float_box_span"></span>
  </div>
</div>
<div class="message_container">
  <div class="message_top">
    <div class="message_header">
      <img src="/resource/images/super.jpg">
      <span class="user_name">super超</span>
    </div>
    <span class="layout">解绑</span>
  </div>
  <div class="message_mid">
    <ul class="message_mid_ul">
      <li class="message_mid_li">
        <span>我的发车信息</span>
        <div class="right_icon">></div>
      </li>
      <li class="message_mid_li">
        <span>我的订座信息</span>
        <div class="right_icon">></div>
      </li>
    </ul>
  </div>
  <%--<div class="message_bottom">--%>
    <%----%>
  <%--</div>--%>
</div>
</body>
</html>
