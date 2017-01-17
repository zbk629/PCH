<%--
  Created by IntelliJ IDEA.
  User: zhu
  Date: 2016/10/13
  Time: 9:30
  describtion:移动管理--【提现】app左侧提现界面
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>提现</title>
    <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="/resource/js/style.js" type="text/javascript"></script>
    <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
    <link href="/resource/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        body {
            background-color: #F9F9F9;
            font-size: 1.6rem;
        }

        input:focus {
            border-color: #e8e8e8;
        }

        /*返回上一层*/
        .cash_top_title {
            line-height: 4rem;
            padding: 0 1.4rem;
        }

        .cash_type1 {
            background-color: #fff;
            margin-bottom: .4rem;
            position: relative;
            color: #a5a5a5;
        }

        .cash_type1 span {
            margin: 0 1.4rem 0 .2rem;
        }

        .cash_type_img {
            width: 2rem;
            position: relative;
            top: .4rem;
        }

        .cash_type_select {
            width: 2rem;
            position: relative;
            top: 1.3rem;
            float: right;
            right: 1.4rem;
        }

        .cash_top_input input {
            width: 64%;
            float: left;
            /*line-height: 4.6rem;*/
            /* padding: 0 1.4rem; */
            padding-top: 1.4rem;
            font-size: 1.6rem;
            /* margin-top: 2.4rem; */
            padding-left: 1.4rem;
            -moz-box-sizing: border-box; /*Firefox3.5+*/
            -webkit-box-sizing: border-box; /*Safari3.2+*/
            -o-box-sizing: border-box; /*Opera9.6*/
            -ms-box-sizing: border-box; /*IE8*/
            box-sizing: border-box; /*W3C标准(IE9+，Safari5.1+,Chrome10.0+,Opera10.6+都符合box-sizing的w3c标准语法)*/
            color: #a5a5a5;
        }

        .cash_middle {
            padding-left: 1.4rem;
            background: #fff;
            margin-top: 1.6rem;
            padding-top: .3rem;
        }

        .cash_middle_title, .cash_middle_tips_span {
            color: #A9A9A9;
            margin-top: 0.4rem;
        }
        .cash_middle_title, .cash_middle_tips_span_error {
            color: #E74C3C;
            margin-top: 0.4rem;
            display: none;
        }
        .cash_input_box {
            color: #000;
            position: relative;
            margin-top: 1rem;
        }

        .cash_input_box span {
            font-size: 4rem;
            display: inline-block;
            float: left;
        }

        .cash_input_style {
            width: 86%;
            float: right;
            /* float: left; */
            line-height: 4.6rem;
            font-size: 4.6rem;
            border-bottom: 1px solid #e8e8e8;
            padding-right: 0rem;
            text-indent: 1rem;
        }

        .cancel_input {
            width: 1.6rem;
            position: absolute;
            right: 1.5rem;
            top: 1.6rem;
            display: none;
        }

        .cash_middle_tips {
            line-height: 4rem;
        }

        .cash_all {
            float: right;
            margin-right: 1.4rem;
            color: #5b9bd5;
        }

        .cash_type_box {
            width: 34%;
            float: right;

            line-height: 4.6rem;
        }

        /*bottmo*/
        .cash_get {
            /* position: absolute; */
            /* bottom: 8.8rem; */
            text-align: center;
            width: 100%;
            margin-top: 14rem;
        }

        .cash_get span {
            width: 90%;
            margin: 0 auto;
            background: #5B9BD5;
            padding: 1rem 0;
            border-radius: 5px;
            color: #fff;
            display: inline-block;
            font-size: 1.6rem;
            line-height: 2.6rem
        }


        .active_type{
            color: #555;
        }
        .active_type .cash_top_input input{
            color: #333;
        }

        .uncolor {
            color: #e7e6e6;
        }

        .unbackground_color {
            background-color: #e7e6e6!important;
            color: #a9a9a9!important;
        }

        /*提现成功界面*/
        .cash_success{
            display: none;
            padding: 0 1.4rem;
        }
        .cash_success_img_box{
            text-align: center;
            margin-top: 4rem;
        }
        .cash_success_img_box img{
            width: 8.5rem;
        }
        .cash_success_h1{
            font-size: 2.6rem;
            /* font-weight: bold; */
            margin-top: 1.4rem;
        }
        .cash_success_time{
            margin-top: 1rem;
            color: #999;
        }
        .cash_success_detail{
            margin-top: 3rem;
        }
        .cash_success_item{
            margin-top: 1.3rem;
        }
        .success_item_name{
            color: #999;
        }
        .success_item_val{
            float: right ;
        }
        .balance_money{
            color: #5B9BD5;
        }
        .cash_success_get {
            /* position: absolute; */
            /* bottom: 8.8rem; */
            text-align: center;
            width: 100%;
            margin-top: 9rem;
        }

        .cash_success_get span {
            width: 100%;
            margin: 0 auto;
            background: #5B9BD5;
            padding: 1rem 0;
            border-radius: 5px;
            color: #fff;
            display: inline-block;
            font-size: 1.6rem;
            line-height: 2.6rem
        }
    </style>
    <script>
        $(document).ready(function () {
            changeFontSize();
            android_get_token();
            if(current_cash=="undefined"){
                current_cash="0.0";
                $('.balance').text(current_cash)
            }else{
                $('.balance').text(current_cash)
            }
        });
        var change = 0;

        var token = window.location.href.split('?token=')[1].split('&current_cash=')[0];
        var current_cash = window.location.href.split('&current_cash=')[1];
        var pay_account;
        var type = 0;
        function android_get_token() {

            try {
//                var local_token=androidInterface.getToken();
//                token = local_token;
                loadUser();
            }
            catch (err) {
                console.log(err);
                $('.cash_success_box').hide();
                $('.cash_error_box').show();
                $('.not_message').show();
            }

        }
        //封装传输的信息并提交
        function loadUser() {
            var obj = {};
            obj.action = 'show';
            obj.token = token;
            validate.validate_submit3('/pay/account', obj, insertMessage);
        }
        //判断是否存在账户记录
        function insertMessage(){
            var count_type = global_data.result.type;
            pay_account = global_data.result.pay_account;
            if(count_type==0){
                //支付宝
                changePay($('.zhifu_type'));
                $('.zf').val(pay_account);
            }else if(count_type==1){
                //微信
                changePay($('.weixin_type'));
                $('.wx').val(pay_account);
            }else{

            }
        }
