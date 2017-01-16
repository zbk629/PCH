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
  <%--<meta name="msapplication-tap-highlight" content="no">--%>
  <title>来回拼车-推广界面</title>
  <link rel="shortcut icon" href="/resource/images/pc_logo.ico"/>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="/resource/js/style.js" type="text/javascript"></script>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
  <link href="/resource/css/auto.css" rel="stylesheet" type="text/css">
  <style type="text/css">
    body{
      background-color: #F9C86B;
      background: -webkit-linear-gradient(#F8B71D,#F8B71D, #FAD9BA);
      background: -o-linear-gradient(#F8B71D, #F8B71D,#FAD9BA);
      background: -moz-linear-gradient(#F8B71D,#F8B71D, #FAD9BA);
      background: linear-gradient(#F8B71D,#F8B71D, #FAD9BA);
      font-size: 1.6rem;
    }
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
      position: absolute;
      top: 14rem;
      width: 100%;
      text-align: center;
    }
    .login_title img{
      width: 100%;
    }
    .login_mid{
      border-left: none;
      border-right: none;
      position: relative;
      z-index: 1;
    }
    .login_input_box{
      position: relative;
      width: 90%;
      margin: 0 auto;
    }
    .login_input_box input[type=text]{
      width: 100%;
      height: 4.4rem;
      text-indent: 1.8rem;
      border:none;
      filter:chroma(color=#000000);

      /*line-height: 5rem;*/
    }
    .login_line{
      border-top: 1px solid #e8e8e8;
      width: 95%;
      float: right;
      margin-top: 1px;
    }
    .login_submit{
      text-align: center;
      margin-top: 2.4rem;
      position: relative;
    }
    .login_submit_btn{
      background-color: #FA4F47;
      border: none;
      color: #fff;
      width: 90%;
      border-radius: 1.8rem;
      height: 4.4rem;
      line-height: 4.4rem;
      border-bottom: 3px solid #DE281E;
    }
    .get_code{
      height: 4.4rem;
      width: 100%;
      text-align: center;
      border: none;
      color: #fff;
      position: relative;
      border-radius: 1.8rem;
      background-color: #FA4F47;
      border-bottom: 3px solid #DE281E;
    }
    .get_code[disable]{

    }
    .get_code_container{
      position: relative;
      display: inline-block;
      width: 47%;
    }
    .disable{
      background: #e8e8e8;
      cursor: not-allowed;
      font-size: 1.8rem;
      border-bottom: 3px solid #e8e8e8;
    }
    .user_mobile,.user_code{
      -webkit-tap-highlight-color:rgba(255,0,0,0);
      -webkit-appearance:none;
      border: 0;
      height: 4.4rem;
      font-size: 1.6rem;
      border-radius: 1.8rem;
      text-indent: 2.3rem;
      background-color: #FFF7E4;
    }
    .user_mobile{
      width: 100%;
      margin-bottom: 1rem;
    }
    /*推广界面*/
    .banner_logo{
      position: absolute;
      left: 10px;
      top: 10px;
      width: 12rem;
    }
    .banner_logo img{
      width: 100%;
    }
    #banner_img_new{
      width: 97%;
      display: block;
      margin: 0 auto;
      margin-bottom: 1rem;
    }
    .banner_word {
      font-size: 18px;
      color: #fff;
      line-height: 1.5;
    }
    .banner_word_h3{
      line-height: 4rem;
      color: #fff;
      font-size: 26px;
    }
    .share_title{
      text-align: center;
      line-height: 2.4rem;
      color: #999;
    }
    .share_footer{
      padding-bottom: 1rem;
      color: #999;
      text-align: center;
      font-size: 1.2rem;
      width: 90%;
      margin: 1rem auto 0;
    }
    .get_code_circle1{
      position: absolute;
      top: 5px;
      left: 28px;
      width: 5px;
      height: 5px;
      border-radius: 50%;
      background: #FFF7E4;
      z-index: 1;
    }
    .get_code_circle2{
      position: absolute;
      top: 11px;
      left: 20px;
      width: 3px;
      height: 3px;
      border-radius: 50%;
      background: #FFF7E4;
      z-index: 1;
    }
    .get_code_circle3{
      position: absolute;
      top: 4px;
      left: 52px;
      width: 7px;
      height: 7px;
      border-radius: 50%;
      background: #FFF7E4;
      z-index: 1;
      display: none;
    }
    .get_code_circle4{
      position: absolute;
      top: 13px;
      left: 38px;
      width: 4px;
      height: 4px;
      border-radius: 50%;
      background: #FFF7E4;
      z-index: 1;
      display: none;
    }
    .user_code{
      float: left;
    }
    .get_code_container{
      float: right;
    }
  </style>
  <link href="/resource/css/auto.css" rel="stylesheet" type="text/css">
  <script>
    $(document).ready(function () {
      changeFontSize();
//      android_get_token();
      //点击验证码时候的验证
      $('.get_code').click(function () {
        if ($('.user_mobile').val() == "") {
          showFloatStyle2("请先输入手机号");
        }else {
          sendCode();
          time(this);
        }
      });

    });

    var wait = 60;
    var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;


    var token= window.location.href.split('token=')[1];

    function android_get_token()
    {
      try
      {
//                var local_token=androidInterface.getToken();
//                token = local_token;
      }
      catch(err)
      {
        console.log(err);
      }

    }
    //发送验证码
    function sendCode(){
      var obj = {};
      obj.action = 'sms';
      obj.mobile = $('.user_mobile').val();
      obj.token = token;
      validate.validate_submit('/campaign', obj, sendMessage);
    }
    //通过ajax获取验证码
    function sendMessage() {
//      showFloatStyle2("验证码已发送");
    }
    //设置定时器
    function time(i) {
      if (wait == 0) {
        $(i).val("获取短信验证码");
        $(i).css({background: "#fff", cursor: "pointer"});
        $('.get_code').removeAttr("disabled", "true").css({'border-bottom':'3px solid #DE281E','background':'#FA4F47'});
        $('.get_code_circle1').show();
        $('.get_code_circle2').show();
        wait = 60;
      } else {
        $(i).css({background: "#e8e8e8", cursor: "not-allowed"});
        $(i).val("重新发送(" + wait + ")");
        $('.get_code').attr("disabled", "disabled").css('border-bottom','3px solid #e8e8e8');
        $('.get_code_circle1').hide();
        $('.get_code_circle2').hide();
        wait--;
        setTimeout(function () {
          time(i);
        }, 1000);
      }
    }


    function checkCode(obj){
      if($(obj).val()==""){
        $('.login_submit_btn').addClass('disable').attr("disabled", "disabled");
        $('.get_code_circle3').hide();
        $('.get_code_circle4').hide();

      }else{
        $('.login_submit_btn').removeClass('disable').removeAttr("disabled", "true");
        $('.get_code_circle3').show();
        $('.get_code_circle4').show();
      }
    }
    //最终检测
    function loginCheck(){
      if ($('.user_mobile').val() == "") {
        showFloatStyle2("请先输入手机号");
      }else if ($('.user_code').val() == "") {
        showFloatStyle2("请输入验证码");
      }else{
        sendCheckCode();
      }
    }
    //比对验证码
    function sendCheckCode(){
      var obj = {};
      obj.action = 'sms_check';
      obj.mobile = $('.user_mobile').val();
      obj.token = token;
      obj.code = $('.user_code').val();
      $.ajax({
        type: "POST",
        url: '/campaign',
        data: obj,
        dataType: "json",
        success: function (data) {
          global_data=data;
          if(global_data.status==true){
            showFloatStyle2('验证完成');
            if (navigator.userAgent.match(/(iPhone|iPod|iPad);?/i)) {
              window.location.href="https://itunes.apple.com/app/id1174366776";
            } else if (navigator.userAgent.match(/android/i)) {
              window.location.href="http://download.pinchenet.com/app/laihui.apk";
            }
          }else{
            showFloatStyle2(global_data.message);
          }
        },
        error: function () {
          console.log("交互失败");
          showFloatStyle2(global_data.message);
        }
      })
    }
    //展示浮动层，自动消失
    function showFloatStyle2(errorTips) {
      if (browser.versions.mobile) {//判断是否是移动设备打开。browser代码在下面
        alert(errorTips);
      } else {
        //否则就是PC浏览器打开
        $('.hover').fadeIn(200);
        $('.float_container').empty().append('<div class="float_box">'+
                '<span class="float_box_span"></span>'+
                '</div>').fadeIn(200);
        $('.float_box_span').text(errorTips);
        setTimeout(function () {
          $('.hover').fadeOut(200);
          $('.float_container').fadeOut(200);
        }, 1500);
      }
    }
  </script>
</head>
<body>
<div class="loading_box">
  <img class="loading" src="/resource/images/loading.gif" alt="请等待">
</div>
<div class="hover_all"></div>
<div class="hover"></div>
<div class="float_container">
  <div class="float_box">
    <span class="float_box_span"></span>
  </div>
</div>
<div class="banner_img">
  <img id="banner_img_new" src="/resource/images/pch_tuiguang.jpg">
</div>

<%--<div class="share_title">全民代理，你的第二份工作</div>--%>
<div class="login_container">

  <form method="post" id="form_login" onsubmit="return false" action="/">
    <div class="login_mid">
      <div class="login_input_box">
        <input type="tel" placeholder="请输入手机号" class="user_mobile">
      </div>
      <%--<div class="login_line"></div>--%>
      <div class="login_input_box">
        <input type="tel" placeholder="验证码" style="width: 50%" class="user_code" onkeyup="checkCode(this)">
        <span class="get_code_container">
          <i class="get_code_circle get_code_circle1"></i>
          <i class="get_code_circle get_code_circle2"></i>
          <input type="button" value="获取短信验证码" class="get_code" onselectstart="return false">
        </span>

        <div class="clear"></div>
      </div>
    </div>
    <div class="login_submit">
      <i class="get_code_circle get_code_circle3"></i>
      <i class="get_code_circle get_code_circle4"></i>
        <input type="submit" value="一键下载" class="btn login_submit_btn disable" disabled="disabled" onclick="loginCheck()">

    </div>
  </form>
</div>
<div class="share_footer">
  <span>邀请用户注册来回拼车APP，则该用户在平台上产生的每一笔交易，您都可以获得2%-5%不等的提成。前期邀请1000个有效用户，后期每月将获得万元以上收入</span>
</div>
<script>
  (function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r;
    i[r] = i[r] || function () {
              (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
    a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
    a.async = 1;
    a.src = g;
    m.parentNode.insertBefore(a, m)
  })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

  ga('create', 'UA-82806911-1', 'auto');
  ga('send', 'pageview');

</script>
</body>
</html>
