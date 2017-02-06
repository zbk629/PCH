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
  <title>全民代理</title>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="/resource/js/style.js" type="text/javascript"></script>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
  <link href="/resource/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <style type="text/css">
    body {
      background-color: #E4E4E5;
    }


    /*end*/
    .cash_pay_message {

      margin-bottom: 1.2rem;
    }

    .cash_error_box {
      padding: 2rem 1rem;
    }

    /*支付宝信息*/
    .cash_message_top {
      background: #5B9BD5;
      color: #fff;
    }


    .cash_pay_self_message {
      padding: .9rem 2rem;
      background-color: #fff;
      margin-bottom: .5rem;
    }


    .loading {
      width: 3rem;
    }

    /*账户填写*/


    .close_booking {
      position: absolute;
      right: 1rem;
      top: 0;
      font-size: 24px;
      color: #999;
      cursor: pointer;
      -webkit-tap-highlight-color: transparent;
    }

    .close_booking:hover {
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


    /*修改样式*/
    .cash_balance {
      font-size: 5rem;
      line-height: 3.2rem;
      margin: 2.4rem 0 2.6rem;
    }
    .cash_balance_span{
      font-size: 3rem;
    }

    .cash_title {
      display: inline-block;
      font-size: 1.6rem;
    }

    .cash_explain {
      float: right;
      font-size: 1.6rem;
    }

    .cash_all_top {
      padding: 2.6rem 1.4rem 2.4rem;
    }


    .cash_explain img {
      width: 1.4rem;
      position: relative;
      top: .2rem;
    }


    div {
      -webkit-tap-highlight-color: rgba(255, 0, 0, 0);
      -webkit-appearance: none;
    }


    .success_push_li {
      line-height: 2.6rem;
      color: #888;
    }

    .success_push_type {
      float: right;
      color: #5B9BD5;
    }

    .more_success {
      border-top: 1px solid #e8e8e8;
      text-align: center;
      line-height: 3.2rem;
      color: #5B9BD5;
      display: none;
    }

    .not_have {
      line-height: 11rem;
      text-align: center;
      color: #888;
      display: none;
    }

    .success_push_time {
      /*text-align: center;*/
      margin-left: 2.2rem;
    }

    .success_push_ul {
      max-height: 8rem;
      overflow: hidden;
    }


    /*全民代理样式*/
    .un_left{
      width: 3rem;
      height: 3rem;
      display: inline-block;
      position: relative;
    }
    .un_right{
      display: inline-block;
      margin-left: .5rem;
    }
    .un_right_span{
      color: #888;
      font-size: 1.2rem;
    }
    .un_bottom{
      padding: 1.5rem 0 0rem;
    }
    .un_bottom_blod{
      font-size: 2.2rem;
      display: block;
      text-align: center;
    }
    .un_bottom_line{
      display: block;
      text-align: center;
      color: #888;
      font-size: 1.2rem;
      margin-top: .2rem;
    }
    .cash_money{
      color: #e74c3c;
      padding-bottom: 2rem;
    }
    .un_right_title{
      font-size: 1.6rem;
    }
    .un_select{
      border-top: 1px solid #e8e8e8;
    }
    .to_cash,.to_detail{
      display: block;
      width: 100%;
      text-align: center;
      line-height: 2rem;
      padding-top: 1.4rem;
      font-size: 1.6rem;
      color: #888;
      color: #3498db;
    }
    .to_detail{
      color: #3498db;
    }
    .un_bottom_left{
      float: left;
      width: 50%;
      text-align: center;
      margin-bottom: .5rem;
    }
    .un_friend_number{
      font-size: 2rem;
    }
    .un_friend_span{
      color: #888;
      font-size: 1.2rem;
    }
  </style>
  <script>
    $(document).ready(function () {
      changeFontSize();
      android_get_token();

    });
    var action_url = "/app/api/pay/orders";
    var change = 0;
//    var token = window.location.href.split('token=')[1].substring(0, 32);
    var token = "cb15c3cf28cb81be4e82e4896da8c4c8";
    var current_cash;
    function android_get_token() {

      try {
//                var local_token=androidInterface.getToken();
//                token = local_token;
        loadUser();
        loadSuccess();
      }
      catch (err) {
        console.log(err);
      }

    }
    //获取数据
    function loadUser() {
      var obj = {};
      obj.token = token;
      validate.validate_submit3('/pay/abstract', obj, insertMessage);
    }
    //查看邀请人数
    function loadSuccess() {
      var obj = {};
      obj.action = 'show_info';
      obj.token = token;
      validate.validate_submit3('/campaign', obj, insertSuccessMessage);
    }
    function insertSuccessMessage() {
        $('.un_mobile').text(global_data.result.mobile);
        $('.total_campaign').text(global_data.result.total_campaign);
        $('.total_departure').text(global_data.result.total_departure);
        $('.un_avatar').attr('src',global_data.result.avatar);
    }
    //展示错误信息
    function sendKeepDownInput() {
      $('.booking_error').hide();
    }
    function insertMessage() {
      var campaign_cash = global_data.result.campaign_cash;//推广
      var already_got_cash = global_data.result.already_got_cash;//已提现金额
      var total_day = global_data.result.total_day;//天数
      current_cash = global_data.result.current_cash;//可提现金额
      $('.cash_balance_money').text(campaign_cash);
      $('.cash_money').text('+'+already_got_cash);
      $('.total_day').text(total_day);

    }
    //      提现
    function href_to_cash() {
      window.location.href = "/withdraw_cash_pay?token=" + token + "&current_cash=" + current_cash;
    }
    //推广详情
    function href_to_success_detail() {
      window.location.href = "/share_more?token=" + token + "&end";
    }
    //账户详情
    function href_to_account_detail() {
      window.location.href = "/universal_account?token=" + token + "&end";
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
              <div class="cash_title">全民代理总收益</div>
              <span class="cash_explain"><img src="/resource/images/universal/icon_question.png"></span>
            </div>
            <div class="cash_balance">
              <span class="cash_balance_span">￥</span>
              <span class="cash_balance_money"></span>
            </div>
          </div>
        </div>
        <div class="cash_pay_self_message">
          <div class="un_top">
            <img class="un_left un_avatar" src="" >
            <div class="un_right">
              <div class="un_right_title un_mobile"></div>
              <div class="un_right_span">加入全民代理之后多了一份不用工作的工作</div>
            </div>
          </div>
          <div class="un_bottom">
            <span class="un_bottom_blod">一位白领工作<span class="total_day"></span>天</span>
            <span class="un_bottom_line">您用全民代理挣的收入约等于</span>
          </div>
          <div class="clear"></div>
        </div>
        <%--累计提现--%>
        <div class="cash_pay_self_message">
          <div class="un_top">
            <img class="un_left" src="/resource/images/universal/icon_money.png">
            <div class="un_right">
              <div class="un_right_title">累计提现</div>
              <div class="un_right_span">不积跬步，无以至千里；不积小流，无以成江河</div>
            </div>
          </div>
          <div class="un_bottom">
            <span class="un_bottom_blod cash_money">+36.65</span>
          </div>
          <div class="un_select">
            <span class="to_cash" onclick="href_to_cash()">一键提现</span>
            <div class="clear"></div>
          </div>
          <div class="clear"></div>
        </div>
        <%--账单记录--%>
        <div class="cash_pay_self_message">
          <div class="un_top">
            <img class="un_left" src="/resource/images/universal/icon_list.png">
            <div class="un_right">
              <div class="un_right_title">账单记录</div>
              <div class="un_right_span">增加一名好友，你就增加一份收入</div>
            </div>
          </div>
          <div class="un_bottom">
            <div class="un_bottom_left" onclick="href_to_success_detail()">
              <div class="un_friend_number total_campaign"></div>
              <div class="un_friend_span">推荐好友数量</div>
            </div>
            <div class="un_bottom_left" onclick="href_to_account_detail()">
              <div class="un_friend_number total_departure"></div>
              <div class="un_friend_span">好友发车数量</div>
            </div>
            <div class="clear"></div>
          </div>
          <div class="un_select">
            <span class="to_detail" onclick="href_to_account_detail()">查看</span>
            <div class="clear"></div>
          </div>
          <div class="clear"></div>
        </div>
      </div>

    </div>
  </div>

</div>

</body>
</html>