//        改变支付方式
        function changePay(obj){
            $('.cash_type1').removeClass('active_type');
            $(obj).addClass('active_type');
            $('.cash_type_select').attr('src','/resource/images/pch_cash_unselect.png');
            $(obj).find('.cash_type_select').attr('src','/resource/images/pch_cash_select.png');
            $(obj).find('.cash_top_input input').focus();
            $('.cash_input_user').attr('placeholder','');
            if($(obj).index()==1){
                type = 0;
                $('.zf').attr('placeholder','请输入您的支付宝帐号');
            }else{
                type = 1;
                $('.wx').attr('placeholder','请输入您的微信账号');
            }
            $('#inputId').val("");
            $('.cancel_input').hide();
            $('.get_cash').addClass("unbackground_color");
        }
        //封装传输的信息并提交
        function upCash() {
            if(!$('.get_cash').hasClass('unbackground_color')){
                pay_account = $('.active_type').find('.cash_input_user').val();
                var obj = {};
                obj.action = 'add';
                obj.token = token;
                obj.cash = $('#inputId').val();
                obj.pay_type =type;
                obj.pay_account =pay_account;
                validate.validate_submit3('/pay/account', obj, showSuccess);
            }
        }

        //展示提现过后的界面
        function showSuccess(){
            $('.cash_container').hide();
            $('.cash_success').show();
            if(type==0){
                $('.success_type').text("支付宝");
            }else{
                $('.success_type').text("微信");
            }
            $('.success_count').text(pay_account);
            $('.success_money').text($('#inputId').val()+'元')

        }
        //检测数据的正确性
        function checkPay(){
            if(isNaN($('#inputId').val().trim())){
                $('#inputId').val("");
                $('.cancel_input').hide();
                $('.cash_middle_tips_span').show();
                $('.cash_middle_tips_span_error').hide();
                $('.get_cash').addClass("unbackground_color");
            }else if($('.active_type').find('.cash_input_user').val()==""){
                $('#inputId').val("");
                $('.cancel_input').hide();
                $('.get_cash').addClass("unbackground_color");
                $('.cash_middle_tips_span').hide();
                $('.cash_middle_tips_span_error').show().text('提现账号不能为空');
            }else if($('#inputId').val().trim()==0){
                $('.cancel_input').show();
                $('.cash_middle_tips_span').show();
                $('.cash_middle_tips_span_error').hide();
                $('.get_cash').addClass("unbackground_color");
            }else{
                $('.cash_middle_tips_span').show();
                $('.cash_middle_tips_span_error').hide();
                if($('#inputId').val()==""){
                    $('.cancel_input').hide();
                    $('.get_cash').addClass("unbackground_color");
                }else{
                    //判断金额是否超过可提现金额
                    if(parseFloat( $('#inputId').val())>parseFloat($('.balance').text()) ){
                        $('.cash_middle_tips_span_error').show().text('金额已超过可提现余额');
                        $('.cash_middle_tips_span').hide();
                        $('.get_cash').addClass("unbackground_color");
                    }else{
                        $('.cash_middle_tips_span_error').hide().text("");
                        $('.cash_middle_tips_span').show();
                        $('.cancel_input').show();
                        $('.get_cash').removeClass("unbackground_color");
                    }
                }
            }

        }

