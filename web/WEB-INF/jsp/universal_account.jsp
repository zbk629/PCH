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
  <title>账单记录</title>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="/resource/js/style.js" type="text/javascript"></script>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
  <link href="/resource/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <style type="text/css">
    body{
      background-color: #F9F9F9;
      font-size: 1.6rem;
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
      margin-bottom: 1rem;
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
      font-size: 1.3rem;
      color: #999;
      margin-top: .2rem;
      margin-bottom: .2rem;
    }
    .account_list_li_right{
      float: right;
      margin-top: .8rem;
      /* font-weight: bold; */
      font-size: 1.6rem;
    }
    .up_style{
      color: #e74c3c;
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
    .success_push_left{
      color: #535353;
      line-height: 3.2rem;
      padding-left: 1rem;
    }
    .last_span{
      text-align: center;
      line-height: 3.2rem;
      color: #999;
      display: none;
    }
    .time_span{
      font-size: 1.2rem;
      color: #888;
      /* padding: 1.2rem; */
      padding: 0rem 2rem .4rem;;
      display: inline-block;
    }
  </style>
  <script>
    $(document).ready(function () {
      changeFontSize();
      android_get_token();
      //分页操
//      // 作
//      $(window).scroll(function () {
//                var Scroll = $(document).scrollTop();
//                var height = $(window).height();
//                var WD = $(document).height();
//                if (Scroll + height == WD) {
//                  if (total < 10) {
//                    page_list = 1;
//                  } else {
//                    if (page_list < Math.ceil(total / size)) {
//                      page_list++;
//                      if (page_list != Math.ceil(total / size)) {
//                        loadUser(page_list);
//                      }
//
//                    } else {
//                      $('.not_more').remove();
//                      $('.last_span').show();
//                    }
//                  }
//
//                }
//              }
//      );
    });
    var action_url = "/pay/list";

    var total;
//    var token = window.location.href.split('?token=')[1].split('&end')[0];
    var token = "cb15c3cf28cb81be4e82e4896da8c4c8";
    var time_span;
    function android_get_token()
    {
      try
      {
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
      obj.action = 'show';
      obj.token = token;
      obj.source = "info";
      obj.type = "1";
      validate.validate_submit3(action_url, obj, insertMessage);
    }

    function insertMessage(){
//     var global_data = {
//        "result":{
//          "data":[
//            {
//              "total":"79.00",
//              "mobile":"188****4316",
//              "id":0,
//              "type":1,
//              "departure_time":"2017年1月21日",
//              "cash":"2.37"
//            },{
//              "total":"79.00",
//              "mobile":"188****4316",
//              "id":0,
//              "type":1,
//              "departure_time":"2017年1月21日",
//              "cash":"2.37"
//            },{
//              "total":"79.00",
//              "mobile":"188****4316",
//              "id":0,
//              "type":1,
//              "departure_time":"2017年1月20日",
//              "cash":"2.37"
//            },{
//              "total":"79.00",
//              "mobile":"188****4316",
//              "id":0,
//              "type":1,
//              "departure_time":"2017年1月20日",
//              "cash":"2.37"
//            },{
//              "total":"79.00",
//              "mobile":"188****4316",
//              "id":0,
//              "type":1,
//              "departure_time":"2017年1月19日",
//              "cash":"2.37"
//            },{
//              "total":"79.00",
//              "mobile":"188****4316",
//              "id":0,
//              "type":1,
//              "departure_time":"2017年1月18日",
//              "cash":"2.37"
//            }
//          ]
//        },
//        "message":"响应成功",
//        "status":true
//      }
      if(global_data.result.data.length==0){
        $('.account_list_more2').show();
      }else{
        $('.account_list_more2').hide();
        for(var i=0;i<global_data.result.data.length;i++){
          var mobile = global_data.result.data[i].mobile;
          var departure_time = global_data.result.data[i].departure_time;
          var money = global_data.result.data[i].total;
          var cash = global_data.result.data[i].cash;
          if(i==0){
            $('.account_list_more').before('<span class="time_span">'+departure_time+'</span>' +
                    '<li class="account_list_li" >'+
                    '<div class="account_list_li_left">'+
                    '<div class="account_list_type">'+mobile+'</div>'+
                    '<div class="account_list_time">'+departure_time+'出行一笔'+money+'的车单</div>'+
                    '</div>'+
                    '<div class="account_list_li_right up_style">+'+cash+'</div>'+
                    '<div class="clear"></div>'+
                    '</li>');
          } else if(global_data.result.data[i].departure_time == global_data.result.data[i-1].departure_time){
              $('.account_list_more').before('<li class="account_list_li" >'+
                      '<div class="account_list_li_left">'+
                      '<div class="account_list_type">'+mobile+'</div>'+
                      '<div class="account_list_time">'+departure_time+'出行一笔'+money+'的车单</div>'+
                      '</div>'+
                      '<div class="account_list_li_right up_style">+'+cash+'</div>'+
                      '<div class="clear"></div>'+
                      '</li>');
            }else{
            $('.account_list_more').before('<span class="time_span">'+departure_time+'</span>' +
                    '<li class="account_list_li" >'+
                    '<div class="account_list_li_left">'+
                    '<div class="account_list_type">'+mobile+'</div>'+
                    '<div class="account_list_time">'+departure_time+'出行一笔'+money+'的车单</div>'+
                    '</div>'+
                    '<div class="account_list_li_right up_style">+'+cash+'</div>'+
                    '<div class="clear"></div>'+
                    '</li>');
          }


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
<div class="float_container">
</div>
<div class="float_container2">
</div>
<div class="account_list_container">
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
      <div class="last_span">---------我也是有底线的---------</div>
    </ul>
  </div>
</div>

</body>
</html>

