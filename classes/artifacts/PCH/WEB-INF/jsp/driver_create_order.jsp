<%@ page import="com.cyparty.laihui.domain.User" %>
<%--
  Created by IntelliJ IDEA.
  User: zhu
  Date: 2016/7/25
  Time: 15:06
  describtion:移动端--车主发布出行信息（带诚信必发标志）
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
  <title>来回拼车-车主发布-微信</title>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="/resource/js/style.js" type="text/javascript"></script>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">

  <link href="/resource/css/dialog.css" rel="stylesheet" type="text/css">
  <link href="/resource/css/mobile-select-area.css" rel="stylesheet" type="text/css">
  <script src="/resource/js/dialog.js" type="text/javascript"></script>
  <script src="/resource/js/mobile-select-area.js" type="text/javascript"></script>
  <script src="/resource/js/zepto.js" type="text/javascript"></script>
  <style type="text/css">


    .publish_mid {
      font-size: 1.4rem;
      background-color: #fff;
      line-height: 2.4rem;
      margin-bottom: 5rem;
      padding: 1rem 1.4rem;
    }

    .publish_top_right {
      float: right;
      font-size: 1.2rem;
      color: #999794;
      line-height: 3.2rem;
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

    .publish_mid_li {
      min-height: 4rem;
      line-height: 3.8rem;
      position: relative;
      margin-bottom: .2rem;
    }

    .publish_mid_li_img {
      width: 1.4rem;
      position: absolute;
      top: 1.2rem;
      margin-right: .3rem;
    }

    .publish_mid_driver_img {
      width: 1.4rem;
      position: relative;
      top: .3rem;
      margin-right: .3rem;
    }

    .publish_comeback_img {
      position: absolute;
      width: 1.6rem;
      right: 0;
      top: 2.8rem;
      transform: rotate(90deg);
    }

    .publish_message_driver {
      font-size: 1.4rem;
      background-color: #fff;
      line-height: 2.4rem;
      margin-top: .8rem;
      padding: 1rem 1.4rem;
    }

    .publish_mid_driver_li {
      height: 3rem;
      line-height: 3rem;
      position: relative;
    }

    .driver_li_tips {
      line-height: 1.4rem;
      color: #999794;
      position: relative;
      font-size: 1.2rem;
    }

    .driver_li_tips > a {
      text-decoration: underline;
      color: #f5ad4e;
    }

    .driver_li_tips_href {
      position: absolute;
      right: 1rem;
      bottom: 0;
    }

    .to_pay {
      display: none;
      text-align: right;
      line-height: 3rem;
      padding-right: 2rem;
      border-top: 1px solid #e8e8e8;
      background-color: #fff;
      height: 3rem;
    }



    .input_style {
      width: 80%;
      height: 2.6rem;
      padding-left: 2rem;
      border: none;
    }

    .publish_route_span {
      display: block;
      color: #F5AD4E;
    }

    .publish_route_box_span {
      line-height: 2rem;
      padding: 0 1rem;
      position: absolute;
      right: 0;
      color: #F5AD4E;
      bottom: 0;
      display: none;
    }

    .publish_route_box_remove {
      position: absolute;
      top: 0.5rem;
      right: -.6rem;
      line-height: 1.5rem;
      width: 1.4rem;
      height: 1.4rem;
      border-radius: 50%;
      font-size: 1.2rem;
      background-color: #F5AD4E;
      text-align: center;
      color: #fff;
      display: none;
    }

    .publish_route_box_input {
      display: inline-block;
      position: relative;
      width: 78%;
      margin-left: .2rem;
    }

    .publish_route_container {
      position: relative;
      line-height: 2rem;
    }

    .publish_li_route {
      display: none;
      height: auto;
    }

    .publish_route_ul {
      border: 1px solid #e8e8e8;
      position: absolute;
      top: 3.2rem;
      background-color: #fff;
      z-index: 1;
      line-height: 1.6rem;
      font-size: 1.3rem;
      overflow-y: auto;
      max-height: 24rem;
    }

    .publish_route_li {
      padding: .2rem .4rem;
      height: 2.6rem;
      line-height: 1.4rem;
    }

    .input_disabled {
      background-color: #fff;
      border: none;
      width: 100%;
      height: 3.2rem;
      line-height: 3.2rem;
      color: #52514f;
    }

    .line_container {
      width: .8rem;
      height: 2.6rem;
      position: absolute;
      top: -.7rem;
      text-align: center;
    }

    .line_slide {
      border-left: 1px solid #e8e8e8;
      height: 60%;
      position: relative;
      width: 1px;
      margin: 0 auto;
    }

    .line_circle {
      width: .6rem;
      height: .6rem;
      border: 1px solid #00b38a;
      border-radius: 50%;
    }

    .area_county_box {
      display: none;
    }

    .larea_finish {
      color: #f5ad4e;
    }
    .publish_left_span{
      float: left;
      font-size: 1.3rem;
      margin-right: .8rem;
      color: #F5AD4E;;
    }
    .publish_mid_li_click{
      float: left;
      width: 78%;
    }
    .place_input{
      width: 4rem;
    }
    .publish_icon_to2{
      width: 1.8rem;
      position: relative;
      top: -.2rem;
    }

    ::-webkit-input-placeholder { /* WebKit browsers */
      color: #999;
    }
    :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
      color: #999;
    }
    ::-moz-placeholder { /* Mozilla Firefox 19+ */
      color: #999;
    }
    :-ms-input-placeholder { /* Internet Explorer 10+ */
      color: #999;
    }
    .place_time{
      /*text-align: center;*/
    }
    .place_start_time,.place_end_time{
      width: 7rem;
      text-align: left;
    }
    .place_date{
      width: 70%;
    }
    .place_city{
      width: 7rem;
      display: inline-block;
    }
    .float_sure{
      color: #2ecc71;
    }
    /*复选*/
    .slide_select{
      width: 20px;
      height: 20px;
      position: absolute;
      left: 0px;
      top: 8px;
      background-image: url("/resource/images/pch_icon_unselect.png");
      background-size: 20px;
    }
    .slide_select_active{
      background-image: url("/resource/images/pch_icon_selected.png");
    }
    .slide_mid_ul_yes{
      float: left;
      width: 40%;
      margin-right: 8%;
    }
    .slide_mid_li{
      position: relative;
      line-height: 32px;
      cursor: pointer;
      padding-left: 22px;
    }
    .tag_right{
      width: 40%;
      float: left;
    }
    .float_message_mid{
      margin-top: 1rem;
    }
    .publish_mid_li_textarea{
      width: 76%;
      float: left;
      padding-top: 1.4rem;
      line-height: 2rem;
      color: #52514f;
    }
    .tags_container{
      width: 100%;
      resize: none;
      outline: none;
      color: #52514f;
      font-size: 1.4rem;
      margin-top: -.3rem;
      min-height: 5rem;
    }
    .slide_mid_ul_no,.slide_mid_ul_yes{
      max-height: 30rem;
      overflow: auto;
    }
    .to_city{
      width: 1.5rem;
      position: relative;
      top: -0.2rem;
    }
    .place_end_city{
      margin-left: 1rem;
    }
    @media screen and (max-width: 2000px) {
      body{
        max-width: 1080px;
        transform: translateZ(0);
        -webkit-transform: translateZ(0);
      }

    }
    @media screen and (max-width: 1080px) {
      body{
        max-width: 1080px;
        transform: none;
        -webkit-transform: none;
      }

    }
  </style>
  <script>
    $(document).ready(function () {

      changeFontSize();
      getStartPlace();
      addHourStyle();
      addSeat();
      setShowData();
      addTimeStyle();
      //地点选择
      var selectArea = new MobileSelectArea();
      selectArea.init({
        trigger:$('#demo_place'),
        data:placeData,
        level: 2
      });
      var selectArea = new MobileSelectArea();
      //今明选择
      selectArea.init({
        trigger:$('#demo_time'),
        data:timeData,
        level: 1
      });
//      开始时间
      var selectArea = new MobileSelectArea();
      selectArea.init({
        trigger:$('#demo_hour'),
        data:hourData,
        level: 2
      });
//      结束时间
      var selectArea = new MobileSelectArea();
      selectArea.init({
        trigger:$('#demo_min'),
        data:hourData,
        level: 2
      });
      //座位选择
      var selectArea = new MobileSelectArea();

      selectArea.init({
        trigger:$('#demo_set'),
        data:array_seat,
        level: 1
      });
      loadYes();
      loadNo();
      checkId();
    });
    var array = [];
    var array_seat = [];
    var array_date = [];
    var user_id = 86;

    var send_array = [];
    //时间数据
    var timeData = [];
    var hourData = [];
    var day = [];
    var array_end = [];
    var placeData = [];
    var send_time;
    var send_time2;
    var yes_tags=[];
    var no_tags=[];
    var token="7f5bfcb450e7425a144f3e20aa1d1a6e";
    var no_array=[];
    var yes_array=[];
    var route_array=[];
    var url = window.location.href;
    var car_id;
    var mobile_insert=<%=(String)request.getSession().getAttribute("user_mobile")%>;//此处填写手机号

    //判断是否是修改信息
    function checkId() {

        if (url.indexOf("=") == -1) {
            if(mobile_insert==""){
              $('.publish_mobile').val(mobile_insert);
            }else{
              $('.publish_mobile').val(mobile_insert);
            }
        } else {
          var item_id = url.split("?id=")[1];
          item_id = item_id.split("&")[0];
          car_id=item_id;
          updateMessage(item_id)
        }

    }
    //更新信息
    function updateMessage(item_id) {
      var obj = {};
      obj.action = 'show';
      obj.id = item_id;
      obj.user_id = user_id;
      validate.validate_submit('/api/db/departure', obj, insertMessage);
    }
    //添加用户数据
    function insertMessage() {
      if(global_data.result.total == 0){
        window.location.href="/404"
      }else
      {
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
          var create_time = global_data.result.data[i].create_time;//id

          //开始时间设置
          var insert_time = start_time.substring(0, 10);
          var time_change = insert_time.split('-');
          //发布时间设置
          var begin_create_time = create_time.substring(11, 16);
          create_time = create_time.substring(0, 10);
          var time_create = create_time.split('-');
          create_time = time_create[1] + '月' + time_create[2] + '日';

          //开始结束时间
          var begin_start_time = start_time.substring(11, 16);
          var begin_end_time = end_time.substring(11, 16);
          begin_start_time = begin_start_time.split(":")[0]+"点 "+begin_start_time.split(":")[1]+"分";
          begin_end_time = begin_end_time.split(":")[0]+"点 "+begin_end_time.split(":")[1]+"分";
          var demo_place_val=departure_city+" "+destination_city;
          //添加标题信息


          tag_yes_content= tag_yes_content.replace(/丶/g, "、");
          tag_no_content= tag_no_content.replace(/丶/g, "、");

          var time=new Date();
          var date  = time.getDate();

          if(date == time_change[2]){
            insert_time = "今天("+time_change[1] + '-' + time_change[2]+")";
          }else{
            insert_time = "明天("+time_change[1] + '-' + time_change[2]+")";
          }

          no_array=[];
          yes_array=[];
          route_array= points.split("丶");
          no_array=tag_no_content.split('、');
          yes_array=tag_yes_content.split('、');
          var text_tags;
          if(tag_yes_content=="" && tag_no_content == ""){
            text_tags=""
          }else{
            if(tag_no_content==""){
              text_tags=tag_yes_content
            }else if(tag_yes_content==""){
              text_tags=tag_no_content
            }else{
              text_tags=tag_no_content+"、"+tag_yes_content;
            }
          }
          var tags_text=tag_yes_content+tag_no_content;
          $('#demo_place').val(demo_place_val);

          $('.publish_mobile').val(mobile);
          $('.publish_remark').val(description);
          $('#demo_time').val(insert_time);
          $('#demo_hour').val(begin_start_time);
          $('#demo_min').val(begin_end_time);
          $('#demo_set').val(inits_seats);
          $('.tags_container').val(text_tags);
          $('.publish_name').val(driving_name);
          $('.publish_type').val(car_brand);
          $('.item_points').text(points);
          addTabManagerStyle();
          if(route_array[0]==""){
            $('.publish_li_route').hide()
          }else{
            $('.publish_li_route').show();
            addRouteStyle();
            $('.publish_route_box_span').show();
          }

        }
      }

    }

    //获取出发地数据
    function getStartPlace() {
      var data_obj = {};
      data_obj.action = 'departure';
      validate.validate_submit('/db/pch/route', data_obj, carPlace.addCarStart);
    }
    function findMessage(){
      return true;
    }

    //添加日期格式
    function addTimeStyle() {
      for (var j=0;j<day.length;j++) {
        var contact = new Object();
        var day_time = [];
        contact.child = day_time;
        contact.id = j+1;
        contact.name = day[j];
        timeData.push(contact);
      }
    }
    //添加小时选择
    function addHourStyle() {
      for (var j=0;j<24;j++) {
        var contact = new Object();
        var day_time = [];
        for (var i = 0; i < 2; i++) {
          var obj = {};
          if(i==0){
            obj.name = "00分";
          }else{
            obj.name = i *30+"分";
          }
          obj.id = 1000 + i;
          day_time.push(obj);
        }
        contact.child = day_time;
        contact.id = j+1;
        contact.name = j+"点";
        hourData.push(contact);
      }
    }

    //添加座位
    function addSeat(){
      for (var i=0;i<7;i++) {
        var contact = new Object();
        var day_time = [];
        contact.child = day_time;
        contact.id = i+1;
        contact.name = i+1;
        array_seat.push(contact);
      }
    }

    //车辆行程信息2
    var carPlace = (function () {
        //将车辆行程信息据封装进数组
      function addCarStart() {
        var data1 = global_data.result;
        var contact = new Object();
        for (var i = 0; i < data1.data.length; i++) {
          var departure1 = data1.data[i].departure;
          var contact = new Object();
          contact.id = i+1;
          contact.name = departure1;
          $.ajax({
            type: "POST",
            url: "/db/pch/route",
            async: false,
            data: {"action": "departure", "departure": departure1},
            dataType: "json",
            success: function (data) {
              if (data.status == true) {
                var array_end = [];

                for (var j = 0; j < data.result.data.length; j++) {
                  var obj = {};
                  obj.id = 1000 + j;
                  obj.name = data.result.data[j].destination;
                  array_end.push(obj);
                }
                contact.child = array_end;
                placeData.push(contact);

              } else {
                validate.showTips("格式不正确");
              }
            },
            error: function () {
              console.log("交互失败");
            }
          })

        }
      };
      return {
        addCarStart: addCarStart
      }
    })();

    //移除输入框
    function removeInput(obj) {
      $(obj).parent().parent().remove();
      var city = $(obj).children('.city').text();
      var number = $(obj).parent().children('.input_style').attr('index');
      send_array.splice(number,1);
      isFirstInput();
      setIndex();
    }
    //添加输入
    function addInput() {
      $('.publish_route_box_span').before('<div class="publish_route_container">' +
              '<div class="publish_route_box_input">' +
              '<div class="line_container">' +
              '<div class="line_slide"></div>' +
              '<div class="line_circle"></div>' +
              '</div>' +
              '<input type="text" placeholder="添加行程的主要途径点" index="" class="main_route input_style" oninput="sendKeepDownInput(this)">' +
              '<span class="publish_route_box_remove" onclick="removeInput(this)">X</span>' +
              '<ul class="publish_route_ul">' +

              '</ul>' +
              '</div>' +
              '</div>');
      isFirstInput();
      setIndex();
    }
    function setIndex(){
      for(var i=0;i<$('.input_style').length;i++){
        $($('.input_style')[i]).attr('index',i);
      }
    }

    //按键请求城市信息
    function sendKeepDownInput(obj) {
      if($(obj).val() ==""){
        $(obj).parent().children('.publish_route_ul').empty()
      }else{
        $('.publish_route_ul').hide();
        $(obj).parent().children('.publish_route_ul').show();
        var key = $(obj).val().trim();
        var city = "全国";
//        sendMessage(key, city);
      }
      isFirstInput();
    }
    //检测输入框是否是第一个
    function isFirstInput() {
      var l_input = $('.publish_route_container').length;
      if (l_input == 1) {
        $('.publish_route_box_remove').hide();
        if ($('.input_style').val() == "") {
          $('.publish_route_box_span').hide();
        } else {
          $('.publish_route_box_span').show();
        }
      } else {
        $('.publish_route_box_remove').show();
        $('.publish_route_box_span').show();
      }
    }
    //显示途径和下滑菜单
    function slideCity() {

      $('.publish_li_route').show();
    }
    //检测输入信息是否完整
    function checkDriverMessage(){
      if($('#demo_place').val()==""){
        showFloatStyle("起止路线不能为空");
      }else if($('#demo_time').val()==""){
        showFloatStyle("出发时间不能为空");
      }else if($('.place_start_time ').val()==""){
        showFloatStyle("最早时间不能为空");
      }else if($('.place_end_time').val()==""){
        showFloatStyle("最晚时间不能为空");
      }else if($('#demo_set').val()==""){
        showFloatStyle("可用座位不能为空");
      }else if($('.publish_mobile').val()==""){
        showFloatStyle("联系方式不能为空");
      }else{
        setSendData();
        sendFinalMessage();
      }
    }
    //发送时间的数据
    function setSendData(){
      var time;
      var str =$('#demo_time').val().substring(0,2);
      if(str=="今天"){
        time=new Date();
        changeDataStyle(time)
      }else{
        var today=new Date();
        var t=today.getTime()+1000*60*60*24;
        time=new Date(t);
        changeDataStyle(time)
      }

    }
    //转换日期格式
    function changeDataStyle(time){
      var year  = time.getFullYear();
      var month = time.getMonth()+1;
      var date  = time.getDate();
      if(month.toString().length==1){
        month = "0"+month;
      }else{
        month = parseInt(month);
      }
      var st2 =$('.place_start_time').val().split("点")[0].trim();
      var st3 =$('.place_end_time').val().split("点")[0].trim();
      var st4 =$('.place_start_time').val().split("点")[1].split("分")[0].trim();
      var st5 =$('.place_end_time') .val().split("点")[1].split("分")[0].trim();
      if(st2.length == 1){
        send_time =year+"-"+month+"-"+date+" "+"0"+st2+":"+st4+":00";
      }else{
        send_time =year+"-"+month+"-"+date+" "+st2+":"+st4+":00";
      }

      if(st3.length == 1){
        send_time2 =year+"-"+month+"-"+date+" "+"0"+st3+":"+st5+":00";
      }else{
        send_time2 =year+"-"+month+"-"+date+" "+st3+":"+st5+":00";
      }
    }
    //发送数据到后端
    function sendFinalMessage(){
      var route="";
      var mobile;
      var route_array=[];
      for(var i=0;i<$('.main_route').length;i++){
        route_array.push($($('.main_route')[i]).val().trim());
      }
      for(var i=0;i<route_array.length;i++){
        if(i==route_array.length-1){
          route+=route_array[i]
        }else{
          route+=route_array[i]+'丶'
        }
      }
      var tag_yes_content="";
      for(var i=0;i<yes_array.length;i++){
        if(i==yes_array.length-1){
          tag_yes_content+=yes_array[i]
        }else{
          tag_yes_content+=yes_array[i]+'丶'
        }

      }
      var tag_no_content="";
      for(var i=0;i<no_array.length;i++){
        if(i==no_array.length-1){
          tag_no_content+=no_array[i]
        }else{
          tag_no_content+=no_array[i]+'丶'
        }
      }
      var data_obj={};
      var a = $('#demo_place').val().split(' ');
      mobile = $('.publish_mobile').val().toString().trim();
      if(mobile.length>11){
       if(mobile.indexOf("，")==-1){
         mobile.replace("，",",")
       }
      }
      var description=$('.publish_remark').val();
      var departure_county=$('.place_start_city').val();
      var destination=$('.place_end_city ').val();
      var driving_name=$('.publish_name').val();
      var demo_set=$('#demo_set').val();
      var car_brand=$('.publish_type').val();
      if (url.indexOf("=") == -1) {

      } else {
        data_obj.id = car_id;
      }
      data_obj.action = 'add';
      data_obj.user_id = user_id;
      data_obj.start_time = send_time;
      data_obj.end_time = send_time2;
      data_obj.mobile = mobile;
      data_obj.departure_city = a[0];
      data_obj.destination_city = a[1];
      data_obj.init_seats = demo_set;
      data_obj.points = route;
      data_obj.description = description;
      data_obj.departure_county = departure_county;
      data_obj.destination = destination;
      data_obj.tag_yes_content = tag_yes_content;
      data_obj.tag_no_content = tag_no_content;
      data_obj.driving_name = driving_name;
      data_obj.car_brand = car_brand;
      validate.validate_submit('/api/db/departure', data_obj, success);
    }

    function success(){
      window.location.href="/laihui/passenger/order_list";
    }

    //添加YES/NO标签
    function loadYes(){
      var obj={};
      obj.action='show';
      obj.type=1;
      validate.validate_submit2("/api/db/tag",obj,addToYesTags)
    }
    function addToYesTags(){
      for (var i = 0; i < global_data.data.length; i++){
        var content=global_data.data[i].content;
        yes_tags.push(content);
      }
      addYesTagsStyle();
    }
    function loadNo(){
      var obj={};
      obj.action='show';
      obj.type=0;
      validate.validate_submit2("/api/db/tag",obj,addToNoTags)
    }
    function addToNoTags(){
      for (var i = 0; i < global_data.data.length; i++){
        var content=global_data.data[i].content;
        no_tags.push(content);
      }
      addNoTagsStyle();
    }
    //添加下滑
    function addTabManagerStyle(){
      //判断取消再次显示情况下数据
      for(var i=0;i<$('.success_passed').length;i++){
        var text1=$($('.success_passed')[i]).children('.slide_mid_li_span').text();
        for(var j=0;j<yes_array.length;j++){
          var text2=yes_array[j];
          if(text1==text2){
            $($('.success_passed')[i]).children('.slide_select').addClass('slide_select_active')
          }
        }
      }
      for(var i=0;i<$('.not_passed').length;i++){
        var text1=$($('.not_passed')[i]).children('.slide_mid_li_span').text();
        for(var j=0;j<no_array.length;j++){
          var text2=no_array[j];
          if(text1==text2){
            $($('.not_passed')[i]).children('.slide_select').addClass('slide_select_active')
          }
        }
      }
    }
    //添加路线
    function addRouteStyle(){
      $('.publish_route_container').remove();
      for(var i=0;i<route_array.length;i++){
        $('.publish_route_box_span').before('<div class="publish_route_container">' +
                '<div class="publish_route_box_input">' +
                '<div class="line_container">' +
                '<div class="line_slide"></div>' +
                '<div class="line_circle"></div>' +
                '</div>' +
                '<input type="text" value="'+route_array[i]+'" index="" class="main_route input_style" oninput="sendKeepDownInput(this)">' +
                '<span class="publish_route_box_remove" onclick="removeInput(this)">X</span>' +
                '<ul class="publish_route_ul">' +

                '</ul>' +
                '</div>' +
                '</div>');
      }
    }
    //添加标签列表
    function addYesTagsStyle(){
      for(var i=0;i<yes_tags.length;i++){
        $('.slide_mid_ul_yes').append('<li class="slide_mid_li success_passed" index="1" onclick="addSlideStyle(this)">'+
                '<span class="slide_mid_li_span">'+yes_tags[i]+'</span>'+
                '<div class="slide_select"></div>'+
                '</li>')
      }
    }
    function addNoTagsStyle(){

      for(var j=0;j<no_tags.length;j++){
        $('.slide_mid_ul_no').append('<li class="slide_mid_li not_passed" index="1" onclick="addSlideStyle(this)">'+
                '<span class="slide_mid_li_span">'+no_tags[j]+'</span>'+
                '<div class="slide_select"></div>'+
                '</li>')
      }
    }
    //选择标签
    function addSlideStyle(obj) {
      if ($(obj).children('.slide_select').hasClass('slide_select_active')) {
        $(obj).children('.slide_select').removeClass('slide_select_active')
      } else {
        $(obj).children('.slide_select').addClass('slide_select_active')
      }
    }
    //将添加的标签存入数组中
    function inputMessage(){
      no_array=[];
      yes_array=[];
      for(var i=0;i<$('.slide_select_active').length;i++){
        if($($('.slide_select_active')[i]).parent().hasClass('not_passed')){
          no_array.splice(i,1,$($('.slide_select_active')[i]).parent().
                  children('.slide_mid_li_span').text());
        }else{
          yes_array.splice(i,1,$($('.slide_select_active')[i]).parent().
                  children('.slide_mid_li_span').text());
        }
      }
      getTags();
      removeFloatMessage();
    }
    //将数组中的标签取出
    function getTags(){
      $('.tags_container').val("");
      var tags_array=[];
      var tags_val="";
      for(var i=0;i<yes_array.length;i++){
        tags_array.push(yes_array[i]);
      }

      for(var j=0;j<no_array.length;j++){
        tags_array.push(no_array[j]);
      }

      for(var k =0;k<tags_array.length;k++){
        if(k+1==tags_array.length){
          tags_val = tags_val+tags_array[k]
        }else{
          tags_val = tags_val+tags_array[k]+"、"
        }
      }
      $('.tags_container').val(tags_val);
    }

    function returnCheck() {
      if (document.referrer == "") {
        window.location.href = '/auth/base';
      } else {
        window.history.go(-1);
      }
    }

    //显示今天和明天信息
    function setShowData(){

      var str_time1=new Date();
      for(var i=0;i<2;i++){
        var obj={};
        var str_time2=str_time1.getTime()+(1000*60*60*24)*i;
        var time2 = new Date(str_time2);
        var year2  = time2.getFullYear();
        var month2 = time2.getMonth()+1;
        var date2  = time2.getDate();
        obj.year = year2;
        if(month2.toString().length==1){
          obj.month = "0"+month2;
        }else{
          obj.month = parseInt(month2);
        }
        obj.date = date2;
        array_date.push(obj);
      }

      for(var j=0;j<2;j++){
        if(j==0){
          day.push("今天("+array_date[j].month+"-"+array_date[j].date+")")
          $('#demo_time').val("今天("+array_date[j].month+"-"+array_date[j].date+")")
        }else{
          day.push("明天("+array_date[j].month+"-"+array_date[j].date+")")
        }

      }
    }
  </script>
