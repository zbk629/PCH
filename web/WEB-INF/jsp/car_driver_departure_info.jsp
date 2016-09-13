<%--
  Created by IntelliJ IDEA.
  User: zhu
  Date: 2016/7/25
  Time: 15:06
  des：移动端--车主发布信息详情页面
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
        /*预约操作*/
        .booking_span{
            display: inline-block;
            background-color: #f5ad4e;
            color: #fff;
            border-radius: 5px;
            padding: 0 2rem;
        }
        .close_booking{
            position: absolute;
            right: 1rem;
            top: 0;
            font-size: 24px;
            color: #999;
        }
        .booking_top{
            text-align: center;
            margin-top: 1rem;
            margin-bottom: 1.6rem;
            position: relative;
        }
        .booking_container{
            margin: 1rem 0;
            position: relative;
            overflow: hidden;
        }
        .input_style{
            padding: 0 .6rem;
            border-bottom: 1px solid #f5ad4e;
            width: 100%;
            font-size: 1.5rem;
            line-height: 3.2rem;
        }
        .booking_bottom{
            text-align: center;
            color: #fff;
            background-color: #f5ad4e;
            border-radius: 5px;
            line-height: 3.2rem;
            cursor: pointer;
        }
        .booking_bottom:hover{
            background-color: #FF8F0c;
        }
        .booking_li{
            margin-bottom: .8rem;
            position: relative;
        }
        .booking_box{
            font-size: 1.5rem;
        }
        .booking_error{
            position: absolute;
            top: 4rem;
            font-size: 1.3rem;
            color: #e74c3c;
            left: 2rem;
        }
        .success_tip{
            color: #27ae60;
            font-size: 1.6rem;
            text-align: center;
            margin-top: 1rem;
        }
        .success_href{
            margin-top: 2rem;
            display: block;
            text-align: center;
            color: #f5ad4e;
            text-decoration: underline;
        }

        /*搜索样式*/
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
            width: 100%;
        }

        .publish_route_li {
            padding: .2rem .4rem;
            height: 2.6rem;
            line-height: 1.4rem;
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
            $(document).click(function(e){
                e = window.event || e;
                var obj = e.srcElement || e.target;
                if($(obj).is(".publish_route_ul")) {
                }else{
                    $(".publish_route_ul").fadeOut(100);
                }
            });
        });
        var url = window.location.href;
        /*var role=${role};*/
        var role=<%=request.getSession().getAttribute("role")%>;
        var item_id = url.split("?id=")[1];
        item_id = item_id.split("&")[0];
        var click_type;
        var city_array=[];
        var send_array = [];
        var global_start_time;
        var global_mobile;
        var global_driver_id;
        var user_id=86;
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
            validate.validate_submit('/api/db/departure', obj, insertMessage);
        }
        //更新信息
        function sendMessage(status) {
            var obj = {};
            obj.action = 'update';
            obj.id = item_id;
            obj.info_status = status;
            validate.validate_submit('/api/db/departure', obj, updateMessage);
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
                    global_driver_id = global_data.result.data[i].driver_id;//id
                    global_start_time = start_time;
                    global_mobile = mobile;
                    if (info_status == 1) {
                        $($('.item_seat_status')[i]).css('color','#2ecc71');
                        info_status = "有空位";
                        click_type=0;
                    } else if (info_status == 2) {
                        $($('.item_seat_status')[i]).css('color','#e74c3c');
                        info_status = "已满";
                        click_type=1;
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
                    points= points.replace(/丶/g, " - ");
                    tag_yes_content= tag_yes_content.replace(/丶/g, "、");
                    tag_no_content= tag_no_content.replace(/丶/g, "、");
                    var mobile_array=[];
                    mobile_array = mobile.split(',');
//                    for(var i=0;i<mobile_array.length;i++){
//                            $('.mobile_clear').append('<a href="tel:'+mobile_array[i]+'" class="call_driver">' +
//                                    '<div class="publish_message_li_moblie">'+
//                                    '<span class="item_mobile">'+mobile_array[i]+'</span>'+
//                                    '<img src="/resource/images/pc_icon_mobile.png" class="mobile">'+
//                                    '</div>'+
//                                    '<div class="clear"></div>'+
//                                    '</a>'
//                            )
//                    }

                    $('.departure_city').text(departure_city);
                    $('.destination_city').text(destination_city);
                    $('.item_tips_span').text(description);
                    $('.item_mouth').text(insert_time);
                    $('.item_start_end_times').text(begin_start_time + "-" + begin_end_time);
                    $('.item_seat_status').text(info_status);
                    $('.item_seat').text(inits_seats + "个");
                    $('.item_yes_tips_span').text(tag_yes_content);
                    $('.item_no_tips_span').text(tag_no_content);
                    $('.item_name').text(driving_name);
                    $('.item_points').text(points);
                    $('.item_type').text(car_brand);
//                    $('.call_driver_bottom').attr('href', 'tel:' + mobile_array[0]);

                    if (driving_name == "") {
                        $('.item_name_li').remove()
                    }
                    if (points == "") {
                        $('.item_points_li').remove()
                    }
                    if (description == "") {
                        $('.item_tips').remove();
                        $('.li_change').addClass('li_last')
                    }
                    if (tag_yes_content == "") {
                        $('.item_yes_tips').remove()
                    }
                    if (tag_no_content == "") {
                        $('.item_no_tips').remove()
                    }
                    if(description=="" && tag_yes_content=="" && tag_no_content==""){
                        $('.item_tips_li').remove()
                    }
                    if (car_brand == "") {
                        $('.item_type_li').remove()
                    }
//                var array_points = points.split("丶");
//                for (var j = 0; j < array_points.length; j++) {
//                    $('.publish_message_li_route').append('<li class="publish_route_box_li">' +
//                            '<span class="publish_route_box_li_span">' + array_points[j] + '</span>' +
//                            '<div class="line_container">' +
//                            '<div class="line_slide"></div>' +
//                            '<div class="line_circle"></div>' +
//                            '</div>' +
//                            '</li>')
//                }

                    if (car_brand == "") {
                        $($('.departure_li_car_type')[i]).remove();
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
            if($('.item_seat_status').text().trim() == "有空位"){
                $('.float_message_mid').children('div').removeClass('set_active');
                $('.set_have').addClass('set_active');
            }else if($('.item_seat_status').text().trim() == "已满"){
                $('.float_message_mid').children('div').removeClass('set_active');
                $('.set_full').addClass('set_active');
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
            if($(obj).attr('index')==1){
                $('.float_message_mid').children('div').removeClass('set_active');
                $('.set_full').addClass('set_active');
                $('.float_sure').css('color','#e74c3c');
                $('.float_message_mid').hide();
                $('.float_message_mid2').show().children('span').text("确定修改状态为已满？修改过后将不再有乘客预约此次行程！");
            }else if($(obj).attr('index')==2){
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
        function showBooking(){
            $('.hover').fadeIn(200);
            $('.float_container').fadeIn(200);
            $('.float_container').empty().append('<div class="booking_box">' +
                    '<div class="close_booking" onclick="removeFloatMessage()">x</div>' +
                    '<p class="booking_top">填写出行信息，方便车主与您取得联系</p>' +
                    '<span class="booking_error"></span>'+
                    '<div class="booking_container">' +
                    '<div class="booking_li">' +
                    '<input placeholder="请输入上车地点" type="text" index="0" class="input_style booking_start" onchange="removeErrorTips()" oninput="sendKeepDownInput(this)">' +
                    '<ul class="publish_route_ul"></ul>'+
                    '</div>' +
                    '<div class="booking_li">' +
                    '<input placeholder="请输入下车地点" type="text" index="1" class="input_style booking_end" onchange="removeErrorTips()" oninput="sendKeepDownInput(this)">' +
                    '<ul class="publish_route_ul"></ul>'+
                    '</div>' +
                    '<div class="booking_li">' +
                    '<input placeholder="请输入座位数" type="tel" class="input_style booking_seat" value="1" onchange="removeErrorTips()">' +
                    '</div>' +
                    '<div class="booking_li">' +
                    '<input placeholder="备注信息(例如不抽烟，有小件)" type="text" class="input_style booking_description" onchange="removeErrorTips()">' +
                    '</div>' +
                    '</div>' +
                    '<div class="booking_bottom" onclick="checkInput()">提交预约</div>' +
                    '</div>');
        }
        function checkInput(){
            if($('.booking_start').val()==""){
                showErrorTips("上车地点不能为空");
            }else if($('.booking_end').val()==""){
                showErrorTips("下车地点不能为空");
            }else if($('.booking_seat').val()==""){
                showErrorTips("座位数不能为空");
            }else{
                removeErrorTips();
                sendMobileMessage()
            }
        }

        function showErrorTips(error_message){
            $('.booking_error').text(error_message).show();
        }
        function removeErrorTips(){
            $('.booking_error').hide();
        }
        function sendMobileMessage(){
            var description = $('.booking_description').val();
            var data_obj={};
            var boarding_point = $('.booking_start').val();
            var breakout_point = $('.booking_end').val();
            var booking_seats = $('.booking_seat').val();
            data_obj.action="booking";
            data_obj.description=description;
            data_obj.boarding_point=boarding_point;
            data_obj.breakout_point=breakout_point;
            data_obj.start_time=global_start_time;
            data_obj.mobile=global_mobile;
            data_obj.user_id=user_id;
            data_obj.booking_seats=booking_seats;
            data_obj.order_id=item_id;
            data_obj.driver_id=global_driver_id;

            $.ajax({
                type: "POST",
                url: '/api/db/passenger/departure',
                data: data_obj,
                async: false,
                dataType: "json",
                success: function (data) {
                    if (data.status == true) {
                        global_data = data.result;
                        console.log("交互成功");
                        success();
                    } else {
                        var code=data.result.errcode;
                        if(code==401){
                            //
                            showFloatStyle(data.message);
                        }else if(code==403){
                            showFloatStyle(data.message);
                            setTimeout(function () {
                                window.location.href="/auth/base"
                            }, 1000);
                        }

                    }
                },
                error: function () {
                    displayErrorMsg(data.message);
                }
            })
        }
        function success(){
            $('.float_container').empty().append('<div class="booking_box">' +
                    '<div class="close_booking" onclick="removeFloatMessage()">x</div>' +
                    '<div class="success_tip">预约成功</div>' +
                    '<a href="/laihui/passenger/my_booking_list" class="success_href">查看我的预约</a>' +
                    '</div>');
        }

        //按键请求城市信息
        function sendKeepDownInput(obj) {
                if($(obj).val() ==""){
                    $(obj).parent().children('.publish_route_ul').empty()
                }else{
                    $('.publish_route_ul').hide();
                    $(obj).parent().children('.publish_route_ul').show();
                    var key = $(obj).val().trim();
                    if($(obj).attr('index')==0){
                        var city = $('.departure_city').text();
                    }else{
                        var city = $('.destination_city').text();
                    }
                    sendMessage(key, city);
                }
        }
        //发送ajax获取城市信息
        function sendMessage(key, city) {
            var obj = {};
            obj.key = key;
            obj.city = city;
            var url = "/place_suggestion";
            validate.baidu_api(url, obj, pushToArray);
        }
        //将信息存入数组
        function pushToArray() {
            city_array = [];
            for (var i = 0; i < global_data.result.length; i++) {
                city_array.push(global_data.result[i]);
            }
            addCitySlide(city_array);
        }
        //添加城市下拉列表样式
        function addCitySlide(city_array) {
            $('.publish_route_li').remove();
            for (var i = 0; i < city_array.length; i++) {
                var name = city_array[i].name;
                var city = city_array[i].city;
                var district = city_array[i].district;
                var index = i;
                addCitySlideStyle(name, city, district, index);
            }
        }
        //添加城市下拉列表样式
        function addCitySlideStyle(name, city, district, index) {
            $('.publish_route_ul').append('<li class="publish_route_li" index=' + index + ' onclick="selectCity(this)">' +
                    '<span class="key">'+name+'</span>' +
                    '<span class="city" style="color: #999794">'+city+district+'</span>' +
                    '</li>')
        }
        //选择城市
        function selectCity(obj) {
            //显示用的数据
            var name = $(obj).children('.key').text();
            var city = $(obj).children('.city').text();
            var number = $(obj).parent().parent().children('.place_city').attr('index');
            $(obj).parent().parent().children('input').val(name+" "+city);
            $(obj).parent().hide();
            send_array.splice(number,1,city_array[$(obj).attr('index')]);
        }
        //显示途径和下滑菜单
        function slideCity() {

            $('.publish_li_route').show();
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
                <div class="set_full" index="1" onclick="click_type=2;showFullTips(this)">
                    <span>已满</span>
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
        <span style="font-size: 1.6rem">来回拼车--车主信息</span>
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
                    <span>车主姓名</span>
                </div>
                <div class="publish_message_li_right">
                    <span class="item_name"></span>
                </div>
                <div class="clear"></div>
            </li>

            <li class="publish_message_li" onclick="showBooking()">
                <div class="publish_message_li_left">
                    <span>是否预定</span>
                </div>
                <div class="publish_message_li_right mobile_clear">
                    <span class="booking_span">预定</span>
                </div>
                <div class="clear "></div>
            </li>

            <li class="publish_message_li item_points_li">
                <div class="publish_message_li_left">
                    <span>途径</span>
                </div>
                <div class="publish_message_li_right publish_message_li_route">
                    <span class="item_points"></span>
                </div>
                <div class="clear"></div>
            </li>

            <li class="publish_message_li item_type_li">
                <div class="publish_message_li_left">
                    <span>车型</span>
                </div>
                <div class="publish_message_li_right">
                    <span class="item_type"></span>
                </div>
                <div class="clear"></div>
            </li>
            <li class="publish_message_li li_change">
                <div class="publish_message_li_left">
                    <span>可用座位</span>
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
                        <br>
                    </span>
                    <span class="item_yes_tips">
                        <span class="item_yes_tips_span">

                        </span>
                        <br>
                    </span>
                    <span class="item_no_tips">
                        <span class="item_no_tips_span">

                        </span>
                        <br>
                    </span>
                </div>
                <div class="clear"></div>
            </li>
        </ul>
    </div>
    <a href="javascript:(0)" class="call_driver_bottom not_driver" style="display:none;" onclick="showBooking()">
        <div class="publish_bottom">
            预定座位
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