//        清空输入框
        function clearInput(obj){
            $(obj).parent().children('.cash_input_style').val("");
            checkPay();
            $(obj).hide();

        }
//        提现
        function cashBalance(){
         $('.cash_input_style').val($('.balance').text());
            checkPay();
        }

        function hrefTo(){
            //重新加载
            window.location.href="/withdraw_cash?token="+token;
        }
    </script>
</head>
<body>
<div class="hover_all"></div>
<div class="loading_box">
    <img class="loading" src="/resource/images/loading.gif" alt="请等待">
</div>
<div class="hover"></div>
<div class="cash_container">
    <div class="cash_top">
        <div class="cash_top_title">
            选择账户类型
        </div>
        <div class="cash_type">
            <div class="cash_type1 active_type weixin_type" onclick="changePay(this)">
                <div class="cash_top_input">
                    <input placeholder="请输入您的微信帐号" type="tel" class="cash_input_user wx">
                </div>
                <div class="cash_type_box">
                    <img src="/resource/images/pch_cash_wx.png" class="cash_type_img">
                    <span class="cash_type_name">微信</span>
                    <img src="/resource/images/pch_cash_select.png" class="cash_type_select">
                </div>
                <div class="clear"></div>
            </div>
            <div class="cash_type1 zhifu_type" onclick="changePay(this)">
                <div class="cash_top_input">
                    <input placeholder="" type="tel" class="cash_input_user zf">
                </div>
                <div class="cash_type_box">
                    <img src="/resource/images/pch_cash_zhi.png" class="cash_type_img" >
                    <span class="cash_type_name">支付宝</span>
                    <img src="/resource/images/pch_cash_unselect.png" class="cash_type_select">
                </div>
                <div class="clear"></div>
            </div>

            <div class="clear"></div>
        </div>

        <div class="cash_middle">
            <div class="cash_middle_title">
                提现金额
            </div>
            <div class="cash_middle_input">
                <div class="cash_input_box">
                    <span>¥</span>
                    <input class="cash_input_style" value="" id="inputId" onkeyup="checkPay()" type="tel" onfocus="checkPay()">
                    <img src="/resource/images/pch_cash_cancel.png" class="cancel_input" onclick="clearInput(this)">

                    <div class="clear"></div>
                </div>
            </div>
            <div class="cash_middle_tips">
                <span class="cash_middle_tips_span">可用余额&nbsp;<span class="balance"></span>&nbsp;元</span>
                <span class="cash_middle_tips_span_error"></span>
                <span class="cash_all" onclick="cashBalance()">全部提现</span>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="cash_get">
        <span class="get_cash unbackground_color" onclick="upCash()">两小时内到账，确认提现</span>
    </div>
</div>
<div class="cash_success">
    <div class="cash_success_img_box">
        <img src="/resource/images/pch_cash_success.png">
        <div class="cash_success_h1">提现申请已提交</div>
        <div class="cash_success_time">预计到账时间：2小时之内</div>
    </div>
    <div class="cash_success_detail">
        <div class="cash_success_item">
            <span class="success_item_name success_type"></span>
            <span class="success_item_val success_count"></span>
        </div>
        <div class="cash_success_item">
            <span class="success_item_name">提现金额</span>
            <span class="success_item_val success_money"></span>
        </div>
    </div>
    <div class="cash_success_get" onclick="hrefTo()">
        <span>完成</span>
    </div>
</div>
</body>
</html>

