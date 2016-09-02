<%--
  Created by IntelliJ IDEA.
  User: zhu
  Date: 2016/7/25
  Time: 15:06
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
  <title>来回拼车-拼车信息汇</title>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="/resource/js/style.js" type="text/javascript"></script>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
  <script src="/resource/js/LCalendar.js" type="text/javascript"></script>
  <link href="/resource/css/LCalendar.css" rel="stylesheet" type="text/css">
  <style type="text/css">




    .footer{
      margin-bottom: 6rem;
    }
    .footer img{
      width: 100%;
      margin-top: 5rem;

    }
    .departure_container_top {
      width: 100%;
      height: 4.2rem;
      background-color: #fff;
      position: relative;
      border-bottom: 1px solid #f5ad4e;
    }

    .departure_top_box {
      padding-top: .36rem;
      text-align: left;
      color: #f5ad4e;
      text-indent: .6rem;
    }
    .departure_top_box_img{
      width: 10.6rem;
      position: relative;
      top: .4rem;
    }
    .departure_top_box_span{
      line-height: 2rem;
      font-size: 1.6rem;
    }
    @media screen and (max-width: 2000px) {
      body{
        max-width: 1080px;
        transform: translateZ(0);
        -webkit-transform: translateZ(0);
      }

    }
    @media screen and (max-width: 1080px) {
      body{
        max-width: 1080px;
        transform: none;
        -webkit-transform: none;
      }

    }
  </style>
  <link href="/resource/css/auto.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="hover"></div>
<div class="hover_all"></div>
<div class="loading_box">
  <img class="loading" src="/resource/images/loading.gif" alt="请等待">
</div>
<div class="departure_container_top">
  <div class="departure_top_box">
    <%--<span class="departure_top_find_car departure_top_button_active">找车</span>--%>
    <%--<span class="departure_top_find_person">找人</span>--%>
      <a href="/laihui/car/list">
        <img src="/resource/images/pch_share_logo.png" class="departure_top_box_img" alt="来回拼车" >
      </a>
    <%--<span class="departure_top_box_span">来回拼车</span>--%>
  </div>
</div>
<img src="/resource/images/pch_logo.png" style="display: none">
  <a href="/laihui/car/list" class="call_driver">
    <div class="publish_bottom">
      返回主页
    </div>
  </a>
  <div class="footer">
    <img src="/resource/images/pch_icon_bottom.png">
  </div>
</div>
<div class="clear"></div>
</body>
</html>
