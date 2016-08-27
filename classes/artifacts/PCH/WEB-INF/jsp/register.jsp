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
    <title>来回拼车-登陆界面</title>
    <link rel="shortcut icon" href="/resource/images/pc_logo.ico"/>
    <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="/resource/js/style.js" type="text/javascript"></script>
    <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
    <link href="/resource/css/auto.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        body{
            background-color: #fff;
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
            width: 12rem;
            margin: 5rem auto 2rem;
        }
        .login_title img{
            width: 100%;
        }
        .login_mid{
            background-color: #fff;
            border: 1px solid #e8e8e8;
            border-left: none;
            border-right: none;
            position: relative;
            z-index: 1;
        }
        .login_input_box{
            position: relative;
        }
        .login_input_box input[type=text]{
            width: 100%;
            height: 5rem;
            text-indent: 1.8rem;
            border:none;
            line-height: 5rem;
        }
        .login_line{
            border-top: 1px solid #e8e8e8;
            width: 95%;
            float: right;
        }
        .login_submit{
            text-align: center;
            margin-top: 5rem;
        }
        .login_submit_btn{
            background-color: #F5ad4e;
            border: none;
            color: #fff;
            width: 90%;
            border-radius: 5px;
            height: 5rem;
            line-height: 5rem;
        }
        .get_code{
            height: 5rem;
            width: 36%;
            text-align: center;
            border: none;
            color: #F5AD4E;
            background-color: #fff;
            position: relative;
            border-left: 1px solid #e8e8e8;

            float: right;
        }
        .get_code:focus{
            outline: 1px solid #e8e8e8;
            margin:0 -1px;
        }
        .disable{
            background: #e8e8e8;
            cursor: not-allowed;
        }
        .user_mobile{
            margin-bottom: 1px;
            -webkit-tap-highlight-color:rgba(255,0,0,0);
            -webkit-appearance:none;
            border: 0;
        }

    </style>
    <link href="/resource/css/auto.css" rel="stylesheet" type="text/css">
    <script>
        $(document).ready(function () {
            changeFontSize();
            //点击验证码时候的验证
            $('.get_code').click(function () {
                if ($('.user_mobile').val() == "") {
                    showFloat("请先输入手机号");
                } else if (!myreg.test($('.user_mobile').val())) {
                    showFloat("手机号格式不正确");
                } else {
                    sendCode();
                    time(this);
                }
            });
        });

        var wait = 60;
        var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
        var user_id = 86;
        //发送验证码
        function sendCode(){
            var obj = {};
            obj.action = 'sms';
            obj.mobile = $('.user_mobile').val();
            obj.user_id = user_id;
            validate.validate_submit('/api/reg', obj, sendMessage);
        }
        //通过ajax获取验证码
        function sendMessage() {
            showFloat("验证码已发送，您的手机将在5分钟内进行回收，请保持设备通信状态。");
        }
        //设置定时器
        function time(i) {
            if (wait == 0) {
                $(i).val("获取短信验证码");
                $(i).css({background: "#fff", cursor: "pointer"});
                $('.get_code').removeAttr("disabled", "true");
                wait = 60;
            } else {
                $(i).css({background: "#e8e8e8", cursor: "not-allowed"});
                $(i).val("重新发送(" + wait + ")");
                $('.get_code').attr("disabled", "disabled");
                wait--;
                setTimeout(function () {
                    time(i);
                }, 1000);
            }
        }

        //展示浮动层
        function showFloat(errorTips){
            $('.hover').fadeIn(200);
            $('.float_container').fadeIn(200);
            $('.float_box_span').text(errorTips);
            setTimeout(function () {
                $('.hover').fadeOut(200);
                $('.float_container').fadeOut(200);
            }, 1500);
        }
        function checkCode(obj){
            if($(obj).val()==""){
                $('.login_submit_btn').addClass('disable').attr("disabled", "disabled");
            }else{
                $('.login_submit_btn').removeClass('disable').removeAttr("disabled", "true");
            }
        }
        //最终检测
        function loginCheck(){
            if ($('.user_mobile').val() == "") {
                showFloat("请先输入手机号");
            } else if (!myreg.test($('.user_mobile').val())) {
                showFloat("手机号格式不正确");
            } else if ($('.user_code').val() == "") {
                showFloat("请输入验证码");
            }else{
                sendCheckCode();
            }
        }
        //比对验证码
        function sendCheckCode(){
            var obj = {};
            obj.action = 'sms_check';
            obj.mobile = $('.user_mobile').val();
            obj.user_id = user_id;
            obj.code = $('.user_code').val();
            $.ajax({
                type: "POST",
                url: '/api/reg',
                data: obj,
                dataType: "json",
                success: function (data) {
                    global_data=data;
                    if(global_data.status==true){

                        window.location.href="/auth/base"
                    }else{
                        showFloat(global_data.message);
                    }
                },
                error: function () {
                    console.log("交互失败");
                    showFloat(global_data.message);
                }
            })
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
<div class="login_container">
    <div class="login_title">
        <img src="/resource/images/pch_logo.png">
        <div class="clear"></div>
    </div>
    <form method="post" id="form_login" onsubmit="return false" action="/">
        <div class="login_mid">
            <div class="login_input_box">
                <input type="text" placeholder="请输入手机号" class="user_mobile">
            </div>
            <div class="login_line"></div>
            <div class="login_input_box">
                <input type="text" placeholder="验证码" style="width: 60%" class="user_code" onkeyup="checkCode(this)">
                <input type="button" value="获取短信验证码" class="get_code" onselectstart="return false">
                <div class="clear"></div>
            </div>
        </div>
        <div class="login_submit">
            <input type="submit" value="登陆" class="btn login_submit_btn disable" disabled="disabled" onclick="loginCheck()">
        </div>
    </form>

    <%--<div class="login_other">--%>
        <%--<div class="login_other_tips">--%>
            <%--<div class="login_line"></div>--%>
            <%--<span>其他社交网站登陆</span>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>
</body>
</html>
