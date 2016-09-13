<%--
  Created by IntelliJ IDEA.
  User: zhu
  Date: 2016/8/15
  Time: 15:06
    des：移动端--乘客发布信息列表页面
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
  <title>来回拼车-乘客拼车信息汇</title>
  <link rel="shortcut icon" href="/resource/images/pc_logo.ico"/>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="/resource/js/style.js" type="text/javascript"></script>
  <script src="/resource/js/jquery.cookie.js" type="text/javascript"></script>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">


  <link href="/resource/css/dialog.css" rel="stylesheet" type="text/css">
  <link href="/resource/css/mobile-select-area.css" rel="stylesheet" type="text/css">
  <script src="/resource/js/city_select.js" type="text/javascript"></script>


  <script src="/resource/js/dialog.js" type="text/javascript"></script>
  <script src="/resource/js/mobile-select-area.js" type="text/javascript"></script>
  <script src="/resource/js/zepto.js" type="text/javascript"></script>

  <style type="text/css">

    .departure_container_top {
      width: 100%;
      /*height: 4.2rem;*/
      background-color: #fff;
      position: relative;
      border-bottom: 1px solid #f5ad4e;
    }

    .departure_top_box {
      padding-top: .36rem;
      text-align: left;
      color: #f5ad4e;
      text-indent: .6rem;
    }

    .departure_top_find_car {
      display: inline-block;
      width: 8rem;
      height: 3.4rem;
      border-radius: 3rem;
      line-height: 3.4rem;
      position: relative;
      margin-right: -3.2rem;
      background-color: #f5ad4e;
      color: #fff;
      padding-right: .8rem;
    }

    .departure_top_find_person {
      display: inline-block;
      width: 8rem;
      /* text-align: center; */
      height: 3.4rem;
      background-color: #f5ad4e;
      border-radius: 3rem;
      color: #fff;
      line-height: 3.4rem;
      position: relative;
      padding-left: .8rem;
    }

    .departure_top_button_active {
      color: #f5ad4e;
      background-color: #fff;
      z-index: 1;
    }

    .departure_mid_select {
      width: 100%;
      background-color: #fff;
    }

    /*城市下拉框*/
    .publish_list_box {
      float: left;
      margin-right: 30px;
    }

    .publish_slide {
      height: 100%;
      line-height: 3.8rem;
      font-size: 1.4rem;
      width: 38%;
      text-align: center;
      /*display: inline-block;*/
      float: left;
      padding-right: 20px;
      position: relative;
      cursor: pointer;
      border-right: 1px solid #e8e8e8;
    }

    .publish_slide ul {
      display: none;
      position: absolute;
      background-color: #fff;
      z-index: 1;
      width: 100%;
      margin: -2px -1px;
      box-shadow: -2px 6px 10px 0px #e8e8e8;
    }

    .publish_slide_li:hover {
      background-color: #f7f7f7;
    }

    /*.publish_slide:hover > .down1 {*/
    /*transform: rotate(180deg);*/
    /*}*/

    .publish_list {
      display: inline-block;
    }

    .input_disabled {
      background-color: #fff;
      border: none;
      width: 100%;
      text-indent: 1.8rem;
      line-height: 3.8rem;
      height: 3.8rem;
      color: #52514f;
      font-size: 1.4rem ;
      font-family: "微软雅黑";
      -webkit-appearance : none ;
    }

    .publish_li_click {
      /*display: inline-block;*/
      float: left;
      width: 50%;
    }

    .area_county_box {
      display: none;
    }

    .departure_li {
      border-top: 1px solid #e8e8e8;
      background-color: #fff;
      padding: 1rem 1.4rem;
      position: relative;
      cursor: pointer;

    }
    .departure_li_city {
      font-size: 1.4rem;
      line-height: 3rem;
      position: relative;
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
      position: absolute;
      top: 1.5rem;
      right: 1.5rem;
      background-color: #f5ad4e;
      padding: .2rem .4rem;
      color: #fff;
      border-radius: 3px;
    }

    .departure_li_tags {
      line-height: 1.6rem;
      margin-top: .4rem;
      font-size: 1.2rem;
    }

    .select_checkbox {
      color: #777;
      cursor: pointer;
      position: relative;
      text-align: center
    }

    .select_popover_arrow {
      position: absolute;
      right: -6px;
      display: inline-block;
      width: 0;
      height: 0;
      border-width: 8px;
      border-style: dashed;
      border-color: transparent;
      border-top-width: 0;
      border-bottom-color: #00b38a;
      border-bottom-style: solid;
      transform: rotate(134deg);
      top: 17px;
    }

    .select_popover_arrow_no {
      position: absolute;
      right: -6px;
      display: inline-block;
      width: 0;
      height: 0;
      border-width: 8px;
      border-style: dashed;
      border-color: transparent;
      border-top-width: 0;
      border-bottom-color: #e74c3c;
      border-bottom-style: solid;
      transform: rotate(134deg);
      top: 17px;
    }

    .select_checkbox_container {
      position: relative;
      display: inline-block;
      padding: 2px 6px;
      border: 1px solid #e8e8e8;
      margin-right: 1rem;
    }

    .select_checkbox_active {
      border: 1px solid #f5ad4e;
    }

    .departure_li_yes_tags {
      border: 1px #00b38a solid;
    }

    .departure_li_no_tags {
      border: 1px #e74c3c solid;
    }

    .departure_time_seat {
      display: inline-block;
      float: right;
      color: #F5AD4E;
    }

    .departure_container_mid {

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

    .departure_li_style_img {
      width: 1.8rem;
      position: relative;
      top: .45rem;
    }

    .departure_li_type {
      color: #999794;
      font-size: 1.2rem;
    }
    .departure_li_active{
      color: #999794;
    }
    .publish_status{
      display: inline-block;
    }
    .not_message{
      display: none;
      width: 100%;
      text-align: center;
      margin-top: 50%;
      margin-bottom: 6rem;
      font-size: 2rem;
    }
    .departure_top_box_img{
      width: 20.6rem;
      position: relative;
      top: .4rem;
    }
    /*.departure_top_box_span{*/
      /*line-height: 2rem;*/
      /*font-size: 1.6rem;*/
    /*}*/
    .departure_top_box_span{
      line-height: 2rem;
      position: absolute;
      top: 1.2rem;
      right: .4rem;
      font-size: 1.4rem;
    }
    .begin_city ,.end_city{
      font-size: 1.2rem;
    }

    /*城市下拉框*/
    .publish_list_box2{
      display: none;
    }
    .publish_slide2 {
      height: 100%;
      line-height: 3.8rem;
      font-size: 1.4rem;
      width: 100%;
      display: inline-block;
      padding-right: 2rem;
      position: relative;
      cursor: pointer;
      text-align: center;
    }

    .publish_slide2 ul {
      display: none;
      position: absolute;
      background-color: #fff;
      z-index: 1;
      box-shadow: -2px 6px 10px 0px #e8e8e8;
      width: 100%;
      margin: -2px -1px;
      max-height: 35rem;
      overflow: auto;
    }

    .publish_slide_li2:hover {
      background-color: #f7f7f7;
    }

    .publish_list2 {
      display: inline-block;
      width: 20%;
    }
    .publish_county2 {
      width: 120px;
    }

    .publish_icon_to2 {
      width: 1.8rem;
      position: relative;
      top: 0rem;
      margin-left: 4.4rem;
    }
    .not_more{
      height: 4rem;
      line-height: 4rem;
      width: 100%;
      text-align: center;
      display: inline-block;
    }
  </style>
  <link href="/resource/css/auto.css" rel="stylesheet" type="text/css">
  <script>
    $(document).ready(function () {
      changeFontSize();
      $('.publish_slide').mouseleave(function () {
        $('.publish_slide_ul').hide();
      });
      $('.publish_slide2').mouseleave(function () {
        $('.publish_slide_ul').hide();
      });
      IsPC(inPc,inMobile);
      setShowData();
      movetop();
      checkId();
      $(window).scroll(function () {
        $(window).scrollTop() > 100 ? $(".backtop").animate({bottom:"100rem;"},300).show() : $(".backtop").hide().css({bottom:"9.3rem"})
      });
      $(".backtop").click(function () {
        $('body,html').animate({scrollTop:0},400);
        return false;
      });
//      if($(window).width()>1100){
//        $('.bottom_menu').click();
//      }
      //分页操作
      $(window).scroll(function () {
                var Scroll = $(document).scrollTop();
                var height = $(window).height();
                var WD = $(document).height();
                if ( Scroll +height == WD) {
                  if(total<10){
                    page_list = 1;
                  }else{
                    if(page_list<Math.ceil(total/size)){
                      page_list++;
                      if(page_list != Math.ceil(total/size)){
                        loadPageList(page_list);
                      }

                    }else{
                      $('.not_more').remove();
                      $('.footer').prepend('<span class="not_more">没有更多数据</span>')
                    }
                  }

                }
              }
      );
    });

    //加载城市数组
    var mobile=0;
    var city_array = [];
    //选择位置（都有哪几个）数组
    var placeData = [];
    var array_date = [];
    var send_time;
    var send_time2;
    var pageTitle=$(document).attr('title').toString();
    var url = window.location.href;
    var begin_time;
    var destination_city;
    var departure_city;
    var cookie_array=[];
    var index =[];
    var total;
    var size=10;
    var page_list = 0;
    var load_start_time;
    //判断列表底部样式
    function checkList(){
      var body_heigth = $(window).height();
      var height_top1 = $('.departure_container_top').height();
      var height_top2 = $('#upload_form').height();
      var height_top3 = $('.departure_container_list').height();
      var height_bottom = $('.footer').height();
      if((body_heigth - height_top1-height_top2 -height_top3 -height_bottom)>0){
        $('.footer').css({'position': 'absolute','bottom':'0rem'})
      }else{
        $('.footer').css({'position': 'relative','bottom':'0rem'})
      }
      console.log((body_heigth - height_top1-height_top2 -height_top3 -height_bottom))
    }
    function loadPageList(page_list) {
      departure_city = city_array[0];
      destination_city = city_array[1];
      if(departure_city==undefined ||departure_city=="" ||departure_city =="全部"){
        departure_city="";
        destination_city="";
      }
      var obj = {};
      obj.action = 'show';
      obj.page = page_list;
      obj.size = size;
      obj.date = begin_time;
      obj.departure_city = departure_city;
      obj.destination_city = destination_city;
      validate.validate_submit('/api/db/passenger/departure', obj, sendPageMessage);
    }
    //返回顶部
    function movetop() {
      $(".backtop").hide();
    }
    function IsPC(callback1,callback2)
    {
      var userAgentInfo = navigator.userAgent;
      var Agents = new Array("phone","pad","pod","iPhone","iPod","ios","iPad","Android","Mobile","BlackBerry","IEMobile","MQQBrowser","JUC","Fennec","wOSBrowser","BrowserNG","WebOS","Symbian","Windows Phone","SymbianOS");
      var flag = true;
      for (var v = 0; v < Agents.length; v++) {
        if (userAgentInfo.indexOf(Agents[v]) > 0) {
          flag = false;
          break;
        }
      }
      if(flag == true){
        mobile=1;

        callback1();
      }else{
        mobile=0;
        callback2();
      }
    }

    function inPc(){
      loadStartRoute();
      $('.publish_li_click').hide();
      $('.publish_list_box2').show()
    }
    function inMobile(){
      //地点选择器
      $('.publish_li_click').show();
      $('.publish_list_box2').hide();
//            var driverPlace = new DriverPlace2();
//            driverPlace.init({
//                'trigger': '#demo_place',//触发选择控件的文本框，同时选择完毕后name属性输出到该位置
//                'keys': {id: 'id', name: 'name'},//绑定数据源相关字段 id对应valueTo的value属性输出 name对应trigger的value属性输出
//                'type': 1,//数据源类型
//                'data': placeData,//数据源,
//                'status': 0
//            });
      var selectArea = new MobileSelectArea2();
      selectArea.init({
        trigger:$('#demo_place'),
//                value:"全部",
        data:placeData,
        position:'bottom',
        level: 2
      });
      getStartPlace();
    }

    //出发路线
    function loadStartRoute() {
      var obj = {};
      obj.action = 'departure';
      validate.validate_submit2("/db/pch/route", obj, startRouteLi);
    }
    //结束路线
    function loadEndRoute(departure) {
      var obj = {};
      obj.action = 'departure';
      obj.departure = departure;
      validate.validate_submit2("/db/pch/route", obj, endRouteLi);
    }
    function startRouteLi() {
      for (var i = 0; i < global_data.data.length; i++) {
        $('.publish_start_slide_ul').append('<li class="publish_slide_li publish_start_slide_li" index=' + i + ' onclick="selectStyleTagsLi(this)">' + global_data.data[i].departure + '</li>')
      }
    }
    function endRouteLi() {
      $('.publish_end_slide_li').remove();
      for (var i = 0; i < global_data.data.length; i++) {
        $('.publish_end_slide_ul').append('<li class="publish_slide_li publish_end_slide_li" index=' + i + ' onclick="selectTagsLi2(this)">' + global_data.data[i].destination + '</li>')
      }


    }
    //选择开始出发城市，进行数据交互
    function selectStyleTagsLi(obj) {
      city_array=[];
      $('.publish_end_city').text("选择目的城市").attr('index', "");
      $(obj).parent().parent().children('.publish_slide_text').text($(obj).text()).attr('index', $(obj).attr('index'));
      loadEndRoute($(obj).text().trim());
      if($(obj).text().trim()=="全部"){
        city_array.push("");
      }else{
        city_array.push($(obj).text().trim());
      }
      city_array.push("");
      findMessage();
    }
    function selectTagsLi2(obj) {
      $(obj).parent().parent().children('.publish_slide_text').text($(obj).text()).attr('index', $(obj).attr('index'));
      var text=$(obj).parent().parent().children('.publish_slide_text').text().trim();
      if(text == "全部" || text =="选择目的城市" || text=="选择出发城市"){
        city_array.splice(1,1,"");
      }else{
        city_array.splice(1,1,$('.publish_end_city').text());
      }
      findMessage();
    }
    //判断是否是修改信息
    function checkId() {
      if (url.indexOf("=") == -1) {
        loadList();
      } else {

        begin_time=url.split('date=')[1].split('&departure_city')[0];
        departure_city=url.split('&departure_city=')[1].split('&destination_city')[0];
        destination_city=url.split('&destination_city=')[1].split('&end')[0];
        departure_city=decodeURI(departure_city);
        destination_city=decodeURI(destination_city);
        city_array.push(departure_city);
        city_array.push(destination_city);
        if(mobile==0){
          var destination_city_text;
          var departure_city_text;
          if(destination_city==""){
            destination_city_text="全部"
          }else{
            destination_city_text=destination_city;
          }
          if(departure_city==""){
            departure_city_text="全部"
          }else{
            departure_city_text=departure_city;
          }
          console.log(begin_time+departure_city+destination_city);
          $('.publish_start_city').text(departure_city_text);
          $('.publish_end_city').text(destination_city_text);
          loadEndRoute(departure_city_text);
        }
        updateMessage(begin_time, departure_city, destination_city)
      }
    }

    //封装传输的信息并提交
    function loadList(page_list) {
      var obj = {};
      obj.action = 'show';
      obj.page = page_list;
      obj.size = size;
      validate.validate_submit('/api/db/passenger/departure', obj, sendMessage);
    }

    function sendMessage() {
      $('.departure_li').remove();
      total=global_data.result.total;
      if( global_data.result.data.length==0){
        $('.not_message').css('display','inline-block');
        checkCookie();
      }else{
        insertMessage();
        $('.not_message').css('display','none');
        checkCookie();

      }
      checkList();
    }
    function sendPageMessage() {
      total=global_data.result.total;
      if( global_data.result.data.length==0){
        $('.not_message').css('display','inline-block');
        checkCookie();
      }else{
        insertMessage();
        $('.not_message').css('display','none');
        checkCookie();

      }
      checkList();
    }
    //添加用户数据
    function insertMessage() {
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
        var is_editor = global_data.result.data[i].is_editor;//id
        var create_time = global_data.result.data[i].create_time;//id
        var info_status = is_editor;


        var insert_time = start_time.substring(0, 10);
        var time_change = insert_time.split('-');
        insert_time = time_change[1] + '月' + time_change[2] + '日';

        var begin_create_time = create_time.substring(11, 16);
        create_time = create_time.substring(0, 10);
        var time_create = create_time.split('-');
        create_time = time_create[1] + '月' + time_create[2] + '日';


        var begin_start_time = start_time.substring(11, 16);
        var begin_end_time = end_time.substring(11, 16);

        addDisplay(description,i, create_time, begin_create_time, begin_end_time, begin_start_time, info_status, insert_time, departure_city, destination_city, departure, destination,
                inits_seats, id);

        if (departure == "") {
          $($('.begin_city')[(page_list*size)+i]).hide();
        }
        if (destination == "") {
          $($('.end_city')[(page_list*size)+i]).hide();
        }
        if (description == "") {
          $($('.departure_li_car_type')[(page_list*size)+i]).hide();
        }

      }
    }

    function addDisplay(description,i, create_time, begin_create_time, begin_end_time, begin_start_time, info_status, insert_time, departure_city, destination_city, departure, destination,
                        inits_seats, id) {
      $('.departure_ul').append('<li class="departure_li" id=' + id + ' onclick="toDetail(this)">' +
//              '<span class="departure_li_status">' + info_status + '</span>' +
              '<div class="departure_li_city">' +
              '<span>' + departure_city + '</span><span class="begin_city" style="color:#999794"><i class="circle"></i>' + departure + '</span>' +
              '<span>——</span>' +
              '<span>' + destination_city + '</span><span class="end_city" style="color:#999794"><i class="circle"></i>' + destination + '</span>' +
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
              '<span class="departure_time_seat">订座' + inits_seats + '&nbsp;个</span>' +
              '</div>' +
              '<div class="departure_li_style departure_li_car_type">' +
              '<img src="/resource/images/pc_icon_beihzu.png" class="departure_li_style_img">' +
              '<span class="departure_li_type">' + description + '</span>' +
              '</div>' +
              '</li> ')
    }
    function toDetail(obj){
      $(obj).addClass('departure_li_active');

      index.push($(obj).attr('id'));
      $.cookie("index_li",index);
      window.location.href="/laihui/passenger/order_info?id="+$(obj).attr('id');

    }
    function checkCookie(){
      if ($.cookie("index_li")!= null){
        var num = $.cookie("index_li");
        for(var i=0;i<$(".departure_li").length;i++){
          if($($(".departure_li")[i]).attr('id')==num){
            $($(".departure_li")[i]).addClass("departure_li_active");
          }
        }

      }
    }
    //获取出发地数据
    function getStartPlace() {
      var data_obj = {};
      data_obj.action = 'show_all';
      validate.validate_submit('/db/pch/route', data_obj, carPlace.addCarStart);
    }

    //车辆行程信息2
    var carPlace = (function () {
//            //将车辆行程信息据封装进数组
      function addCarStart() {
        var data1 = global_data.result;
        var contact = new Object();
        contact.id = -1;
        contact.name = "全部";
        contact.child = [{id:-11,name:""}];
        placeData.push(contact);
        for (var i = 0; i < data1.data.length; i++) {
          var departure1 = data1.data[i].name;
          var departure_id = data1.data[i].id;
          var contact = new Object();
          contact.id = departure_id;
          contact.name = departure1;
          var array_end = [];
          for (var j = 0; j < data1.data[i].child.length; j++) {
            var name = data1.data[i].child[j].name;
            var id = data1.data[i].child[j].id;
            var obj_array = new Object();
            obj_array.id = id;
            obj_array.name = name;
            array_end.push(obj_array);
          }
          contact.child = array_end;
          placeData.push(contact);
        }
      };

      return {
        addCarStart: addCarStart
      }
    })();

    //显示下拉
    function showTagsUl(obj) {
      $(obj).children('.publish_slide_ul').toggle();
    }
    function selectTagsLi(obj) {
      $(obj).parent().parent().children('.publish_slide_text').text($(obj).text()).attr('index', $(obj).attr('index'));
      $(obj).parent().parent().children('input').val($(obj).text());
      findMessage();
    }
    //查找信息
    function findMessage() {
      var obj = {};
      var start_time_status = $('.publish_status').attr('index');
      var start_time;
      var departure_city = "";
      var destination_city = "";
      var title_city;
      page_list = 0;

      if (start_time_status == "") {
        if($('.publish_status').text()=="" || $('.publish_status').text().trim()=="全部" || $('.publish_status').text().trim()=="出发时间"){
          start_time = "";
        }else{
          start_time = $('.publish_status').text();
        }
      } else {
        start_time = $('.publish_status').text().substring(3, 13);
      }
      if (city_array.length >0 ) {
        departure_city = city_array[0];
        destination_city = city_array[1];
        if(departure_city==undefined ||departure_city=="" ||departure_city =="全部"){
          departure_city="";
          destination_city="";
          title_city="来回拼车-拼车信息汇";
        }else{
          title_city="来回拼车："+departure_city+"-"+destination_city+"拼车信息";
        }
      }else{

        title_city="来回拼车-拼车信息汇";
      }

      obj.action = 'show';
      obj.date = start_time;
      obj.departure_city = departure_city;
      obj.destination_city = destination_city;
      validate.validate_submit('/api/db/passenger/departure', obj, sendMessage);
      url = "my_order_list?date=" + start_time + "&departure_city=" + departure_city + "&destination_city=" + destination_city+"&end";
      changeUrl(url);
      $(document).attr("title",title_city);
      pageTitle=$(document).attr('title');
    }

    //查找信息
    function updateMessage(time, departure_city, destination_city) {
      var obj = {};
      var title_city;

      if (departure_city=="") {
        title_city="来回拼车-拼车信息汇";
      }else{
        title_city="来回拼车："+departure_city+"-"+destination_city+"拼车信息";
      }


      if(departure_city==""){
        $('#demo_place').val("全部");
      }else{
        if(destination_city==""){
          $('#demo_place').val(departure_city+" 全部");
        }else{
          $('#demo_place').val(departure_city+"——"+destination_city);
        }

      }
      if(time==""){
        $('.publish_status').text('全部');
      }else{

        $('.publish_status').text(time);
      }
      obj.action = 'show';
      obj.date = time;
      obj.departure_city = departure_city;
      obj.destination_city = destination_city;
      validate.validate_submit('/api/db/passenger/departure', obj, sendMessage);
      url = "my_order_list?date=" + time + "&departure_city=" + departure_city + "&destination_city=" + destination_city+"&end";
      changeUrl(url);
      $(document).attr("title",title_city);
      pageTitle=$(document).attr('title');

    }

    function changeUrl(url) {
      window.history.pushState("", "", url);
    }
    //发送时间的数据
    function setSendData() {
      var time;
      var str = $('.publish_slide_text').text().substring(0, 2);

      if (str == "今天") {
        time = new Date();
        changeDataStyle(time)
      } else if(str == "明天") {
        var today = new Date();
        var t = today.getTime() + 1000 * 60 * 60 * 24;
        time = new Date(t);
        changeDataStyle(time)
      }else{
        var today = new Date();
        var t = today.getTime() + (1000 * 60 * 60 * 24)*2;
        time = new Date(t);
        changeDataStyle(time)
      }

    }
    //显示今天和明天信息
    function setShowData() {

      var str_time1 = new Date();
      for (var i = 0; i < $('.publish_slide_li_date').length; i++) {
        var obj = {};
        var str_time2 = str_time1.getTime() + (1000 * 60 * 60 * 24) * i;
        var time2 = new Date(str_time2);
        var year2 = time2.getFullYear();
        var month2 = time2.getMonth() + 1;
        var date2 = time2.getDate();

        if(month2.toString().length==1){
          month2="0"+month2;
        }
        if(date2.toString().length==1){
          date2="0"+date2;
        }
        obj.year = year2;
        obj.month = month2;
        obj.date = date2;
        array_date.push(obj);
      }

      for (var j = 0; j < array_date.length; j++) {
        if (j == 0) {
          $($('.publish_slide_li_date')[j]).text("今天(" + array_date[j].year + "-" + array_date[j].month + "-" + array_date[j].date + ")")
        } else if(j==1) {
          $($('.publish_slide_li_date')[j]).text("明天(" + array_date[j].year + "-" + array_date[j].month + "-" + array_date[j].date + ")")
        }else{
          $($('.publish_slide_li_date')[j]).text("后天(" + array_date[j].year + "-" + array_date[j].month + "-" + array_date[j].date + ")")
        }

      }


    }
    //转换日期格式
    function changeDataStyle(time) {
      var year = time.getFullYear();
      var month = time.getMonth() + 1;
      var date = time.getDate();
      send_time = year + "-" + month + "-" + date;
    }

    function toAuthList(){
      window.location.href = "/laihui/passenger/my_order_list";
    }

  </script>
