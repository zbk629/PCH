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
    .account_list_more,.account_list_more2{
      text-align: center;
      margin: 2rem;
    }
    .account_list_more span{
      color: #A5A5A5;
      display: inline-block;
    }
    .account_list_more2{
      margin-top: 10rem;
      display: none;
    }
    .account_list_more2 span{
      color: #A5A5A5;
      display: inline-block;
    }
    .account_list_more{
      display: none;
    }
  </style>
  <script>
    $(document).ready(function () {
      changeFontSize();
      android_get_token();
        if(data_type==1){
            $('.account_nav_li').removeClass('account_nav_li_active');
            $('.cash_get').addClass('account_nav_li_active');
        }else if(data_type==3){
            $('.account_nav_li').removeClass('account_nav_li_active');
            $('.cash_money').addClass('account_nav_li_active');

        }else{

        }
    });
    var action_url = "/pay/list";
    var change_type = 0;
    var token = window.location.href.split('?token=')[1].split('&data_type=')[0];
    var data_type = window.location.href.split('&data_type=')[1];
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
      obj.type=data_type;
      validate.validate_submit3(action_url, obj, insertMessage);
    }

    function insertMessage(){
        //type(1:推广，3：提现)
      if(global_data.result.data.length==0){
        $('.account_list_more2').show();
      }else{
        $('.account_list_more2').hide();
        for(var i =0;i<global_data.result.data.length;i++){
          var global_type = global_data.result.data[i].type;
          var time =global_data.result.data[i].create_time;
          var cash =global_data.result.data[i].cash;
          var id =global_data.result.data[i].id;
          if(global_type==1){
            spreadStyle(time,cash,id)
          }else if(global_type==3){
            withdrawStyle(time,cash,id)
          }else if(global_type==2){
              //司机
            carpoolingStyle(time,cash,id)
          }else{
              //乘客
            userStyle(time,cash,id)
          }

        }
      }

    }
//    推广
    function spreadStyle(time,cash,id){
      $('.account_list_more').before('<li class="account_list_li" onclick="href_to_detail(this)" data_id='+id+' data_type="1">'+
              '<div class="account_list_li_left">'+
              '<div class="account_list_type"> 推广 </div>'+
              '<div class="account_list_time">'+time+'</div>'+
              '</div>'+
              '<div class="account_list_li_right up_style">+'+cash+'</div>'+
              '<div class="clear"></div>'+
              '</li>');
    }
    //提现
    function withdrawStyle(time,cash,id){
      $('.account_list_more').before('<li class="account_list_li" onclick="href_to_detail(this)" data_id='+id+' data_type="3">'+
              '<div class="account_list_li_left">'+
              '<div class="account_list_type"> 提现 </div> '+
              '<div class="account_list_time">'+time+'</div>'+
              '</div>'+
              '<div class="account_list_li_right down_style">'+cash+'</div>'+
              '<div class="clear"></div>'+
              '</li>');
    }
    //司机拼车
    function carpoolingStyle(time,cash,id){
      $('.account_list_more').before('<li class="account_list_li" onclick="href_to_detail(this)" data_id='+id+' data_type="2">'+
              '<div class="account_list_li_left">'+
              '<div class="account_list_type"> 拼车<small>(收)</small> </div> '+
              '<div class="account_list_time">'+time+'</div>'+
              '</div>'+
              '<div class="account_list_li_right up_style">+'+cash+ '</div>'+
              '<div class="clear"></div>'+
              '</li>');
    }
    //乘客拼车
    function userStyle(time,cash,id){
        $('.account_list_more').before('<li class="account_list_li" onclick="href_to_detail(this)" data_id='+id+' data_type="4">'+
                '<div class="account_list_li_left">'+
                '<div class="account_list_type"> 拼车<small>(支)</small> </div> '+
                '<div class="account_list_time">'+time+'</div>'+
                '</div>'+
                '<div class="account_list_li_right down_style">'+cash+ '</div>'+
                '<div class="clear"></div>'+
                '</li>');
    }

    //改变数据
    function changeType(obj){
      change_type = $(obj).attr('data_type');
      $('.account_nav_li').removeClass("account_nav_li_active");
      $(obj).addClass("account_nav_li_active");
      $('.account_list_li').remove();
      var obj = {};
      obj.token=token;
      obj.type=change_type;
      validate.validate_submit3(action_url, obj, insertMessage);
    }
    //账户详情
    function href_to_detail(obj){
      window.location.href="/account_detail?token="+token+"&id="+$(obj).attr('data_id')+"&type="+$(obj).attr('data_type');
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
    <li class="account_nav_li account_nav_li_active" data_type="" onclick="changeType(this)">
      全部
    </li>
    <li class="account_nav_li cash_money"  data_type="3" onclick="changeType(this)">
      提现
    </li>
    <li class="account_nav_li cash_get"  data_type="1" onclick="changeType(this)">
      推广
    </li>
    <div class="clear"></div>
  </ul>
  <div class="account_list_box">
    <ul class="account_list_ul">

      <div class="account_list_more2">
        <span>暂无数据</span>
        <div class="clear"></div>
      </div>
      <div class="account_list_more">
        <span>加载更多</span>
        <div class="clear"></div>
      </div>
    </ul>
  </div>
</div>

</body>
</html>

