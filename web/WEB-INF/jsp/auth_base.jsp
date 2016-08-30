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
  <title>来回拼车-我的信息-微信</title>
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
      height: 4rem;
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
      font-size: 1.8rem;
    }
    .layout{
      display: inline-block;
      color: #fff;
      top: 1rem;
      right: .8rem;
      padding: 1rem;
      position: absolute;
      width: 3rem;
      cursor: pointer;
    }
    .message_mid{
      background-color: #fff;
    }
    .message_mid_li{
      line-height: 4.2rem;
      height: 4.2rem;
      padding-left: 2.2rem;
      border-bottom: 1px solid #e8e8e8;
      cursor: pointer;
    }
    .right_icon{
      float: right;
      margin-right: 1rem;
      color: #999;
      font-size: 2rem;
    }
    .last_li{
      border-bottom: none;
    }
    .type_container_ul{
      line-height: 7rem;
      text-align: center;
      color: #fff;
      width: 96%;
      margin: 1rem auto;
    }
    .type_container_ul_li{
      width: 48%;
      border-radius: 5px;
      cursor: pointer;
    }
    .type_container_left{
      float: left;
      background-color: #3498db;
      /*background: url("/resource/images/pch_icon_publich_bg1.png") no-repeat;*/
      /*background-size: 100%;*/
    }
    .type_container_left:hover{
      background-color: #2980b9;
      box-shadow: 2px 2px 10px 2px #C5C5C5;
    }
    .type_container_right{
      float: right;
      background-color: #2ecc71;
      /*background: url("/resource/images/pch_icon_publish_bg2.png") no-repeat;*/
      /*background-size: 100%;*/
    }
    .type_container_right:hover{
      background-color: #27ae60;
      box-shadow: 2px 2px 10px 2px #C5C5C5;
    }
    .message_bottom{
      position: fixed;
      bottom: 0;
      width: 100%;
      background-color: #fff;
      height: 4.2rem;
      border-top:1px solid #e8e8e8;
    }
    .message_bottom_type{
      width: 33.3%;
      float: left;
      text-align: center;
      line-height: 6.4rem;
      color: #888;
      position: relative;
      cursor: pointer;
    }
    .icon_style{
      width: 100%;
    }
    .img_box{
      width: 2rem;
      height: 2rem;
      position: absolute;
      top: -1.2rem;
      left: 0;
      right: 0;
      margin: 0 auto;
    }
    .menu_active{
      color: #F5AD4E;
    }
    .type_container_ico{
      font-size: 1.8rem;
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
  <script>
    $(document).ready(function () {
      changeFontSize();
      loadMessage();

    });
    var user_id=86;
    function loadMessage(){
      var obj = {};
      obj.action = 'base';
      obj.user_id = user_id;
      validate.validate_submit('/api/user/info', obj, insertMessage);
    }
    //添加信息
    function insertMessage(){
      var user_name = global_data.result.user_name;
      var user_avatar = global_data.result.user_avatar;
      $('.user_name').text(user_name);
      $('.message_header img').attr('src',user_avatar);
    }
    //解绑
    function layout(){
      var obj = {};
      obj.action = 'un_binding';
      obj.user_id = user_id;
      validate.validate_submit('/api/user/info', obj, success);
    }
    //
    function success(){
        showFloatStyle("成功解绑");
        window.location.href='/reg';
    }
    //跳转
    function toPublish(){
      window.location.href="/laihui/driver/create_order"
    }
    function toList(){
      window.location.href="/laihui/car/list"
    }
    function toMine(){
      window.location.href="/auth/base"
    }

    function notOpend(){
//      window.location.href="/laihui/driver/create_order"
      showFloatStyle("即将开通，敬请期待");
    }
    function toMyList(){
      window.location.href="/laihui/passenger/order_list"
    }
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
      <img src="/" alt="header">
      <span class="user_name"></span>
    </div>
    <span class="layout" onclick="layout()">解绑</span>
  </div>
  <div class="type_container">
    <ul class="type_container_ul">
      <li class="type_container_ul_li type_container_left" onclick="toPublish()">
        <span class="type_container_ico">+</span>
        <span>发布发车信息</span>
      </li>
      <li class="type_container_ul_li type_container_right" onclick="notOpend()">
        <span class="type_container_ico">+</span>
        <span>发布出行信息</span>
      </li>
      <div class="clear"></div>
    </ul>
  </div>
  <div class="message_mid">
    <ul class="message_mid_ul">
      <li class="message_mid_li" onclick="toMyList()">
        <span>我的发车信息</span>
        <div class="right_icon">></div>
      </li>
      <li class="message_mid_li last_li">
        <span>我的订座信息</span>
        <div class="right_icon">></div>
      </li>
    </ul>
  </div>
</div>
<div class="message_bottom">
  <div class="message_bottom_type" onclick="toList()">
    <div class="img_box">
      <img src="/resource/images/pch_icon_menu_car.png" class="icon_style icon_car">
    </div>
    <span>找车</span>
  </div>
  <div class="message_bottom_type" onclick="notOpend()">
    <div class="img_box">
      <img src="/resource/images/pch_icon_menu_people.png" class="icon_style icon_people">
    </div>
    <span>找人</span>
  </div>
  <div class="message_bottom_type menu_active" onclick="toMine()">
    <div class="img_box">
      <img src="/resource/images/pch_icon_menu_me_active.png" class="icon_style icon_mine">
    </div>
    <span>我的</span>
  </div>
</div>
</body>
</html>
