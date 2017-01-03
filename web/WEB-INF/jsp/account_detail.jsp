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
      font-size: 1.8rem;
        -moz-box-sizing: border-box; /*Firefox3.5+*/
        -webkit-box-sizing: border-box; /*Safari3.2+*/
        -o-box-sizing: border-box; /*Opera9.6*/
        -ms-box-sizing: border-box; /*IE8*/
        box-sizing: border-box; /*W3C标准(IE9+，Safari5.1+,Chrome10.0+,Opera10.6+都符合box-sizing的w3c标准语法)*/
    }
    .account_details_container{
        padding-top: 1.2rem;
    }
    .account_details_money{
          background: #fff;
          line-height: 7rem;
          padding: 0 1.4rem;
    }
      .account_details_title{
          color: #999;
      }
      .account_details_text{
          float: right;

      }
      .account_details_type{
          background: #fff;
          border-top: 1px solid #e8e8e8;
          border-bottom: 1px solid #e8e8e8;
          /* color: black; */
          margin-top: 2.8rem;
          padding: .6rem 1.4rem;
      }
      .account_details_list{
          line-height: 3.4rem;
      }
  </style>
  <script>
    $(document).ready(function () {
      changeFontSize();

//            android_get_token();

    });
    var action_url = "/app/api/pay/orders";
    var change_type = 0;
    var token= "7f5bfcb450e7425a144f3e20aa1d1a6e";

    function android_get_token()
    {

      try
      {
//                var local_token=androidInterface.getToken();
//                token = local_token;
        loadUser();
        loadCash();
      }
      catch(err)
      {
        console.log(err);

      }

    }
    //封装传输的信息并提交
    function loadUser() {
      $('.cash_success_box').show();
      $('.cash_error_box').hide();
      var obj = {};
      obj.action = 'check_account';
      obj.token=token;
      validate.validate_submit3(action_url, obj, insertMessage);
    }

    //载入提现订单信息
    function loadCash() {
      var obj = {};
      obj.action = 'show_my_pay_orders';
      obj.token=token;
      validate.validate_submit3(action_url, obj, insertOrderList);
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
<div class="account_details_container">
  <div class="account_details_money">
    <span class="account_details_title">出账金额</span>
    <span class="account_details_text" style="font-size: 2.4rem;">-150</span>
  </div>
  <div class="account_details_type">
    <div class="account_details_list">
      <span class="account_details_title">类型</span>
      <span class="account_details_text">提现-支付宝-xxxxxxxx</span>
    </div>
    <div class="account_details_list">
      <span class="account_details_title">时间</span>
      <span class="account_details_text">2016-08-12 08:23</span>
    </div>
    <div class="account_details_list">
      <span class="account_details_title">交易单号</span>
      <span class="account_details_text">2016-08-12 08:23</span>
    </div>
    <div class="account_details_list">
      <span class="account_details_title">账户余额</span>
      <span class="account_details_text">150.00元</span>
    </div>
  </div>
</div>

</body>
</html>

