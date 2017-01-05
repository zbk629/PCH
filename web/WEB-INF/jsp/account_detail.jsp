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

      android_get_token();

    });
    var action_url = "/pay/info";
    var change_type = 0;
    var token = window.location.href.split('?token=')[1].split('&id=')[0];
    var id = window.location.href.split('&id=')[1].split('&type=')[0];
    var type =window.location.href.split('&type=')[1];
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
        console.log(err);

      }

    }
    //封装传输的信息并提交
    function loadUser() {
      var obj = {};
      obj.token=token;
      obj.type=type;
      obj.id=id;
      validate.validate_submit3(action_url, obj, insertMessage);
    }
      function insertMessage(){
          var types = global_data.result.type;
          var create_time = global_data.result.create_time;
          var pay_type = global_data.result.pay_type;
          var pay_status = global_data.result.pay_status;
          var pay_account = global_data.result.pay_account;
          var cash = global_data.result.cash;


          if(pay_type==0){
              pay_type="支付宝";
          }else{
              pay_type="微信";
          }
          if(pay_status==0){
              pay_status="申请处理中";
          }else{
              pay_status="已完成";
          }
        if(types==1){
            //推广
            var trade_no = global_data.result.trade_no;
            $('.account_type_title').text("推广");
            $('.account_type_time').text(create_time);
            $('.account_type_number').text(trade_no);
            $('.account_type_income').text(cash);
            $('.account_type_style').text(pay_status);
        }else if (types==3){
            //提现
            $('.account_type_title').text("提现-"+pay_type+"-"+pay_account);
            $('.account_type_time').text(create_time);
            $('.account_type_number').parent().hide();
            $('.account_type_income').text(cash);
            $('.account_type_style').text(pay_status);
        }else if(type==2){
            //拼车
            var trade_no = global_data.result.trade_no;
            $('.account_type_title').text("拼车收入");
            $('.account_type_time').text(create_time);
            $('.account_type_number').text(trade_no);
            $('.account_type_income').text(cash);
            $('.account_type_style').text(pay_status);
        }else{
            var trade_no = global_data.result.trade_no;
            $('.account_type_title').text("拼车支出");
            $('.account_type_time').text(create_time);
            $('.account_type_number').text(trade_no);
            $('.account_type_income').text(cash);
            $('.account_type_style').text(pay_status);
        }
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
    <span class="account_details_text account_type_income" style="font-size: 2.4rem;">0</span>
  </div>
  <div class="account_details_type">
    <div class="account_details_list">
      <span class="account_details_title">类型</span>
      <span class="account_details_text account_type_title"></span>
    </div>
    <div class="account_details_list">
      <span class="account_details_title">时间</span>
      <span class="account_details_text account_type_time"></span>
    </div>
    <div class="account_details_list">
      <span class="account_details_title">交易单号</span>
      <span class="account_details_text account_type_number"></span>
    </div>
    <div class="account_details_list">
      <span class="account_details_title">状态</span>
      <span class="account_details_text account_type_style"></span>
    </div>
  </div>
</div>

</body>
</html>

