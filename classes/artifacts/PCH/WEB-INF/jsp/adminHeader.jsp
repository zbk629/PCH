<%--
  Created by IntelliJ IDEA.
  User: super
  Date: 2016/8/1
  Time: 14:06
  describtion:网页头部信息
  To change this template use File | Settings | File Templates.
--%>
<%--<jsp:include flush="true" page="adminHeader.jsp"></jsp:include>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <title>来回拼车后台管理页面</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="/resource/images/pc_logo.ico"/>
  <script src="http://cdn.staticfile.org/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
  <script src="/resource/js/manage.js" type="text/javascript"></script>
  <link rel="stylesheet" href="/resource/css/bootstrap.min.css" >
  <link href="/resource/css/manage_css.css" rel="stylesheet">

  <style type="text/css">
    /*加载动画*/
    .loading_animation {
      margin: 100px auto 0;
      width: 150px;
      text-align: center;
    }

    .loading_animation > div {
      width: 30px;
      height: 30px;
      background-color: #f5ad4e;
      border-radius: 100%;
      display: inline-block;
      -webkit-animation: bouncedelay 1.4s infinite ease-in-out;
      animation: bouncedelay 1.4s infinite ease-in-out;
      /* Prevent first frame from flickering when animation starts */
      -webkit-animation-fill-mode: both;
      animation-fill-mode: both;
    }
    .loading_animation .bounce1 {
      -webkit-animation-delay: -0.32s;
      animation-delay: -0.32s;
    }

    .loading_animation .bounce2 {
      -webkit-animation-delay: -0.16s;
      animation-delay: -0.16s;
    }

    @-webkit-keyframes bouncedelay {
      0%, 80%, 100% { -webkit-transform: scale(0.0) }
      40% { -webkit-transform: scale(1.0) }
    }

    @keyframes bouncedelay {
      0%, 80%, 100% {
        transform: scale(0.0);
        -webkit-transform: scale(0.0);
      } 40% {
          transform: scale(1.0);
          -webkit-transform: scale(1.0);
        }
    }
    .logo_title{
      margin: 14% auto 0;
      text-align: center;
      font-size: 75px;
      width: 200px;
      color: #D8D8D8;
    }
    .logo_title_div1{
      float: left;
    }
    .logo_title_div2{
      float: right;
    }
    .fixed_menu{
      position: fixed;
      top: 48%;
      /* left: 10px; */
      background-color: #000;
      opacity: 0.5;
      border-radius: 0px 10px 10px 0px;
      padding: 5px;
      z-index: 100;
      display: none;
    }
    .fixed_menu img{
      width: 50px;
    }

  </style>
  <link href="/resource/css/manage_auto.css" rel="stylesheet">
  <script src="/resource/js/loadingTop.js" type="text/javascript"></script>
  <script>
    $(document).ready(function(){
      NProgress.start();
      NProgress.done();
      $('.error_message_tip_yes').click(function(){
        $(this).parent().hide();
      })
    });

    $('.error_message_tip_yes').click(function(){
      $(this).parent().hide();
    });

    var menu=0;
    //加载图片设置
    function lazyImg(){
      $(".lazy").lazyload({
        effect : "fadeIn"
      });
    }
    function showMenu(obj){
      if ($(obj).hasClass('menu_style_active')) {
        $(obj).removeClass('menu_style_active');
        $(obj).children('img').attr('src','/resource/images/pch_icon_menu_style.png');
        $('.ui_left').animate({'left':'-300px'},300);
        $(obj).animate({'left':'0px'},300);

      } else {
        $(obj).addClass('menu_style_active');
        $(obj).children('img').attr('src','/resource/images/pc_icon_white_return.png');

        $('.ui_left').animate({'left':'0px'},300);
        $(obj).animate({'left':'209px'},300);

      }

    }
  </script>
  <script src="/resource/js/jquery.pjax.js" type="text/javascript"></script>
<body>

<div class="header">
  <div class="header_container">
    <a href="/">
      <div class="header_logo">
        <img src="/resource/images/pc_logo.png" alt="来回拼车">
      </div>
      <div class="header_name">
        <span>来回拼车</span>
      </div>
    </a>
    <div class="header_right">
      <div class="header_user">
        <img src="/resource/images/icon_people.png" alt=""/>
        <span>管理员</span>
      </div>
      <div class="header_exit">
        <a href="/db/logout">退出</a>
      </div>
      <div class="clear"></div>
    </div>
    <div class="clear"></div>
  </div>
</div>

<div class="error_message_tip">
  <span class="error_message">服务器异常</span>
  <span class="error_message_tip_yes">确认</span>
</div>

  <span class="error_animate_tips">error_tips</span>

<div class="loading_animation">
  <div class="bounce1"></div>
  <div class="bounce2"></div>
  <div class="bounce3"></div>
</div>
<div class="logo_title">
  <div class="logo_title_div1">来</div>
  <div class="logo_title_div2">回</div>
  <div class="clear"></div>
</div>

<div class="fixed_menu" onclick="showMenu(this)">
  <img src="/resource/images/pch_icon_menu_style.png">
</div>
