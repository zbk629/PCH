<%--
  Created by IntelliJ IDEA.
  User: zhu
  Date: 2016/7/25
  Time: 15:06
  describtion:移动端--车主发布出行信息历史车单
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
  <title>来回拼车-车主发车订单-微信</title>
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
    }

    .mine_delete {
      margin-right: 1.4rem;
      background-color: #e74c3c;
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
    .find_href_span{
      word-wrap: break-word;
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
    var size = 10;
    var total;
    var index_id;
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
      validate.validate_submit("/api/db/departure", obj, sendPageMessage);
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
        var driving_name = global_data.result.data[i].driving_name;//车主姓名
        var info_status = global_data.result.data[i].info_status;//状态信息1：有空位；2：已满；-1：已取消
        var start_time = global_data.result.data[i].start_time;//开始时间
        var end_time = global_data.result.data[i].end_time;//结束时间
        var mobile = global_data.result.data[i].mobile;//手机号
        var departure_city = global_data.result.data[i].departure_city;//出发城市
        var destination_city = global_data.result.data[i].destination_city;//目的城市
        var departure = global_data.result.data[i].departure;//出发小城
        var destination = global_data.result.data[i].destination;//目的小城市
        var description = global_data.result.data[i].description;//描述信息
        var tag_yes_content = global_data.result.data[i].tag_yes_content;//yes标签
        var tag_no_content = global_data.result.data[i].tag_no_content;//no标签
        var points = global_data.result.data[i].points;//地点
        var inits_seats = global_data.result.data[i].inits_seats;//可用座位
        var car_brand = global_data.result.data[i].car_brand;//车辆品牌
        var id = global_data.result.data[i].id;//id
        var is_editor = global_data.result.data[i].is_editor;//id
        var create_time = global_data.result.data[i].create_time;//id
        points = points.replace(/丶/g, " 、");
        if (info_status == 1) {
          info_status = "有空位"
        } else if (info_status == 2) {
          info_status = "已满"
        } else {
          info_status = "已取消"
        }
        var insert_time = start_time.substring(0, 10);
        var time_change = insert_time.split('-');
        insert_time = time_change[1] + '月' + time_change[2] + '日';

        var begin_create_time = create_time.substring(11, 16);
        create_time = create_time.substring(0, 10);
        var time_create = create_time.split('-');
        create_time = time_create[1] + '月' + time_create[2] + '日';


        var begin_start_time = start_time.substring(11, 16);
        var begin_end_time = end_time.substring(11, 16);

        if (is_editor == true) {
          addDisplay(i, create_time, begin_create_time, begin_end_time, begin_start_time, info_status, insert_time, departure_city, destination_city, departure, destination,
                  inits_seats, car_brand, id, points);
        } else {
          addHistoryDisplay(i, create_time, begin_create_time, begin_end_time, begin_start_time, info_status, insert_time, departure_city, destination_city, departure, destination,
                  inits_seats, car_brand, id, points);
        }

        if (info_status == "有空位") {
          $($('.departure_li_status')[(page_list * size) + i]).css('color', '#2ecc71');
        } else if (info_status == "已满") {
          $($('.departure_li_status')[(page_list * size) + i]).css('color', '#e74c3c');
        } else {
          $($('.departure_li_status')[(page_list * size) + i]).css('color', '#ecf0f1');
        }
        if (car_brand == "") {
          $($('.departure_li_car_type')[(page_list * size) + i]).hide();
        }
        if (departure == "") {

          $($('.begin_city')[(page_list * size) + i]).hide();
        }
        if (destination == "") {
          $($('.end_city')[(page_list * size) + i]).hide();
        }
        if (points == "") {
          $($('.departure_li_route')[(page_list * size) + i]).hide();
        }
        ;

      }
      if ($('.mine_list').length == 0) {
        $('.mine_mid').hide();
      }
      if ($('.mine_first_list').length == 0) {
        $('.mine_mid_first').hide();
      }
    }

    function addDisplay(i, create_time, begin_create_time, begin_end_time, begin_start_time, info_status, insert_time,
                        departure_city, destination_city, departure, destination, inits_seats, car_brand, id, points) {
      $('.first_clear').before('<li class="mine_first_list" index=' + id + '>' +
              '<div class="mine_first_top" onclick="toDetaile(this)">' +
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
              '<div class="mine_first_mid"  onclick="toDetaile(this)">' +
              '<div class="departure_li_style departure_li_time departure_li_route">' +
              '<span class="departure_route_left">途径路线</span>' +
              '<span class="departure_route">' + points + '</span>' +
              '</div>' +
              '<div class="departure_li_style departure_li_time">' +
              '<span>出行时间</span>' +
              '<span class="departure_time_mouth">' + insert_time + '</span>' +
              '<span style="color: #999794">' + begin_start_time + '-' + begin_end_time + '</span>' +
              '</div>' +
              '<div class="departure_li_style departure_li_time">' +
              '<span>发布时间</span>' +
              '<span class="departure_time_mouth">' + create_time + '</span>' +
              '<span style="color: #999794">' + begin_create_time + '</span>' +
              '<span class="departure_time_seat">' + inits_seats + '&nbsp;个座位</span>' +
              '</div>' +
              '<div class="departure_li_style departure_li_car_type">' +
              '<img src="/resource/images/pc_icon_car.png" class="departure_li_style_img">' +
              '<span class="departure_li_type">' + car_brand + '</span>' +
              '</div>' +
              '</div>' +
              '<div class="mine_first_bottom">' +

              '<span class="mine_type mine_change" onclick="mine_change(this)">修改车单</span>' +
              '<span class="mine_type mine_delete" onclick="showDeleteFloatStyle(this)">删除车单</span>' +
              '<span class="mine_type mine_made" onclick="mine_made(this)" index=' + i + '>生成文字信息</span>' +
              '<div class="clear"></div>' +
              '</div>' +
              '</li> ')
    }

    function addHistoryDisplay(i, create_time, begin_create_time, begin_end_time, begin_start_time, info_status, insert_time,
                               departure_city, destination_city, departure, destination, inits_seats, car_brand, id, points) {
      $('.history_clear').before('<li class="mine_list" index=' + id + '>' +
              '<div class="mine_first_top"  onclick="toDetaile(this)">' +
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
              '<div class="mine_first_mid" onclick="toDetaile(this)">' +
              '<div class="departure_li_style departure_li_time">' +
              '<span>出行时间</span>' +
              '<span class="departure_time_mouth">' + insert_time + '</span>' +
              '<span style="color: #999794">' + begin_start_time + '-' + begin_end_time + '</span>' +
              '</div>' +
              '<div class="departure_li_style departure_li_time">' +
              '<span>发布时间</span>' +
              '<span class="departure_time_mouth">' + create_time + '</span>' +
              '<span style="color: #999794">' + begin_create_time + '</span>' +
              '<span class="departure_time_seat">' + inits_seats + '&nbsp;个座位</span>' +
              '</div>' +
              '<div class="departure_li_style departure_li_car_type">' +
              '<img src="/resource/images/pc_icon_car.png" class="departure_li_style_img">' +
              '<span class="departure_li_type">' + car_brand + '</span>' +
              '</div>' +
              '</div>' +
              '<div class="mine_first_bottom">' +
              '<span class="mine_type mine_looking" onclick="looking_change(this)">查看车单</span>' +
              '<span class="mine_type mine_delete" onclick="showDeleteFloatStyle(this)">删除车单</span>' +
//                    '<span class="mine_type mine_made" onclick="mine_made(this)" index=' + i + '>生成文字信息</span>' +
              '<div class="clear"></div>' +
              '</div>' +
              '</li> ')
    }
    //生成文字信息
    function mine_made(obj) {
      var index = $(obj).attr('index');
      mine_made_style();
      var driving_name = global_data.result.data[index].driving_name;//车主姓名
      var start_time = global_data.result.data[index].start_time;//开始时间
      var end_time = global_data.result.data[index].end_time;//结束时间
      var mobile = global_data.result.data[index].mobile;//手机号
      var departure_city = global_data.result.data[index].departure_city;//出发城市
      var destination_city = global_data.result.data[index].destination_city;//目的城市
      var departure = global_data.result.data[index].departure;//出发小城
      var destination = global_data.result.data[index].destination;//目的小城市
      var description = global_data.result.data[index].description;//描述信息
      var tag_yes_content = global_data.result.data[index].tag_yes_content;//yes标签
      var tag_no_content = global_data.result.data[index].tag_no_content;//no标签
      var points = global_data.result.data[index].points;//地点
      var inits_seats = global_data.result.data[index].inits_seats;//可用座位
      var car_brand = global_data.result.data[index].car_brand;//车辆品牌
      var id = global_data.result.data[index].id;//id
      points = points.replace(/丶/g, " 、");
      tag_yes_content = tag_yes_content.replace(/丶/g, " 、");
      tag_no_content = tag_no_content.replace(/丶/g, " 、");
      var insert_time = start_time.substring(0, 10);
      var time_change = insert_time.split('-');
      insert_time = time_change[1] + '月' + time_change[2] + '日';
      var begin_start_time = start_time.substring(11, 16);
      var begin_end_time = end_time.substring(11, 16);

      insert_time = insert_time+" "+begin_start_time+"~"+begin_end_time;

      var text_tags;
      if (tag_yes_content == "" && tag_no_content == "") {
        text_tags = ""
      } else {
        if (tag_no_content == "") {
          text_tags = tag_yes_content;
        } else if (tag_yes_content == "") {
          text_tags = tag_no_content;
        } else {
          text_tags = tag_no_content + "、" + tag_yes_content;
        }
      }
      if (description == "") {
        text_tags = text_tags + description;
      } else {
        text_tags = text_tags + "、" + description;
      }

      if (departure != "") {
        departure = "(" + departure + ")";
      }
      if (destination != "") {
        destination = "(" + destination + ")";
      }

      $('.slide_container').animate({"top": "22%", "opacity": "1"}, 300);
      $('.find_city_span').text(departure_city + departure + "至"  + destination_city+destination);
      $('.find_time_span').text(insert_time);
      $('.find_route_span').text(points);
      $('.find_seat_span').text(inits_seats);
      $('.find_type_span').text(car_brand);
//            $('.find_tell_span').text(mobile);
      $('.find_discript_span').append(text_tags);
      $('.find_href_span').text("http://pinchenet.com/laihui/car/detail?id=" + id);

      if ($('.find_route_span').text() == "" || $('.find_route_span').text() == "、") {
        $('.find_route').remove()
      }
      if ($('.find_type_span').text() == "") {
        $('.find_type').remove()
      }
      if ($('.find_discript_span').text() == "") {
        $('.find_discript').remove()
      }


    }
    function mine_made_style() {
      $('.hover').fadeIn(100);
      $('.float_container2').fadeIn(100).css({'width': '88%', 'font-size': '1.3rem'});
      $('.float_container2').empty().append('<span style="display: inline-block;padding: .2rem;">【来回拼车】牵起你生活中的每一次来回</span>' +
              '<div class="input_list find_city">' +
              '<div class="input_list_left">' +
              '<span>【找人】</span>' +
              '</div>' +
              '<div class="input_list_right">' +
              '<span class="find_city_span"></span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
              '<div class="input_list find_time">' +
              '<div class="input_list_left">' +
              '<span>【时间】</span>' +
              '</div>' +
              '<div class="input_list_right">' +
              '<span class="find_time_span"></span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
              '<div class="input_list find_route">' +
              '<div class="input_list_left">' +
              '<span>【路线】</span>' +
              '</div>' +
              '<div class="input_list_right">' +
              '<span class="find_route_span"></span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
              '<div class="input_list find_seat">' +
              '<div class="input_list_left">' +
              '<span>【空位】</span>' +
              '</div>' +
              '<div class="input_list_right">' +
              '<span class="find_seat_span"></span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
              '<div class="input_list find_type">' +
              '<div class="input_list_left">' +
              '<span>【车型】</span>' +
              '</div>' +
              '<div class="input_list_right">' +
              '<span class="find_type_span"></span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
              '<div class="input_list find_tell">' +
              '<div class="input_list_left">' +
              '<span>【电话】</span>' +
              '</div>' +
              '<div class="input_list_right">' +
              '<span class="find_tell_span">点击下面链接查看详情</span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
              '<div class="input_list find_discript">' +
              '<div class="input_list_left">' +
              '<span>【备注】</span>' +
              '</div>' +
              '<div class="input_list_right">' +
              '<span class="find_discript_span"></span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
              '<div class="input_list find_href">' +
              '<div class="input_list_left">' +
              '<span>【链接】</span>' +
              '</div>' +
              '<div class="input_list_right">' +
              '<span class="find_href_span"></span>' +
              '</div>' +
              '<div class="clear"></div>' +
              '</div>' +
              '<div class="float_button">' +
              '<span class="float_button_tips" style="color: #999">手指长按内容复制</span>'+
              '<span class="float_remove" style="color: #e74c3c" onclick="removeFloatMessage()">关闭</span>' +
              '<div class="clear"></div>'+
              '</div>'
      )
    }
    //展示浮动层可编辑
    function showDeleteFloatStyle(obj) {
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
      index_id = $(obj).parent().parent().attr('index');
    }
    function notOpend() {
//      window.location.href="/laihui/driver/create_order"
      showFloatStyle("即将开通，敬请期待");
    }
    //修改车单
    function mine_change(obj) {
      window.location.href = "/laihui/driver/create_order?id=" + $(obj).parent().parent().attr('index');
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
      obj.action = 'delete';
      obj.id = index_id;
      obj.user_id = user_id;
      validate.validate_submit("/api/db/departure", obj, loadMessage);
      removeFloatMessage();
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
    <span>我的车单</span>
  </div>
  <div class="mine_message">
    <ul class="mine_mid_first">
      <div class="mine_list_title">
        <img src="/resource/images/pc_icon_time.png">
        <span>进行中车单</span>
      </div>
      <div class="clear first_clear"></div>
    </ul>
    <ul class="mine_mid">
      <div class="mine_list_title">
        <img src="/resource/images/pch_icon_history.png">
        <span>历史车单</span>
      </div>

      <div class="clear history_clear"></div>
    </ul>
    <span class="not_message">暂无发布信息</span>
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
    <div class="message_bottom_type" onclick="toPassengerList()">
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
