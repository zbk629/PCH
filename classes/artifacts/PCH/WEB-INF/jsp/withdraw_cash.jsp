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
        body{
            background-color: #F9F9F9;
        }
        /*返回上一层*/
        .publish_top {
            background-color: #F5AD4E;
            text-align: center;
            line-height: 4.2rem;
            font-size: 1.4rem;
            padding: 0 1rem;
            color: #fff;
        }

        .publish_top_right {
            float: right;
            /* font-size: 1.4rem; */
            color: #999794;
            /* line-height: 3.2rem; */
            width: 1.8rem;
            position: relative;
            top: 1rem;
        }

        .return_perv {
            float: left;
        }

        .return_perv_img {
            width: 1.4rem;
            /* line-height: 9.8rem; */
            display: inline-block;
            top: 0.2rem;
            position: relative;
        }

        /*end*/
        .cash_pay_message {
            background-color: #fff;
            margin-bottom: 1rem;
        }

        .cash_error_img {
            float: left;
            width: 4rem;
        }

        .cash_tips_box {
            float: left;
            padding-left: 1rem;
        }

        .cash_tips_text {
            font-size: 2rem;
            /* padding-bottom: .4rem; */
            /* padding-left: 1rem; */
            display: inline-block;
            /* background: #F5AD4E; */
            color: #f5ad4e;
            /* padding: .4rem 1rem; */
            border-radius: 5px;
            /* text-decoration: underline; */
            margin-bottom: 0.5rem;
        }

        .cash_bottom_tips {
            font-size: 1.2rem;
            color: #999;
        }

        .cash_error_box {
            padding: 2rem 1rem;
        }

        /*支付宝信息*/
        .cash_message_top {
            background: #5B9BD5;
            color: #fff;
        }

        .cash_all_count {
            color: #fff;
            float: left;
            width: 50%;
            -moz-box-sizing: border-box; /*Firefox3.5+*/
            -webkit-box-sizing: border-box; /*Safari3.2+*/
            -o-box-sizing: border-box; /*Opera9.6*/
            -ms-box-sizing: border-box; /*IE8*/
            box-sizing: border-box; /*W3C标准(IE9+，Safari5.1+,Chrome10.0+,Opera10.6+都符合box-sizing的w3c标准语法)*/
            padding: 1rem 0 1.1rem;
            font-size: 2rem;
        }
        .cash_all_count_last{
            border-left: 1px solid #699BC8;
            padding-left: 2rem;
        }

        .cash_all_count_title {
            margin-bottom: .6rem;
            font-size: 1.6rem;
        }

        .cash_pay_self_message {
            padding: .9rem 2rem;
        }

        .cash_pay_logo {
            float: left;
            width: 2rem;
            position: relative;
            top: .4rem;
        }

        .cash_self_message {
            float: left;
            padding: .3rem 1rem;
            font-size: 1.8rem;
        }

        .cash_self_message_img {
            float: right;
            padding: .4rem 0;
            /* font-size: 1.8rem; */
            width: 2rem;
        }

        .departure_li_status {
            position: absolute;
            top: 1.2rem;
            right: 1.5rem;
            /* background-color: #f5ad4e; */
            padding: .2rem .4rem;
            color: #f5ad4e;
            border-radius: 3px;
        }

        .circle {
            width: 6px;
            height: 6px;
            background-color: #999794;
            display: inline-block;
            border-radius: 50%;
            position: relative;
            top: -.15rem;
            margin: 0 .2rem;
        }

        .circle_more {
            width: 6px;
            height: 6px;
            background-color: #b3b3b3;
            display: inline-block;
            border-radius: 50%;
            position: relative;
            top: -.15rem;
            margin: 0 .2rem;
        }

        .circle_hide_top_left {
            width: 2rem;
            height: 2rem;
            background-color: #F2EFEB;
            display: inline-block;
            border-radius: 50%;
            margin: 0 .2rem;
            position: absolute;
            top: -1rem;
            left: -2em;
        }

        .begin_city, .end_city {
            font-size: 1.2rem;
        }

        .departure_li_city {
            font-size: 1.4rem;
            line-height: 3rem;
            position: relative;
            padding-right: 5.4rem;
        }

        .cash_departure_li {
            position: relative;
            margin-bottom: 1.5rem;
            padding: .8rem 1rem;
            border-left: 4px solid #f5ad4e;
            /* border-top: 1px solid #e8e8e8; */
            /* border-bottom: 1px solid #e8e8e8; */
            background: #fff;
        }
        .loading{
             width: 3rem;
         }

        .cash_departure_style {
            line-height: 3rem;
        }

        .cash_style_left {
            float: left;
            margin-right: 2rem;
        }

        .cash_style_left img {
            width: 1.4rem;
            position: relative;
            top: .2rem;
        }

        .cash_style_left_money {
            color: #f5ad4e;
        }

        .cash_style_left_time {
            color: #888;
        }

        .cash_departure_li_bottom {
            line-height: 3rem;
        }

        .cash_departure_img_box {
            display: inline-block;
        }

        /*.cash_departure_img_box img{*/
        /*width: 2rem;*/
        /*border-radius: 50%;*/
        /*border: 1px solid #fff;*/
        /*position: relative;*/
        /*top: .7rem;*/
        /*margin: 0 0.2rem;*/
        /*}*/
        .cash_detail {
            float: right;
            color: #E2E2E2;
            line-height: 1rem;
            margin-top: .2rem;
        }

        /*.cash_departure_container{*/
        /*background-color: #fff;*/
        /*padding: .8rem 0;*/
        /*}*/
        .finish_cash {
            border-left: 4px solid #2ecc71;
        }

        .finish_cash .departure_li_status {
            color: #999;

        }

        .cash_departure_container_title {
            padding-left: .4rem;
            line-height: 3rem;
            color: #777;
        }

        .cash_order_li {
            line-height: 2.4rem;
            position: relative;
            border-top: 1px dashed #e8e8e8;
            padding: .4rem 0
        }

        .cash_order_li_city {
            color: #999794;
        }

        .cash_order_li_money {
            float: right;
        }

        .cash_order_li_span {
            color: #52514f;
            display: inline-block;
            max-width: 77%;
            padding-left: .5rem;
        }

        .cash_order_li_title {
            float: left;
        }

        /*.last_li .circle_hide_bottom_left{*/
        /*display: none;*/
        /*}*/
        .done {
            display: none;
        }

        .image_up {
            width: 1.6rem;
            position: relative;
            top: .4rem;
            margin-right: .4rem;
        }
        /*账户填写*/
        .booking_span {
            display: inline-block;
            background-color: #f5ad4e;
            color: #fff;
            border-radius: 5px;
            padding: 0 2rem;
            cursor: pointer;
        }

        .booking_span:hover {
            background-color: #FF8F0c;
        }

        .close_booking {
            position: absolute;
            right: 1rem;
            top: 0;
            font-size: 24px;
            color: #999;
            cursor: pointer;
            -webkit-tap-highlight-color:transparent;
        }
        .close_booking:hover{
            background-color: #fff;
        }

        .booking_top {
            text-align: center;
            margin-top: 1.2rem;
            margin-bottom: 1.6rem;
            position: relative;
        }

        .booking_container {
            margin: 1rem 0;
            position: relative;
            overflow: hidden;
        }

        .input_style {
            border: none;
            padding: 0 .6rem;
            border-bottom: 1px solid #f5ad4e;
            width: 100%;
            font-size: 1.5rem;
            line-height: 3.2rem;
        }

        .booking_bottom {
            text-align: center;
            color: #fff;
            background-color: #f5ad4e;
            border-radius: 5px;
            line-height: 3.2rem;
            cursor: pointer;
        }

        .booking_bottom:hover {
            background-color: #FF8F0c;
        }

        .booking_li {
            margin-bottom: .8rem;
            position: relative;
        }

        .booking_box {
            font-size: 1.5rem;
        }

        .booking_error {
            position: absolute;
            top: 4.4rem;
            font-size: 1.3rem;
            color: #e74c3c;
            left: 2rem;
        }
        .change_pay_message{
            float: right;
            padding: 1rem .8rem;
            color: #f5ad4e;
        }
        .not_message{
            color: #888;
            text-align: center;
            margin-top: 5rem;
            font-size: 2rem;
            display: none;
        }

        /*修改样式*/
        .cash_balance{
            font-size: 5rem;
            line-height: 3.2rem;
            margin: 2.4rem 0 .6rem;
        }
        .cash_title{
            display: inline-block;
            font-size: 1.8rem;
        }
        .cash_explain{
            float: right;
            font-size: 1.8rem;
        }
        .cash_all_top{
            padding: 2.6rem 1.4rem 2.4rem;
        }
        .cash_all_bottom{
            background-color:#548DC1;
            padding: .8rem 1.4rem 1rem;
        }
        .cash_explain img{
            width: 1.4rem;
            position: relative;
        }
        .count_span{
            font-size: 2.4rem;
        }
        .cash_get{
            position: absolute;
            bottom: 8.8rem;
            text-align: center;
            width:100%;
        }
        .cash_get span{
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
        div{
            -webkit-tap-highlight-color:rgba(255,0,0,0);
            -webkit-appearance:none;
        }
    </style>
    <script>
        $(document).ready(function () {
            changeFontSize();
            android_get_token();
            $('.cash_error_box').click(function(){
                showFloatStyle2();
                $('.float_container2').empty().append('<div class="booking_box">' +
                        '<div class="close_booking" onclick="removeFloatMessage()">x</div>' +
                        '<p class="booking_top">填写转账账户，方便平台给您提现</p>' +
                        '<span class="booking_error"></span>' +
                        '<div class="booking_container">' +
                        '<div class="booking_li">' +
                        '<input placeholder="请输入转账账户" type="text" index="0" class="input_style pay_user" oninput="sendKeepDownInput(this)">' +
                        '</div>' +
                        '</div>' +
                        '<div class="booking_bottom" onclick="checkInput()">确认</div>' +
                        '</div>');
            })
        });
        var action_url = "/app/api/pay/orders";
        var change = 0;
        var token = window.location.href.split('token=')[1];
        var current_cash;
        function android_get_token()
        {

            try
            {
//                var local_token=androidInterface.getToken();
//                token = local_token;
                loadUser();
            }
            catch(err)
            {
                alert(err);
            }

        }
        //封装传输的信息并提交
        function loadUser() {
            var obj = {};
            obj.token=token;
            validate.validate_submit3('/pay/abstract', obj, insertMessage);
        }

        //展示错误信息
        function sendKeepDownInput(){
            $('.booking_error').hide();
        }
        function insertMessage() {
            var cash_balance = global_data.result.total_cash;//全部收入
            var campaign_cash = global_data.result.campaign_cash;//推广
            var already_got_cash = global_data.result.already_got_cash;//已提现金额
            current_cash = global_data.result.current_cash;//可提现金额
            $('.cash_balance').text(cash_balance);
            $('.campaign_cash').text(campaign_cash);
            $('.already_got_cash').text(already_got_cash);
        }
//      提现
        function href_to_cash(){
            window.location.href="/withdraw_cash_pay?token="+token+"&current_cash="+current_cash;
        }
//      账户详情
        function href_to_detail(obj){
            var data_type = $(obj).attr('data_type');
            window.location.href="/account_list?token="+token+"&data_type="+data_type;
        }
    </script>
</head>
<body>
<div class="hover_all"></div>
<div class="loading_box">
    <img class="loading" src="/resource/images/loading.gif" alt="请等待">
</div>
<div class="hover"></div>
<div class="float_container">
</div>
<div class="float_container2">
</div>
<div class="cash_container">
    <div class="cash_pay_message">
        <div class="cash_success_box" style="display: block">
            <div class="cash_message_box">

                <div class="cash_message_top">
                    <div class="cash_all_top">
                        <div class="cash_message_title">
                            <div class="cash_title">账户余额 (元)</div>
                            <span class="cash_explain"><img src="/resource/images/pc_icon_cash_question.png"> 提现说明</span>
                        </div>
                        <div class="cash_balance">
                            0.0
                        </div>
                    </div>
                    <div class="cash_all_bottom">
                        <div class="cash_all_count" data_type="3" onclick="href_to_detail(this)">
                            <div class="cash_all_count_title">累计提现&nbsp;&nbsp;( 元 )</div>
                            <span class="count_span already_got_cash">0.</span>
                        </div>
                        <div class="cash_all_count cash_all_count_last" data_type="1" onclick="href_to_detail(this)">
                            <div class="cash_all_count_title">累计推广&nbsp;&nbsp;( 元 )</div>
                            <span class="count_span campaign_cash">0.0</span>
                        </div>
                        <div class="clear"></div>
                    </div>

                </div>
                <div class="cash_pay_self_message" data_type="" onclick="href_to_detail(this)">
                    <img src="/resource/images/pc_icon_cash_money.png" class="cash_pay_logo">
                    <div class="cash_self_message">
                        <span style="color: #535353">账户明细</span>
                        <span class="cash_user"></span>
                    </div>
                    <img src="/resource/images/pc_icon_cash_right.png" class="cash_self_message_img">
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="cash_get" onclick="href_to_cash()">
        <span>现金提取</span>
    </div>

</div>

</body>
</html>

