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
    }
    .account_nav{
      background: #fff;
      border-bottom: 1px solid #e8e8e8;
      -moz-box-sizing: border-box; /*Firefox3.5+*/
      -webkit-box-sizing: border-box; /*Safari3.2+*/
      -o-box-sizing: border-box; /*Opera9.6*/
      -ms-box-sizing: border-box; /*IE8*/
      box-sizing: border-box; /*W3C标准(IE9+，Safari5.1+,Chrome10.0+,Opera10.6+都符合box-sizing的w3c标准语法)*/
    }
    .account_nav_li{
      float: left;
      width: 33.3%;
      line-height: 4.6rem;
      text-align: center;
    }
    .account_nav_li_active{
      border-bottom: 2px solid #5b9bd5;
    }
    .account_list_li{
      background: #fff;
      padding: 1.2rem 2rem;
      margin-top: 1rem;
      border-top: 1px solid #e8e8e8;
      border-bottom: 1px solid #e8e8e8;
    }
    .account_list_li_left{
      float: left;
    }
    .account_list_type{
      color: #000;
    }
    .account_list_time{
      font-size: 1.6rem;
      color: #999;
      margin-top: .2rem;
      margin-bottom: .2rem;
    }
    .account_list_li_right{
      float: right;
      margin-top: .8rem;
      /* font-weight: bold; */
      font-size: 2.3rem;
    }
    .up_style{
      color: #FF0000;
    }
    .down_style{
      color: #000;
    }
    .account_list_more{
      text-align: center;
      margin: 2rem;
    }
    .account_list_more span{
      color: #A5A5A5;
      display: inline-block;
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

//    改变数据
    function changeType(obj){
      change_type = $(obj).attr('data_type');
      $('.account_nav_li').removeClass("account_nav_li_active");
      $(obj).addClass("account_nav_li_active");
//      var obj = {};
//      obj.action = 'show_my_pay_orders';
//      obj.token=token;
//      validate.validate_submit3(action_url, obj, insertOrderList);
    }
    //        账户详情
    function href_to_detail(){
      window.location.href="/account_detail";
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
<div class="account_list_container">
  <ul class="account_nav">
    <li class="account_nav_li account_nav_li_active" data_type="0" onclick="changeType(this)">
      全部
    </li>
    <li class="account_nav_li"  data_type="1" onclick="changeType(this)">
      提现
    </li>
    <li class="account_nav_li"  data_type="2" onclick="changeType(this)">
      推广
    </li>
    <div class="clear"></div>
  </ul>
  <div class="account_list_box">
    <ul class="account_list_ul">
      <li class="account_list_li" onclick="href_to_detail()">
        <div class="account_list_li_left">
          <div class="account_list_type">
            推广
          </div>
          <div class="account_list_time">
            2016-12-16 08:03
          </div>
        </div>
        <div class="account_list_li_right up_style">
          +15
        </div>
        <div class="clear"></div>
      </li>
      <li class="account_list_li" onclick="href_to_detail()">
        <div class="account_list_li_left">
          <div class="account_list_type">
            拼车
          </div>
          <div class="account_list_time">
            2016-12-16 08:03
          </div>
        </div>
        <div class="account_list_li_right down_style">
          -150
        </div>
        <div class="clear"></div>
      </li>
      <li class="account_list_li" onclick="href_to_detail()">
        <div class="account_list_li_left">
          <div class="account_list_type">
            提现
          </div>
          <div class="account_list_time">
            2016-12-16 08:03
          </div>
        </div>
        <div class="account_list_li_right down_style">
          -150
        </div>
        <div class="clear"></div>
      </li>
      <li class="account_list_li" onclick="href_to_detail()">
        <div class="account_list_li_left">
          <div class="account_list_type">
            提现
          </div>
          <div class="account_list_time">
            2016-12-16 08:03
          </div>
        </div>
        <div class="account_list_li_right down_style">
          -150
        </div>
        <div class="clear"></div>
      </li>
      <li class="account_list_li" onclick="href_to_detail()">
        <div class="account_list_li_left">
          <div class="account_list_type">
            提现
          </div>
          <div class="account_list_time">
            2016-12-16 08:03
          </div>
        </div>
        <div class="account_list_li_right down_style">
          -150
        </div>
        <div class="clear"></div>
      </li>
      <li class="account_list_li" onclick="href_to_detail()">
        <div class="account_list_li_left">
          <div class="account_list_type">
            推广
          </div>
          <div class="account_list_time">
            2016-12-16 08:03
          </div>
        </div>
        <div class="account_list_li_right up_style">
          +15
        </div>
        <div class="clear"></div>
      </li>
      <div class="account_list_more">
        <span>加载更多</span>
        <div class="clear"></div>
      </div>
    </ul>
  </div>
</div>

</body>
</html>

