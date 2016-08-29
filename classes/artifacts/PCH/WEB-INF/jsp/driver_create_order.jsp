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
    .publish_top {
      text-align: center;
      line-height: 4.2rem;
      font-size: 1.4rem;
      border-bottom: 1px solid #e8e8e8;
      padding: 0 1rem;
      background-color: #F5AD4E;
      color: #FFF;
    }

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
      height: 3.8rem;
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

    .publish_bottom {
      position: fixed;
      height: 5rem;
      line-height: 5rem;
      background-color: #f5ad4e;
      color: #fff;
      bottom: 0;
      width: 100%;
      text-align: center;
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
      width: 5.6rem;
      /*text-align: center;*/
    }
    .place_start_time,.place_end_time{
      text-align: center;
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
  </style>
  <script>
    $(document).ready(function () {

      changeFontSize();
      addTimeStyle();
      getStartPlace();
      addHourStyle();
      addSeat();
//      setShowData();
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
//      hideUl();
    });
    var array = [];
    var array_seat = [];
    var array_date = [];
    var user_id = 86;
//    //加载城市数组
//    var city_array = [];
    //选择位置（都有哪几个）数组
//    var city_select = [];
    //向后端发送的数组
    var send_array = [];
    //时间数据
    var timeData = [];
    var hourData = [];
    var day = ["今天", "明天"];
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
    //添加地点选择
    //获取出发地数据
    function getStartPlace() {
      var data_obj = {};
      data_obj.action = 'departure';
      validate.validate_submit('/db/pch/route', data_obj, carPlace.addCarStart);
    }
    function findMessage(){
      return true;
    }
//    function hideUl(){
//      $(document).click(function(e){
//        $(".publish_route_ul").empty();
//      });
//    }
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
        contact.id = -1;
        contact.name = "全部";
        contact.child = [{id:-11,name:""}];
        placeData.push(contact);
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

//    //改变诚信必发颜色
//    function changeMustSelect(obj) {
//      if ($(obj).children('.publish_mid_driver_img').attr('src') == '/resource/images/pc_icon_shiyuan.png') {
//        $(obj).children('.publish_mid_driver_img').attr('src', '/resource/images/pc_icon_kongyuan.png').removeClass('publish_active');;
//        $('.to_pay').hide();
//      } else {
//        $(obj).children('.publish_mid_driver_img').attr('src', '/resource/images/pc_icon_shiyuan.png').addClass('publish_active');
//        $('.to_pay').show();
//      }
//
//    }
//    //发送ajax获取城市信息
//    function sendMessage(key, city) {
//      var obj = {};
//      obj.key = key;
//      obj.city = city;
//      var url = "/place_suggestion";
//      validate.validate_submit2(url, obj, pushToArray);
//    }
//    //将信息存入数组
//    function pushToArray() {
//      city_array = [];
//      for (var i = 0; i < global_data.result.length; i++) {
//        city_array.push(global_data.result[i]);
//      }
//      addCitySlide(city_array);
//    }

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
//    //添加城市下拉列表样式
//    function addCitySlide(city_array) {
//      $('.publish_route_li').remove();
//      for (var i = 0; i < city_array.length; i++) {
//        var name = city_array[i].name;
//        var city = city_array[i].city;
//        var district = city_array[i].district;
//        var index = i;
//        addCitySlideStyle(name, city, district, index);
//      }
//    }
//    //添加城市下拉列表样式
//    function addCitySlideStyle(name, city, district, index) {
//      $('.publish_route_ul').append('<li class="publish_route_li" index=' + index + ' onclick="selectCity(this)">' +
//              '<span class="key">'+name+'</span>' +
//              '<span class="city" style="color: #999794">'+city+district+'</span>' +
//              '</li>')
//    }
//    //选择城市
//    function selectCity(obj) {
//      //显示用的数据
//      var name = $(obj).children('.key').text();
//      var city = $(obj).children('.city').text();
//      var number = $(obj).parent().parent().children('.input_style').attr('index');
//      $(obj).parent().parent().children('input').val(name+" "+city);
//      $(obj).parent().hide();
//      send_array.splice(number,1,city_array[$(obj).attr('index')]);
//    }
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
      var str =$('.publish_begin_time').text().substring(0,2);
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
      var st5 =$('.place_end_time').val().split("点")[1].split("分")[0].trim();
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
      mobile = $('.publish_mobile').val().toString();
      var description=$('.publish_remark').val();
      var departure_county=$('.place_start_city').val();
      var destination=$('.place_end_city ').val();
      var driving_name=$('.publish_name').val();
      var demo_set=$('#demo_set').val();
      var car_brand=$('.publish_type').val();

//      if (url.indexOf("=") == -1) {
//
//      } else {
//        data_obj.id = driver_id;
//      }

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
      validate.validate_submit('/api/driver/departure1', data_obj, success);
    }

    function success(){
      showFloatStyle("跳转列表页面")
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
//    //显示今天和明天信息
//    function setShowData(){
//      var str_time1=new Date();
//      for(var i=0;i<2.length;i++){
//        var obj={};
//        var str_time2=str_time1.getTime()+(1000*60*60*24)*i;
//        var time2 = new Date(str_time2);
//        var year2  = time2.getFullYear();
//        var month2 = time2.getMonth()+1;
//        var date2  = time2.getDate();
//        obj.year = year2;
//        if(month2.toString().length==1){
//          obj.month = "0"+month2;
//        }else{
//          obj.month = parseInt(month2);
//        }
//        obj.date = date2;
//        array_date.push(obj);
//      }
//    }
    function returnCheck() {
      if (document.referrer == "") {
        window.location.href = '/auth/base';
      } else {
        window.history.go(-1);
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
      <li class="publish_mid_li">
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
          <input type="text" id="demo_time" placeholder="出行时间" readonly="readonly" class="place_time input_disabled"/>
          <input type="text" id="demo_hour" placeholder="开始时间" readonly="readonly" class="place_time place_start_time input_disabled"/>
          <span>-</span>
          <input type="text" id="demo_min" placeholder="结束时间" readonly="readonly" class="place_time place_end_time input_disabled"/>
        </div>
      </li>

      <li class="publish_mid_li">
        <div class="publish_left_span">
          <span>可用座位</span>
        </div>
        <div class="publish_mid_li_click" onclick="">
          <input type="text" id="demo_set" placeholder="可用座位" readonly="readonly" class="input_disabled"/>
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
          <input type="text" placeholder="若有两个联系方式,请用逗号隔开" class="publish_mobile input_disabled"/>
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
</body>
</html>