</head>
<body id="backtop">
<div class="hover_all"></div>
<div class="loading_box">
  <img class="loading" src="/resource/images/loading.gif" alt="请等待">
</div>
<div class="hover"></div>
<div class="float_container">
  <div class="float_box">
    <span class="float_box_span"></span>
  </div>
</div>
<img src="/resource/images/pch_logo.png" style="display: none">
<!--回到顶部-->
<div class="backtop">
  <a href="#backtop"><img src="/resource/images/pc_top.png" height="43"></a>
</div>
<div class="departure_list_container">
  <div class="departure_container_top">
    <div class="departure_top_box">
      <%--<span class="departure_top_find_car departure_top_button_active">找车</span>--%>
      <%--<span class="departure_top_find_person">找人</span>--%>
      <img src="/resource/images/pch_logo_findPeople.png" class="departure_top_box_img" alt="来回拼车">
      <span class="departure_top_box_span">河南点融工坊信息技术有限公司</span>
    </div>
  </div>
  <form method="get" id="upload_form" accept-charset="utf-8" onsubmit="return false"
        enctype="multipart/form-data" action="/api/publish?action=create">
    <div class="departure_container_mid">
      <div class="departure_mid_select">
        <div class="publish_slide" onclick="showTagsUl(this)">
          <span class="publish_slide_text publish_status" index="">出发时间</span>
          <input style="display: none" name="time">
          <ul class="publish_slide_ul">
            <li class="publish_slide_li publish_slide_li_date_all" index="" onclick="selectTagsLi(this)">
              全部
            </li>
            <li class="publish_slide_li publish_slide_li_date" index="0" onclick="selectTagsLi(this)">
              今天
            </li>
            <li class="publish_slide_li publish_slide_li_date" index="-1" onclick="selectTagsLi(this)">
              明天
            </li>
            <li class="publish_slide_li publish_slide_li_date" index="1" onclick="selectTagsLi(this)">
              后天
            </li>
          </ul>
          <div class="down1"></div>
        </div>
        <div class="publish_li_click">
          <input type="button" id="demo_place" value="起止城市选择" readonly="true" class="input_disabled"
                 name="route"/>
        </div>
        <div class="publish_list_box2">
          <div class="publish_list2">
            <div class="publish_slide2" onclick="showTagsUl(this)">
              <span class="publish_slide_text publish_start_city" index="">选择出发城市</span>
              <ul class="publish_slide_ul publish_start_slide_ul">
                <li class="publish_slide_li publish_slide_li_all" index="" onclick="selectStyleTagsLi(this)">
                  全部
                </li>
              </ul>
              <div class="down1"></div>
            </div>
          </div>
          <img src="/resource/images/pch_icon_to.png" class="publish_icon_to2">

          <div class="publish_list2">
            <div class="publish_slide2" onclick="showTagsUl(this)">
              <span class="publish_slide_text publish_end_city" index="">选择目的城市</span>
              <ul class="publish_slide_ul publish_end_slide_ul">
                <li class="publish_slide_li publish_slide_li_type" index="" onclick="selectTagsLi2(this)">
                  全部
                </li>
              </ul>
              <div class="down1"></div>
            </div>
          </div>
        </div>
        <div class="clear"></div>
      </div>
    </div>
  </form>
  <div class="departure_container_list">
    <ul class="departure_ul">
      <span class="not_message">暂无发布信息</span>
    </ul>
  </div>
</div>
<%--底部--%>
<jsp:include page="footer.jsp" flush="true"></jsp:include>
<div class="bottom_menu " onclick="changeMenu(this)">
  <img src="/resource/images/pch_icon_right_to.png" class="menu_style_icon menu_style_active">
</div>
<div class="message_bottom">
  <div class="message_bottom_type" onclick="toList()">
    <div class="img_box">
      <img src="/resource/images/pch_icon_menu_car.png" class="icon_style icon_car">
    </div>
    <span>找车</span>
  </div>
  <div class="message_bottom_type menu_active" onclick="toAuthList()">
    <div class="img_box">
      <img src="/resource/images/pch_icon_menu_people_active.png" class="icon_style icon_people">
    </div>
    <span>找人</span>
  </div>
  <div class="message_bottom_type " onclick="toMine()">
    <div class="img_box">
      <img src="/resource/images/pch_icon_menu_me.png" class="icon_style icon_mine">
    </div>
    <span>我的</span>
  </div>
</div>

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
      title: pageTitle, // 分享标题
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
      title: pageTitle, // 分享标题
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
      title: pageTitle, // 分享标题
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
      title: pageTitle, // 分享标题
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
