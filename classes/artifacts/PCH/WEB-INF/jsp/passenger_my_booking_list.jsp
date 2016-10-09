<%--
  Created by IntelliJ IDEA.
  User: zhu
  Date: 2016/7/25
  Time: 15:06
  describtion:移动端--乘客预约车主信息
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
  <title>来回拼车-乘客出行订单-微信</title>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="/resource/js/style.js" type="text/javascript"></script>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">

  <link href="/resource/css/dialog.css" rel="stylesheet" type="text/css">
  <link href="/resource/css/mobile-select-area.css" rel="stylesheet" type="text/css">

  <script src="/resource/js/dialog.js" type="text/javascript"></script>
  <script src="/resource/js/mobile-select-area.js" type="text/javascript"></script>
  <script src="/resource/js/zepto.js" type="text/javascript"></script>
  <style type="text/css">

    .mine_top {
      text-align: center;
      line-height: 4.2rem;
      font-size: 1.8rem;
      font-weight: bold;
      border-bottom: 1px solid #e8e8e8;
      padding: 0 1rem;
      background-color: #F5AD4E;
      color: #FFF;
    }

    .mine_mid_first {
      font-size: 1.4rem;
      background-color: #fff;
      line-height: 2.4rem;
      padding: .4rem 1.4rem;
      display: none;
      margin-bottom: 1.2rem;
    }

    .mine_mid {
      font-size: 1.4rem;
      background-color: #fff;
      line-height: 2.4rem;
      margin-bottom: 5rem;
      padding: .4rem 1.4rem;
      display: none;
    }

    .return_perv {
      float: left;
    }

    .return_perv_img {
      width: 1.6rem;
      display: inline-block;
      top: 1.2rem;
      left: 1.4rem;
      position: absolute;
    }

    ::-webkit-input-placeholder {
      /* WebKit browsers */
      color: #999;
    }

    :-moz-placeholder {
      /* Mozilla Firefox 4 to 18 */
      color: #999;
    }

    ::-moz-placeholder {
      /* Mozilla Firefox 19+ */
      color: #999;
    }

    :-ms-input-placeholder {
      /* Internet Explorer 10+ */
      color: #999;
    }

    .float_sure {
      color: #2ecc71;
    }

    .slide_mid_ul_yes {
      float: left;
      width: 40%;
      margin-right: 8%;
    }

    .tag_right {
      width: 40%;
      float: left;
    }

    .slide_mid_ul_no, .slide_mid_ul_yes {
      max-height: 30rem;
      overflow: auto;
    }

    @media screen and (max-width: 2000px) {
      body {
        max-width: 1080px;
        transform: translateZ(0);
        -webkit-transform: translateZ(0);
      }

    }

    @media screen and (max-width: 1080px) {
      body {
        max-width: 1080px;
        transform: none;
        -webkit-transform: none;
      }

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

    .departure_li_style {
      padding-left: 2rem;
      line-height: 2.2rem;
    }

    .departure_time_mouth {
      display: inline-block;
      color: #999794;
      margin-right: 1rem;
      margin-left: .4rem;
    }

    .departure_li_status {
      padding: .2rem .4rem;
      border-radius: 3px;
      color: #999;
    }

    .mine_top_icon {
      width: 1.5rem;
      position: relative;
      top: .2rem;
    }

    .mine_first_top_left {
      float: left;
    }

    .mine_first_top_right {
      float: right;
      color: #2ecc71;
    }

    .departure_time_seat {
      display: inline-block;
      float: right;
      color: #F5AD4E;
    }

    .departure_li_style_img {
      width: 1.8rem;
      position: relative;
      top: .45rem;
      margin-right: .2rem;
    }

    .departure_route_left {
      float: left;
      display: block;
    }

    .departure_route {
      float: left;
      width: 79%;
      display: block;
      color: #999794;
      margin-left: .4rem;
    }

    .mine_type {
      display: inline-block;
      float: right;
      padding: .2rem .6rem;
      background-color: #F5AD4E;
      color: #fff;
      border-radius: 5px;
      margin-top: .4rem;
      font-size: 1.3rem;
    }

    .mine_first_bottom {
      padding-bottom: .4rem;
      padding-top: .4rem;
    }

    .mine_delete {
      margin-right: 1.4rem;
      background-color: #e74c3c;
      color: #fff;
      border: none;
    }
    .mine_cancel {
      margin-right: 1.4rem;
      background-color: #3498db;
      color: #fff;
      border: none;
    }

    .mine_list_title {
      position: relative;
      border-bottom: 1px solid #e8e8e8;
      padding-bottom: .4rem;
    }

    .mine_list_title img {
      width: 1.8rem;
      position: relative;
      top: .4rem;
    }

    .mine_list, .mine_first_list {
      border-top: 1px dashed #e8e8e8;
      padding: .8rem 0;
      margin-top: -1px;
    }

    .end_color {
      color: #999794;
    }

    .not_message {
      display: none;
      width: 100%;
      text-align: center;
      margin-top: 50%;
      margin-bottom: 6rem;
      font-size: 2rem;
    }

    .float_container2 {
      width: 62%;
    }

    .float_message_title2 {
      margin-top: 1rem;
    }

    .float_message_tips {
      color: #999;
      margin-left: 2rem;
      margin-top: 1rem;
    }

    .float_sure {
      color: #e74c3c;
    }

    .mine_made {
      margin-right: 1.4rem;
      background-color: #3498db;
      color: #fff;
      border: none;
    }

    .input_list {
      padding: .2rem;
    }

    .input_list_left {
      float: left;
    }

    .input_list_right {
      float: left;
      width: 22rem;
    }
    .float_button_tips{
      color: #999;
      display: inline-block;
      float: left;
      font-size: 1rem;
      margin-top: .6rem;
    }
    .departure_li_type{
      color: #999;
      font-size: 1.2rem;
    }
    .begin_city , .end_city{
      font-size: 1.2rem;
    }
    .find_href_span{
      word-wrap: break-word;
    }
    .departure_mobile{
      display: block;
      position: relative;
    }
    .mobile_style{
      width: 2rem;
      float: right;
      position: absolute;
      right: 2rem
    }
  </style>
  <link href="/resource/css/auto.css" rel="stylesheet" type="text/css">
  <script>
    $(document).ready(function () {
      changeFontSize();
      loadMessage();
      $('.hover').click(function(){
        removeFloatMessage();
      })
    });

    var user_id = 86;
    var page_list = 0;
    var size = 20;
    var total;
    var index_id;
    var order_id;
    var mobile1;
    function returnCheck() {
      window.location.href = '/auth/base';
    }
    function loadMessage() {
      $('.mine_first_list').remove();
      $('.mine_list').remove();
      var obj = {};
      obj.action = 'show_myself';
      obj.page = page_list;
      obj.size = size;
      obj.user_id = user_id;
      validate.validate_submit("/api/db/passenger/departure", obj, sendPageMessage);
    }

    function sendPageMessage() {
      total = global_data.result.total;
      if (global_data.result.data.length == 0) {
        $('.not_message').css('display', 'inline-block');
        $('.mine_mid_first').hide();
        $('.mine_mid').hide();
      } else {
        $('.mine_mid_first').show();
        $('.mine_mid').show();
        insertMessage();
        $('.not_message').css('display', 'none');
      }
    }
    //添加用户数据
    function insertMessage() {
      for (var i = 0; i < global_data.result.data.length; i++) {
        var id = global_data.result.data[i].driver_order_id;//id
        if(id==0){
          var inits_seats = global_data.result.data[i].order.booking_seats;//可用座位
          var boarding_point = global_data.result.data[i].order.boarding_point;//id
          var breakout_point = global_data.result.data[i].order.breakout_point;//id
          var order_id = global_data.result.data[i].order.order_id;//id
        }else{
          var start_time = global_data.result.data[i].start_time;//开始时间
          var end_time = global_data.result.data[i].end_time;//结束时间
          var departure_city = global_data.result.data[i].departure_city;//出发城市
          var destination_city = global_data.result.data[i].destination_city;//目的城市
          var departure = global_data.result.data[i].departure;//出发小城
          var destination = global_data.result.data[i].destination;//目的小城市
          var description = global_data.result.data[i].description;//描述信息
          var create_time = global_data.result.data[i].create_time;//id
          var mobile = global_data.result.data[i].mobile;//id
          var driving_name = global_data.result.data[i].driving_name;//id
          var is_cannel = global_data.result.data[i].is_editor;//id
          var inits_seats = global_data.result.data[i].order.booking_seats;//可用座位
          var boarding_point = global_data.result.data[i].order.boarding_point;//id
          var breakout_point = global_data.result.data[i].order.breakout_point;//id
          var order_id = global_data.result.data[i].order.order_id;//id
          var insert_time = start_time.substring(0, 10);
          var time_change = insert_time.split('-');
          insert_time = time_change[1] + '月' + time_change[2] + '日';

          var begin_create_time = create_time.substring(11, 16);
          create_time = create_time.substring(0, 10);
          var time_create = create_time.split('-');
          create_time = time_create[1] + '月' + time_create[2] + '日';


          var begin_start_time = start_time.substring(11, 16);
          var begin_end_time = end_time.substring(11, 16);

          if(destination_city == ""){
            destination_city = "郑州"
          }
        }
        var is_editor=true;
        var info_status = id ;



        if (is_editor == true) {
          if(info_status==0){

            info_status="已失效";
            addDisplayLose(id,inits_seats,boarding_point,breakout_point,order_id,info_status );
          }else{
            info_status="";
            addDisplay(order_id,driving_name,description,i, create_time, begin_create_time, begin_end_time, begin_start_time, info_status, insert_time, departure_city, destination_city, departure, destination,
                    inits_seats, id,boarding_point,breakout_point,mobile);
          }

        } else {
          addHistoryDisplay(order_id,driving_name,description,i, create_time, begin_create_time, begin_end_time, begin_start_time, info_status, insert_time, departure_city, destination_city, departure, destination,
                  inits_seats, id,boarding_point,breakout_point,mobile);
        }

        if (departure == "") {

          $($('.begin_city')[(page_list * size) + i]).hide();
        }
        if (driving_name == "") {
          $($('.departure_li_name')[(page_list * size) + i]).hide();
        }
        if (destination == "") {
          $($('.end_city')[(page_list * size) + i]).hide();
        }
        if (is_cannel == false) {
          $($('.mine_cancel')[(page_list * size) + i]).hide();
        }
        if (description == "") {
          $($('.departure_li_car_type')[(page_list*size)+i]).hide();
        }
        if (id == 0) {
          $($('.mine_looking')[(page_list*size)+i]).hide();
//          $($('.mine_delete')[(page_list*size)+i]).css('margin-right','0');
          $($('.departure_time_seat')[(page_list*size)+i]).css('float','inherit');
        }
      }
      if ($('.mine_list').length == 0) {
        $('.mine_mid').hide();
      }
      if ($('.mine_first_list').length == 0) {
        $('.mine_mid_first').hide();
      }
    }

    function addDisplay(order_id,driving_name,description,i, create_time, begin_create_time, begin_end_time, begin_start_time, info_status, insert_time, departure_city, destination_city, departure, destination,
                        inits_seats, id,boarding_point,breakout_point,mobile) {
      $('.first_clear').before('<li class="mine_first_list" index=' + id + ' order_id='+order_id+'>' +
              '<div class="mine_first_top">' +
              '<div class="mine_first_top_left">' +
              '<img src="/resource/images/pc_icon_stratRoute.png" class="mine_top_icon">' +
              '<span>' + departure_city + '</span><span class="begin_city" style="color:#999794"><i class="circle"></i>' + departure + '</span>' +
              '<span>——</span>' +
              '<span>' + destination_city + '</span><span class="end_city" style="color:#999794"><i class="circle"></i>' + destination + '</span>' +
              '</div>' +
              '<div class="mine_first_top_right">' +
              '<span class="departure_li_status">' + info_status + '</span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
              '<div class="mine_first_mid">' +
              '<div class="departure_li_style departure_li_time">' +
              '<span>上车地点</span>' +
              '<span class="departure_time_mouth">' + boarding_point + '</span>' +

              '</div>' +
              '<div class="departure_li_style departure_li_time">' +
              '<span>下车地点</span>' +
              '<span class="departure_time_mouth">' + breakout_point + '</span>' +

              '</div>' +
              '<div class="departure_li_style departure_li_time">' +
              '<span>出行时间</span>' +
              '<span class="departure_time_mouth">' + insert_time + '</span>' +
              '<span style="color: #999794">' + begin_start_time + '-' + begin_end_time + '</span>' +
              '<span class="departure_time_seat">订座' + inits_seats + '&nbsp;个</span>' +
              '</div>' +
              '<div class="departure_li_style departure_li_name">' +
              '<span>车主姓名</span>' +
              '<span class="departure_time_mouth">' + driving_name + '</span>' +

              '</div>' +
              '<a href="tel:'+mobile+'" class="departure_li_style departure_mobile">' +
              '<span>车主电话</span>' +
              '<span class="departure_time_mouth departure_li_mobile">' + mobile + '</span>' +
              '<img src="/resource/images/pc_icon_mobile.png" class="mobile_style">'+
              '</a>'+
              '<div class="departure_li_style departure_li_car_type">' +
              '<img src="/resource/images/pc_icon_beihzu.png" class="departure_li_style_img">' +
              '<span class="departure_li_type">'+description+'</span>' +
              '</div>' +
              '</div>' +

              '<div class="mine_first_bottom">' +
//                    '<span class="mine_type mine_change" onclick="mine_change(this)">修改订单</span>' +
              '<span class="mine_type mine_looking" onclick="looking_change(this)">查看订单</span>' +
              '<span class="mine_type mine_cancel" onclick="showCancelFloatStyle(this)">取消预定</span>' +
//              '<span class="mine_type mine_delete" onclick="showDeleteFloatStyle(this)">删除订单</span>' +

//              '<span class="mine_type mine_made" onclick="mine_made(this)" index=' + i + '>生成文字信息</span>' +
              '<div class="clear"></div>' +
              '</div>' +
              '</li> ')
    }
    //已失效
    function addDisplayLose(id,inits_seats,boarding_point,breakout_point,order_id,info_status) {
      $('.first_clear').before('<li class="mine_first_list" index=' + id + ' order_id='+order_id+'>' +
              '<div class="mine_first_top">' +
              '<div class="mine_first_top_right">' +
              '<span class="departure_li_status">' + info_status + '</span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
              '<div class="mine_first_mid">' +
              '<div class="departure_li_style departure_li_time">' +
              '<span>上车地点</span>' +
              '<span class="departure_time_mouth">' + boarding_point + '</span>' +

              '</div>' +
              '<div class="departure_li_style departure_li_time">' +
              '<span>下车地点</span>' +
              '<span class="departure_time_mouth">' + breakout_point + '</span>' +

              '</div>' +
              '<div class="departure_li_style departure_li_time">' +
              '<span class="departure_time_seat">订座' + inits_seats + '&nbsp;个</span>' +
              '</div>' +
              '</div>' +
              '<div class="mine_first_bottom">' +
              '<span class="mine_type mine_looking" onclick="looking_change(this)">查看订单</span>' +
              '<span class="mine_type mine_cancel" onclick="showCancelFloatStyle(this)">取消预定</span>' +
//              '<span class="mine_type mine_delete" onclick="showDeleteFloatStyle(this)">删除订单</span>' +

              '<div class="clear"></div>' +
              '</div>' +
              '</li> ')
    }
    //历史
    function addHistoryDisplay(order_id,driving_name,description,i, create_time, begin_create_time, begin_end_time, begin_start_time, info_status, insert_time, departure_city, destination_city, departure, destination,
                               inits_seats, id,boarding_point,breakout_point,mobile) {
      $('.history_clear').before('<li class="mine_list" index=' + id + '>' +
              '<div class="mine_first_top">' +
              '<div class="mine_first_top_left">' +
              '<img src="/resource/images/pc_icon_stratRoute.png" class="mine_top_icon">' +
              '<span>' + departure_city + '</span><span class="begin_city" style="color:#999794"><i class="circle"></i>' + departure + '</span>' +
              '<span>——</span>' +
              '<span>' + destination_city + '</span><span class="end_city" style="color:#999794"><i class="circle"></i>' + destination + '</span>' +
              '</div>' +
              '<div class="mine_first_top_right end_color">' +
              '<span>已完成</span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
//              '<div class="mine_first_mid" onclick="toDetaile(this)">' +
              '<div class="mine_first_mid">' +
              '<div class="departure_li_style departure_li_time">' +
              '<span>出行时间</span>' +
              '<span class="departure_time_mouth">' + insert_time + '</span>' +
              '<span style="color: #999794">' + begin_start_time + '-' + begin_end_time + '</span>' +
              '</div>' +
              '<div class="departure_li_style departure_li_time">' +
              '<span>发布时间</span>' +
              '<span class="departure_time_mouth">' + create_time + '</span>' +
              '<span style="color: #999794">' + begin_create_time + '</span>' +
              '<span class="departure_time_seat">订座' + inits_seats + '&nbsp;个</span>' +
              '</div>' +
              '</div>' +
              '<div class="mine_first_bottom">' +
//              '<span class="mine_type mine_looking" onclick="looking_change(this)">查看订单</span>' +
//              '<span class="mine_type mine_delete" onclick="showDeleteFloatStyle(this)">删除订单</span>' +
//                    '<span class="mine_type mine_made" onclick="mine_made(this)" index=' + i + '>生成文字信息</span>' +
              '<div class="clear"></div>' +
              '</div>' +
              '</li> ')
    }
    //展示浮动层可编辑
    function showDeleteFloatStyle(obj) {
      order_id = $(obj).parent().parent().attr('order_id');
      $('.hover').fadeIn(100);
      $('.float_container2').empty().fadeIn(100).css({'width': '62%', 'font-size': '1.4rem'});
      $('.float_container2').append('<div class="float_box2">' +
              '<div class="float_message_box2">' +
              '<div class="float_message_title2">' +
              '<span>确认删除？</span>' +
              '</div>' +
              '<div class="float_message_tips">' +
              '<span>删除后将不再出现在发车列表中</span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
              '</div>' +
              '<div class="float_button">' +
              '<span class="float_remove" onclick="removeFloatMessage()">取消</span>' +
              '<span class="float_sure" onclick="mine_delete()">确定</span>' +
              '</div>');

    }
    //展示浮动层可编辑
    function showCancelFloatStyle(obj) {
      order_id = $(obj).parent().parent().attr('order_id');
      mobile1 = $(obj).parent().parent().find('.departure_li_mobile').text();
      $('.hover').fadeIn(100);
      $('.float_container2').empty().fadeIn(100).css({'width': '62%', 'font-size': '1.4rem'});
      $('.float_container2').append('<div class="float_box2">' +
              '<div class="float_message_box2">' +
              '<div class="float_message_title2">' +
              '<span>确认取消预定？</span>' +
              '</div>' +
              '<div class="float_message_tips">' +
              '<span>取消后车主将不再与你预约</span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
              '</div>' +
              '<div class="float_button">' +
              '<span class="float_remove" onclick="removeFloatMessage()">取消</span>' +
              '<span class="float_sure" onclick="mine_cancel()">确定</span>' +
              '</div>');

    }
    function notOpend() {
//      window.location.href="/laihui/driver/create_order"
      showFloatStyle("即将开通，敬请期待");
    }
    //修改车单
    function mine_change(obj) {
      window.location.href = "/laihui/passenger/create_order?id=" + $(obj).parent().parent().attr('index');
    }
    //查看车单
    function looking_change(obj) {
      window.location.href = "/laihui/car/detail?id=" + $(obj).parent().parent().attr('index');
    }
    function toDetaile(obj) {
      window.location.href = "/laihui/car/detail?id=" + $(obj).parent().attr('index');
    }
    //删除车单
    function mine_delete() {
      var obj = {};
      obj.action = 'delete_my_order';
      obj.order_id = order_id;
      obj.user_id = user_id;
      validate.validate_submit("/api/db/passenger/departure", obj, loadMessage);
      removeFloatMessage();
    }
    //取消车单
    function mine_cancel() {
      removeFloatMessage();
      var obj = {};
      obj.action = 'delete_my_order';
      obj.order_id = order_id;
      obj.status = "-1";
      obj.mobile = mobile1;
      validate.validate_submit("/api/db/passenger/departure", obj, loadMessage);
    }
    function toAuthList(){
      window.location.href = "/laihui/passenger/my_order_list";
    }
  </script>
</head>
<body scroll="no">
<div class="hover_all"></div>
<div class="loading_box">
  <img class="loading" src="/resource/images/loading.gif" alt="请等待">
</div>
<div class="hover"></div>
<div class="float_container2">

</div>
<div class="float_container">
  <div class="float_box">
    <span class="float_box_span"></span>
  </div>
</div>
<div class="mine_container">
  <div class="mine_top">
    <div class="return_perv">
      <img class="return_perv_img" alt="" src="/resource/images/pc_icon_white_return.png" onclick="returnCheck()">
    </div>
    <span>我的订座信息</span>
  </div>
  <div class="mine_message">
    <ul class="mine_mid_first">
      <div class="mine_list_title">
        <img src="/resource/images/pc_icon_time.png">
        <span>预约信息</span>
      </div>
      <div class="clear first_clear"></div>
    </ul>
    <ul class="mine_mid" style="display:none">
      <div class="mine_list_title">
        <img src="/resource/images/pch_icon_history.png">
        <span>历史预约信息</span>
      </div>

      <div class="clear history_clear"></div>
    </ul>
    <span class="not_message">暂无预定信息</span>
  </div>
  <%--底部--%>
  <div class="bottom_menu " onclick="changeMenu(this)">
    <img src="/resource/images/pch_icon_toright.png" class="menu_style_icon menu_style_active">
  </div>
  <div class="message_bottom">
    <div class="message_bottom_type" onclick="toList()">
      <div class="img_box">
        <img src="/resource/images/pch_icon_menu_car.png" class="icon_style icon_car">
      </div>
      <span>找车</span>
    </div>
    <div class="message_bottom_type" onclick="toAuthList()">
      <div class="img_box">
        <img src="/resource/images/pch_icon_menu_people.png" class="icon_style icon_people">
      </div>
      <span>找人</span>
    </div>
    <div class="message_bottom_type menu_active" onclick="toMine()">
      <div class="img_box">
        <img src="/resource/images/pch_icon_menu_me_active.png" class="icon_style icon_mine">
      </div>
      <span>我的</span>
    </div>
  </div>
</div>
<script>
  (function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r;
    i[r] = i[r] || function () {
              (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
    a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
    a.async = 1;
    a.src = g;
    m.parentNode.insertBefore(a, m)
  })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

  ga('create', 'UA-82806911-1', 'auto');
  ga('send', 'pageview');

</script>
</body>
</html>