</head>
<body scroll="no">
<div class="hover"></div>
<div class="float_container2">
  <div class="float_box2">
    <div class="float_message_box2">
      <div class="float_message_title2">
        <span>选择标签</span>
      </div>
      <div class="float_message_mid2">
        <div class="tag_left">
            <ul class="slide_mid_ul_yes">

            </ul>
        </div>
        <div class="tag_right">
            <ul class="slide_mid_ul_no">

            </ul>
        </div>
        <div class="clear"></div>
      </div>
    </div>
    <div class="float_button">
      <span class="float_remove" onclick="removeFloatMessage()">取消</span>
      <span class="float_sure" onclick="inputMessage()">确定</span>
    </div>
  </div>
</div>
<div class="float_container">
  <div class="float_box">
    <span class="float_box_span"></span>
  </div>
</div>
<div class="publish_container">
  <div class="publish_top">
    <div class="return_perv">
      <img class="return_perv_img" alt="" src="/resource/images/pc_icon_white_return.png" onclick="returnCheck()">
    </div>
    <span>发布拼车</span>
  </div>
  <div class="publish_message">
    <ul class="publish_mid">
      <li class="publish_mid_li publish_start">
        <div class="publish_left_span">
          <span>起止路线</span>
        </div>
        <div class="publish_mid_li_click" index="1" >
          <input type="text" id="demo_place" placeholder="选择起止城市" readonly="readonly" class="place_start_to_end input_disabled"  onclick="slideCity()"/>
        </div>
      </li>
      <li class="publish_mid_li" style="display: none">
        <div class="publish_left_span">
          <span>县级城市</span>
        </div>
        <div class="publish_mid_li_click" onclick="">
          <input type="text"  placeholder="出发县城" class="place_city place_start_city input_disabled"/>
          <img src="/resource/images/pch_icon_to.png" class="to_city">
          <input type="text"  placeholder="目的县城" class="place_city place_end_city input_disabled"/>
        </div>
      </li>

      <li class="publish_mid_li publish_li_route">
        <span class="publish_route_span">途经点：</span>

        <div class="publish_route_box">
          <div class="publish_route_container">
            <div class="publish_route_box_input">
              <div class="line_container">
                <div class="line_slide"></div>
                <div class="line_circle"></div>
              </div>
              <input type="text" placeholder="添加行程的主要途径点" class="main_route input_style"
                     index="0" oninput="sendKeepDownInput(this)">
              <span class="publish_route_box_remove" onclick="removeInput(this)">X</span>
              <ul class="publish_route_ul">

              </ul>
            </div>
          </div>
          <span class="publish_route_box_span" onclick="addInput()">+添加</span>

          <div class="clear"></div>
        </div>
        <div class="clear"></div>
      </li>
      <li class="publish_mid_li">
        <div class="publish_left_span">
          <span>出行时间</span>
        </div>
        <div class="publish_mid_li_click" onclick="">
          <input type="text" id="demo_time" placeholder="选择日期" readonly="readonly" class="place_time place_date input_disabled"/>
          <input type="text" id="demo_hour" placeholder="最早" readonly="readonly" class="place_time place_start_time input_disabled"/>
          <span>--  </span>
          <input type="text" id="demo_min" placeholder="最晚" readonly="readonly" class="place_time place_end_time input_disabled"/>
        </div>
        <div class="clear"></div>
      </li>

      <li class="publish_mid_li">
        <div class="publish_left_span">
          <span>可用座位</span>
        </div>
        <div class="publish_mid_li_click" onclick="">
          <input type="tel" id="demo_set" placeholder="可用座位" readonly="readonly" class="input_disabled"/>
        </div>
      </li>
      <li class="publish_mid_li">
        <div class="publish_left_span">
          <span>车辆型号</span>
        </div>
        <div class="publish_mid_li_click" onclick="">
          <input type="text"  placeholder="车辆品牌(大众、奔驰等)"  class="publish_type input_disabled"/>
        </div>
      </li>
      <li class="publish_mid_li">
        <div class="publish_left_span">
          <span>车主姓名</span>
        </div>
        <div class="publish_mid_li_click" onclick="">
          <input type="text" placeholder="姓名" class="publish_name input_disabled"/>
        </div>
      </li>
      <li class="publish_mid_li">
        <div class="publish_left_span">
          <span>联系电话</span>
        </div>
        <div class="publish_mid_li_click" onclick="">
          <input type="tel" placeholder="若有两个联系方式,请用逗号隔开" class="publish_mobile input_disabled"/>
        </div>
      </li>
      <li class="publish_mid_li">
        <div class="publish_left_span">
          <span>备注信息</span>
        </div>
        <div class="publish_mid_li_click" onclick="">
          <input type="text" placeholder="如顺路接送、费用等" class="publish_remark input_disabled"/>
        </div>
      </li>
      <li class="publish_mid_li">
        <div class="publish_left_span">
          <span>添加标签</span>
        </div>
        <div class="publish_mid_li_textarea" onclick="">
          <textarea type="text" placeholder="选择YES标签和NO标签" readonly="readonly" class="tags_container" onclick="showFloatStyle2()"/></textarea>
        </div>
      </li>
      <div class="clear"></div>
    </ul>
  </div>


  <div class="publish_bottom" onclick="checkDriverMessage()">
    <span>确认发布</span>
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
