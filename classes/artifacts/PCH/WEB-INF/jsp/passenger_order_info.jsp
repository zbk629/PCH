<%--
  Created by IntelliJ IDEA.
  User: zhu
  Date: 2016/7/25
  Time: 15:06
  des：移动端--乘客发布信息详情页面
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <title>来回拼车-拼车信息汇</title>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="/resource/js/style.js" type="text/javascript"></script>
  <link rel="shortcut icon" href="/resource/images/pc_logo.ico"/>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
  <script src="/resource/js/LCalendar.js" type="text/javascript"></script>
  <link href="/resource/css/LCalendar.css" rel="stylesheet" type="text/css">
  <style type="text/css">

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
      width: 1.8rem;
      /* line-height: 9.8rem; */
      display: inline-block;
      top: 1.2rem;
      left: 1.4rem;
      position: absolute;
    }

    .publish_message_driver {
      font-size: 1.4rem;
      background-color: #fff;
      line-height: 2.4rem;
      padding: 1rem 1.4rem;
    }

    .publish_message {
      font-size: 1.4rem;
      background-color: #fff;
      line-height: 2.4rem;
      margin: .8rem 0;
      padding: 1rem 0 0rem 1.4rem;
    }



    .publish_message_driver_title {
      font-size: 1.4rem;
    }

    .publish_message_driver_title img {
      width: 1.4rem;
      position: relative;
      top: .3rem;
    }

    .publish_message_driver_time_img {
      width: 1.4rem;
      position: relative;
      top: .26rem;
    }

    .publish_message_driver_time {
      color: #555;
    }

    .publish_seat {
      float: right;
      color: #F5AD4E;
    }

    .publish_message_li_left {
      float: left;
      color: #999;
      margin-right: 1rem;
    }

    .publish_message_li_right {
      float: left;
      max-width: 84%;
    }

    .publish_message_li {
      border-bottom: 1px solid #e8e8e8;
      padding: .8rem 0;
      position: relative;
    }

    .li_last {
      border: none;
    }

    .mobile {
      width: 2rem;
      float: right;
      position: absolute;
      top: 1rem;
      right: 2rem;
    }

    /*路线样式布局*/
    .line_container {
      width: 100%;
      position: absolute;
      bottom: -15px;
    }

    .line_slide {
      border-bottom: 3px solid #F5AD4E;
      position: relative;
      width: 108%;
      margin: 0px auto;
      bottom: 4px;
      display: inline-block;
    }

    .line_circle {
      width: 10px;
      height: 10px;
      border: 1px solid #F5AD4E;
      border-radius: 50%;
      position: absolute;
      left: 0;
      right: 0;
      margin: 0 auto;
      bottom: 10px;
      background-color: #fff;
    }

    .publish_route_box_li {
      position: relative;
      display: inline-block;
      line-height: 30px;
    }

    .publish_route_box_li_span {
      padding: 0 10px;
    }

    /*路线布局结束*/

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

    .item_yes_tips {
      color: #00b38a;
    }

    .item_no_tips {
      color: #e74c3c;
    }

    .call_driver_bottom {
      color: #fff;
    }
    .change_driver {
      color: #fff;
    }
    .begin_city, .end_city {
      font-size: 1.2rem;
    }
    .footer{
      margin-bottom: 3rem;
    }
    .footer img{
      width: 100%;

    }
    .float_message_title{
      line-height: 3.2rem;
    }
    .float_message_mid{
      line-height: 4rem;
      text-align: center;
    }
    .set_have,.set_full,.set_remove{
      display: inline-block;
      padding: 0 1rem;
      margin-left: 1rem;
      cursor: pointer;

    }
    .set_have{
      margin-left: 0rem;
    }
    .set_active{
      color: #F5AD4E;
    }
    .float_message_mid2{
      display: none;
      padding: 1rem;
      color: #f5ad4e;
      text-indent: 2rem;
      line-height: 2rem;

    }

  </style>
  <link href="/resource/css/auto.css" rel="stylesheet" type="text/css">
  <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  <script>
    wx.config({
      debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
      appId: 'wxc0d2e309454d7e18', // 必填，公众号的唯一标识

      timestamp: '${wx_timestamp}', // 必填，生成签名的时间戳
      nonceStr: '${wx_nonceStr}', // 必填，生成签名的随机串
      signature: '${wx_encryption}',// 必填，签名
      jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage', 'onMenuShareQQ', 'onMenuShareQZone'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });
    wx.ready(function () {
      wx.onMenuShareTimeline({
        title: '${pageTitle}', // 分享标题
        link: '${wx_url}', // 分享链接
        imgUrl: '${imageUrl}', // 分享图标
        success: function () {
          // 用户确认分享后执行的回调函数
        },
        cancel: function () {
          // 用户取消分享后执行的回调函数
        }
      });
      wx.onMenuShareAppMessage({
        title: '${pageTitle}', // 分享标题
        <c:if test="${intro eq null}">
        desc: '${wx_desc}',
        </c:if>                          // 分享描述
        <c:if test="${intro ne null}">
        desc: '${intro}',
        </c:if>

        link: '${wx_url}', // 分享链接
        imgUrl: '${imageUrl}', // 分享图标
        type: '', // 分享类型,music、video或link，不填默认为link
        dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
        success: function () {
          // 用户确认分享后执行的回调函数
        },
        cancel: function () {
          // 用户取消分享后执行的回调函数
        }
      });
      wx.onMenuShareQQ({
        title: '${pageTitle}', // 分享标题
        <c:if test="${intro eq null}">
        desc: '${wx_desc}',
        </c:if>                          // 分享描述
        <c:if test="${intro ne null}">
        desc: '${intro}',
        </c:if>
        link: '${wx_url}', // 分享链接
        imgUrl: '${imageUrl}', // 分享图标
        success: function () {
          // 用户确认分享后执行的回调函数
        },
        cancel: function () {
          // 用户取消分享后执行的回调函数
        }
      });
      wx.onMenuShareQZone({
        title: '${pageTitle}', // 分享标题
        <c:if test="${intro eq null}">
        desc: '${wx_desc}',
        </c:if>                          // 分享描述
        <c:if test="${intro ne null}">
        desc: '${intro}',
        </c:if>
        link: '${wx_url}', // 分享链接
        imgUrl: '${imageUrl}', // 分享图标
        success: function () {
          // 用户确认分享后执行的回调函数
        },
        cancel: function () {
          // 用户取消分享后执行的回调函数
        }
      });
      // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
    });
    wx.error(function (res) {

      // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。

    });

  </script>
  <script>
    $(document).ready(function () {
      changeFontSize();
      checkId();
    });
    var url = window.location.href;
    /*var role=${role};*/
    var role=<%=request.getSession().getAttribute("role")%>;
    var item_id = url.split("?id=")[1];
    item_id = item_id.split("&")[0];
    var click_type;
    //判断列表底部样式
    function checkList(){
      if(($(window).height()-$('.publish_container').height()-$('.publish_bottom').height())>0){
        $('.footer').css({'position': 'fixed','bottom':'0rem'})
      }else{
        $('.footer').css({'position': 'relative','bottom':'0rem'})
      }
    }
    //判断是否是修改信息
    function checkId() {
      if(role==1){
        $('.not_driver').hide();
        $('.change_driver').show();
        updateMessage(item_id)
      }else{
        $('.not_driver').show();
        $('.change_driver').hide();
        if (url.indexOf("=") == -1) {

        } else {
          updateMessage(item_id)
        }
      }

    }
    //更新信息
    function updateMessage() {
      var obj = {};
      obj.action = 'show';
      obj.id = item_id;
      validate.validate_submit('/api/db/passenger/departure', obj, insertMessage);
    }
    //更新信息
    function sendMessage(status) {
      var obj = {};
      obj.action = 'update';
      obj.id = item_id;
      obj.info_status = status;
      validate.validate_submit('/api/db/passenger/departure', obj, updateMessage);
    }
    //添加用户数据
    function insertMessage() {
      if(global_data.result.total == 0){
        window.location.href="/404"
      }else
      {
        for (var i = 0; i < global_data.result.data.length; i++) {
          var start_time = global_data.result.data[i].start_time;//开始时间
          var end_time = global_data.result.data[i].end_time;//结束时间
          var departure_city = global_data.result.data[i].departure_city;//出发城市
          var destination_city = global_data.result.data[i].destination_city;//目的城市
          var departure = global_data.result.data[i].boarding_point;//出发小城
          var destination = global_data.result.data[i].breakout_point;//目的小城市
          var description = global_data.result.data[i].description;//描述信息
          var inits_seats = global_data.result.data[i].booking_seats;//可用座位
          var id = global_data.result.data[i].order_id;//id
          var driving_name = global_data.result.data[i].name;
          var is_editor = global_data.result.data[i].is_editor;
          var create_time = global_data.result.data[i].create_time;
          var mobile = global_data.result.data[i].mobile;
          var info_status = is_editor;

          if (info_status == true) {
            $($('.item_seat_status')[i]).css('color','#2ecc71');
            info_status = "接受预定";
            click_type=0;
          } else {
            $($('.item_seat_status')[i]).css('color','##95a5a6');
            info_status = "已取消";
            click_type=2;
          }
          //开始时间设置
          var insert_time = start_time.substring(0, 10);
          var time_change = insert_time.split('-');
          insert_time = time_change[1] + '月' + time_change[2] + '日';
          //发布时间设置
          var begin_create_time = create_time.substring(11, 16);
          create_time = create_time.substring(0, 10);
          var time_create = create_time.split('-');
          create_time = time_create[1] + '月' + time_create[2] + '日';

          //开始结束时间
          var begin_start_time = start_time.substring(11, 16);
          var begin_end_time = end_time.substring(11, 16);
          var title_time = insert_time;
          var title_city = "来回拼车：" + departure_city + "-" + destination_city + " " + title_time + " " + "拼车信息详情";

          //添加标题信息
          $(document).attr("title", title_city);
          pageTitle = $(document).attr('title');
          var mobile_array=[];
          mobile_array = mobile.split(',');
          for(var i=0;i<mobile_array.length;i++){
            $('.mobile_clear').append('<a href="tel:'+mobile_array[i]+'" class="call_driver">' +
                    '<div class="publish_message_li_moblie">'+
                    '<span class="item_mobile">'+mobile_array[i]+'</span>'+
                    '<img src="/resource/images/pc_icon_mobile.png" class="mobile">'+
                    '</div>'+
                    '<div class="clear"></div>'+
                    '</a>'
            )
          }

          $('.departure_city').text(departure_city);
          $('.destination_city').text(destination_city);
          $('.item_tips_span').text(description);
          $('.item_mouth').text(insert_time);
          $('.item_start_end_times').text(begin_start_time + "-" + begin_end_time);
          $('.item_seat_status').text(info_status);
          $('.item_seat').text(inits_seats + "个");
          $('.item_name').text(driving_name);
          $('.call_driver_bottom').attr('href', 'tel:' + mobile_array[0]);

          if (driving_name == "") {
            $('.item_name_li').remove()
          }

          if (description == "") {
            $('.item_tips').remove();
            $('.li_change').addClass('li_last')
          }

          if(description==""){
            $('.item_tips_li').remove()
          }

          if (departure == "") {
            $('.start_city_type').remove();
          } else {
            $('.begin_city').text(departure);
          }
          if (destination == "") {
            $('.end_city_type').remove();
          } else {
            $('.end_city').text(destination);
          }
        }
        checkList();
      }

    }

    function returnCheck() {
      if (document.referrer == "") {
        window.location.href = '/laihui/car/list';
      } else {
        window.history.go(-1);
      }
    }
    //传送修改数据
    function sendFloatMessage(){
      sendMessage(click_type);
      $('.hover').fadeOut(200);
      $('.float_container').fadeOut(200);
    }
    function removeFloatMessage(){
      if($('.float_message_mid2').css('display')=='block'){
        $('.float_message_mid2').hide();
        $('.float_message_mid').show();
      }else{
        $('.hover').fadeOut(200);
        $('.float_container').fadeOut(200);
      }

    }
    function showFloat(){
      if($('.item_seat_status').text().trim() == "接受预定"){
        $('.float_message_mid').children('div').removeClass('set_active');
        $('.set_have').addClass('set_active');
      }else{
        $('.float_message_mid').children('div').removeClass('set_active');
        $('.set_remove').addClass('set_active');
      }
      $('.hover').fadeIn(200);
      $('.float_container').fadeIn(200);
      $('.float_message_mid2').hide();
      $('.float_message_mid').show();
    }
    function showFullTips(obj){
      if($(obj).attr('index')==2){
        $('.float_message_mid').children('div').removeClass('set_active');
        $('.set_remove').addClass('set_active');
        $('.float_sure').css('color','#e74c3c');
        $('.float_message_mid').hide();
        $('.float_message_mid2').show().children('span').text("确定修改状态为取消发布？修改过后将不再出现在发车信息列表中！");
      }else{
        $('.float_message_mid').children('div').removeClass('set_active');
        $('.set_have').addClass('set_active');
        $('.float_sure').css('color','#2ecc71');
        $('.float_message_mid2').hide();
        $('.float_message_mid').show();
      }
    }
  </script>
</head>
<body>
<div class="hover_all"></div>
<div class="loading_box">
  <img class="loading" src="/resource/images/loading.gif" alt="请等待">
</div>
<img src="/resource/images/pch_logo.png" style="display: none">
<div class="hover"></div>
<div class="float_container">
  <div class="float_box">
    <div class="float_message_box">
      <div class="float_message_title">
        <span>修改发布状态</span>
      </div>
      <div class="float_message_mid">
        <div class="set_have set_active" onclick="click_type=1;showFullTips(this)">
          <span>有空位</span>
        </div>
        <div class="set_remove" index="2" onclick="click_type=-1;showFullTips(this)">
          <span>取消发布</span>
        </div>
      </div>
      <div class="float_message_mid2">
        <span class="set_tips"></span>
      </div>
    </div>
    <div class="float_button">
      <span class="float_remove" onclick="removeFloatMessage()">取消</span>
      <span class="float_sure" onclick="sendFloatMessage()">确定</span>
    </div>
  </div>
</div>
<div class="publish_container">
  <div class="publish_top">
    <div class="return_perv">
      <img class="return_perv_img" alt="" src="/resource/images/pc_icon_home.png"
           onclick="returnCheck()">
    </div>
    <span style="font-size: 1.6rem">来回拼车</span>
  </div>
  <div class="publish_message_driver">
    <div class="publish_message_driver_title">
      <img src="/resource/images/pc_icon_stratRoute.png">
      <span class="departure_city"></span>
            <span class="start_city_type">
            <i class="circle"></i>
            <span class="begin_city" style="color:#999794"></span>
            </span>
      <span>——</span>
      <span class="destination_city"> </span>
            <span class="end_city_type">
            <i class="circle"></i>
            <span class="end_city" style="color:#999794"></span>
            </span>
    </div>
    <div class="publish_message_driver_time">
      <img src="/resource/images/pc_icon_thin_time.png" class="publish_message_driver_time_img">
      <span class="item_mouth"></span>
      <span class="item_start_end_times"></span>

      <div class="publish_seat">
        <span class="item_seat_status"></span>
      </div>
    </div>
  </div>
  <div class="publish_message">
    <ul>
      <li class="publish_message_li item_name_li">
        <div class="publish_message_li_left">
          <span>乘客姓名</span>
        </div>
        <div class="publish_message_li_right">
          <span class="item_name"></span>
        </div>
        <div class="clear"></div>
      </li>

      <li class="publish_message_li">
        <div class="publish_message_li_left">
          <span>电话</span>
        </div>
        <div class="publish_message_li_right mobile_clear">

        </div>
        <div class="clear "></div>
      </li>
      <li class="publish_message_li li_change">
        <div class="publish_message_li_left">
          <span>预定座位</span>
        </div>
        <div class="publish_message_li_right">
          <span class="item_seat"></span>
        </div>
        <div class="clear"></div>
      </li>
      <li class="publish_message_li li_last item_tips_li">
        <div class="publish_message_li_left">
          <span>备注</span>
        </div>
        <div class="publish_message_li_right">
                    <span class="item_tips">
                        <span class="item_tips_span">

                        </span>
                    </span>
        </div>
        <div class="clear"></div>
      </li>
    </ul>
  </div>
  <a href="" class="call_driver_bottom not_driver" style="display:none;">
    <div class="publish_bottom">
      联系乘客
    </div>
  </a>
  <a href="javascript:(0)" class="change_driver" onclick="showFloat()" >
    <div class="publish_bottom">
      编辑信息
    </div>
  </a>
  <div class="footer">
    <img src="/resource/images/pch_icon_bottom.png">
  </div>
</div>
<div class="clear"></div>
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
