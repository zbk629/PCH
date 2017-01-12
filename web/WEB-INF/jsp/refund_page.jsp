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
  <title>申请退款</title>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="/resource/js/style.js" type="text/javascript"></script>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
  <link href="/resource/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <style type="text/css">
    body {
      background-color: #F9F9F9;
      font-size: 1.8rem;
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
    .refund_type_select{
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
      font-size: 1.8rem;
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
      padding-right: 1rem;
      background: #fff;
      margin-top: 1.6rem;
      padding-top: .3rem;
      display: none;
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
      width: 1.8rem;
      position: absolute;
      right: 1.5rem;
      top: 1.6rem;
      display: none;
    }

    .cash_middle_tips {
      line-height: 5rem;
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
      margin-top: 4rem;
      margin-bottom: 3rem;
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
    .cash_input_box_textarea{
      height: 9rem;
      font-size: 1.8rem;
      width: 100%;
      resize:none;
      border: none;
    }
    .cash_input_box_textarea:focus{
      outline:none;
    }
    .refund_money{
      background-color: #fff;
      text-align: center;
      padding: 1.4rem 0;
    }
    .refund_money span{
      display: block;
    }
    .refund_money_cont{
      font-size: 3.2rem;
      font-weight: bold;
    }
    .refund_money_title{
      margin-bottom: .6rem;
      font-size: 1.6rem;
    }
    .refund_money_tips{
      font-size: 1.6rem;
      color: #a5a5a5;
    }
    .refund_source{
      background-color: #fff;
      padding-left: 1.4rem;
    }
    .refund_source_li{
      line-height: 4.6rem;

      border-bottom: 1px solid #f6f6f6;
    }
    .refund_source_li:last-child{
      border:none;
    }
  </style>
  <script>
    $(document).ready(function () {
      changeFontSize();
//      android_get_token();

      $('.balance').text(current_cash);
    });
    var change = 0;

    var token = window.location.href.split('?token=')[1].split('&current_cash=')[0];
    var current_cash = window.location.href.split('&current_cash=')[1];
    var pay_account;
    var type = 0;
    var refund_money;
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
      if($(obj).find('.cash_input_user').val()==""){
        errorPay();
      }else{
        if($('.active_refund').length!=0){
          successPay();
        }
      }
    }
    //封装传输的信息并提交
    function upCash() {
      if(!$('.get_cash').hasClass('unbackground_color')){
        pay_account = $('.active_type').find('.cash_input_user').val();
        refund_money = $('.refund_money_cont_span').text();
        if($('.active_refund').hasClass('other_reason')){
          var reason = $('.cash_input_box_textarea').val()
        }else{
          var reason = $('.active_refund').children('span').text();
        }

        var obj = {};
        obj.action = 'add1';
        obj.token = token;
        obj.pay_type =type;
        obj.pay_account =pay_account;
        obj.refund_money =refund_money;
        obj.reason =reason;
        validate.validate_submit3('/pay/account', obj, showSuccess);
      }
    }

    //展示提现过后的界面
    function showSuccess(){
      $('.cash_container').hide();
      $('.refund_money').hide();
      $('.cash_success').show();
      if(type==0){
        $('.success_type').text("支付宝");
      }else{
        $('.success_type').text("微信");
      }
      $('.success_count').text(pay_account);
      $('.success_money').text(refund_money+'元')

    }
    //检测数据的正确性
    function checkPay(){
      if($('.active_type').find('.cash_input_user').val()==""){
        errorPay();
      }else{
        successPay();
      }
    }

    function successPay(){
      $('.get_cash').removeClass("unbackground_color");
    }
    function errorPay(){
      $('.get_cash').addClass("unbackground_color");
    }

    function hrefTo(){
      //重新加载
      window.location.href="/withdraw_cash?token="+token;
    }

    //选择理由
    function selectRefund(obj){
      $('.refund_source_li').removeClass('active_refund');
      $(obj).addClass('active_refund');
      $('.refund_type_select').attr('src','/resource/images/pch_cash_unselect.png');
      $(obj).children('.refund_type_select').attr('src','/resource/images/pch_cash_select.png');
      if($(obj).hasClass('other_reason')){
        $('.cash_middle').show();
      }else{
        $('.cash_middle').hide();
      }
      checkPay();
    }

    function ckeckInput(obj){
      if($(obj).val()==""){
        errorPay();
      }else{
        if($('.active_refund').length!=0){
          successPay();
        }
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
<div class="refund_money">
  <span class="refund_money_cont">￥<span class="refund_money_cont_span" style="display: inline-block">8</span></span>
  <span class="refund_money_title">退款金额</span>
  <span class="refund_money_tips">退款将在2个工作日内退回</span>
</div>
<div class="cash_container">
  <div class="cash_top">
    <div class="cash_top_title">
      选择账户类型
    </div>
    <div class="cash_type">
      <div class="cash_type1 active_type weixin_type" onclick="changePay(this)">
        <div class="cash_top_input">
          <input placeholder="请输入您的微信帐号" type="tel" class="cash_input_user wx" onkeyup="ckeckInput(this)">
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
          <input placeholder="" type="tel" class="cash_input_user zf" onkeyup="ckeckInput(this)">
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
    <div class="cash_top_title">
      选择退款原因
    </div>
    <ul class="refund_source">
      <li class="refund_source_li" onclick="selectRefund(this)">
          <span>等待时间太长</span>
          <img src="/resource/images/pch_cash_unselect.png" class="refund_type_select">
      </li>
      <li class="refund_source_li" onclick="selectRefund(this)">
          <span>临时有事改变行程</span>
          <img src="/resource/images/pch_cash_unselect.png" class="refund_type_select">
      </li>
      <li class="refund_source_li other_reason" onclick="selectRefund(this)">
          <span>其他原因</span>
          <img src="/resource/images/pch_cash_unselect.png" class="refund_type_select">
      </li>
    </ul>
    <div class="cash_middle">
      <div class="cash_middle_input">
        <div class="cash_input_box">
          <textarea placeholder="请输入详细原因，便于了解情况…" class="cash_input_box_textarea"></textarea>
        </div>
      </div>
    </div>
  </div>
  <div class="cash_get">
    <span class="get_cash unbackground_color" onclick="upCash()">提交申请</span>
  </div>
</div>
<div class="cash_success">
  <div class="cash_success_img_box">
    <img src="/resource/images/pch_cash_success.png">
    <div class="cash_success_h1">退款申请已提交</div>
    <div class="cash_success_time">预计到账时间：2个工作日内</div>
  </div>
  <div class="cash_success_detail">
    <div class="cash_success_item">
      <span class="success_item_name success_type">微信</span>
      <span class="success_item_val success_count">18838164316</span>
    </div>
    <div class="cash_success_item">
      <span class="success_item_name">退款金额</span>
      <span class="success_item_val success_money">120.00元</span>
    </div>
  </div>
  <div class="cash_success_get" onclick="hrefTo()">
    <span>完成</span>
  </div>
</div>
</body>
</html>
