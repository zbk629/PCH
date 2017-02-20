<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>订单列表</title>
    <link rel="stylesheet" href="/resource/76/css/default.css">
</head>
<style>
    a {
        -webkit-tap-highlight-color: transparent;
    }

    .not_message {
        display: block;
        text-align: center;
        color: #888;
        font-size: 24px;
        margin-top: 50px;
        display: none;
    }
    .list_active{
        border-bottom: 2px solid #f5ad4e!important;
    }
    .delete_list{
        float: left;
        background: #F5AD4E;
        color: #fff;
        height: 30px;
        line-height: 30px;
        width: 80px;
        text-align: center;
        margin-top: 5px;
        border-radius: 5px;
    }
    .hover_all {
        z-index: 10;
        display: none;
        position: fixed;
        width: 200%;
        height: 500%;
        top: -200%;
        background-color: rgba(0, 0, 0, 0.4);
        left: -50%;
    }
    .express_box{
        margin-top: 10px;
        font-size: 14px;
        color: #888;
    }
    .express_box span{
        line-height: 20px;
    }
</style>
</head>
<body class="bg1">
<div class="hover_all">
</div>
<div class="layer-tip">
    <div class="title">温馨提示</div>
    <div class="con" id="js-layer-tipcon">请选择一些商品再结算吧</div>
    <div class="op">
        <span class="op-cancel">取消</span>
        <span class="op-ok">确定</span>
    </div>
</div>
<div>

    <div class="ddlist-t">
        <a class="list_menu" href="javascript:(0)" data_type="0">待支付</a>
        <a class="list_menu list_active" href="javascript:(0)" data_type="1">待发货</a>
        <a class="list_menu" href="javascript:(0)" data_type="2">待收货</a>
        <a class="list_menu" data_type="3" href="javascript:(0)">全部</a>
    </div>

    <div class="order_container">
        <span class="not_message">暂无数据</span>
    </div>

</div>


<script src="/resource/js/style.js"></script>
<script src="/resource/76/js/jquery3.1.1-min.js"></script>
<script>
    $(document).ready(function () {
        $('.list_menu').click(function () {
            $('.list_menu').removeClass('list_active');
            $(this).addClass('list_active');
            type = $(this).attr('data_type');
            loadMessage();
        });
        $(".op-cancel").click(function () {
            $("#mask2").hide();
            $(this).parents(".layer-tip").hide();
            $('.hover_all').hide()
        });
        $(".op-ok").click(function () {
            $("#mask2").hide();
            $(this).parents(".layer-tip").hide();
            $('.hover_all').hide()
            delectList();
        });
        loadMessage();
    });
    var url = window.location.href;
    var order_mobile = url.split("mobile=")[1];
    order_mobile = order_mobile.split("&")[0];
    var type=0;

    var global_id;
    //获取列表数据
    function loadMessage() {
        type = $('.list_active').attr('data_type');
        var obj = {};
        obj.action = "show";
        obj.mobile = order_mobile;
        obj.type = type;
        validate.validate_submit3('/api/campaign/76', obj, innerMessage);
    }

    function innerMessage() {
        $('.order_box').remove();
        for (var i = 0; i < global_data.result.orders.length; i++) {
            var buyer_description = global_data.result.orders[i].buyer_description;
            var buyer_mobile = global_data.result.orders[i].buyer_mobile;
            var data = global_data.result.orders[i].data;
            var total_price = global_data.result.orders[i].total_price;
            var buyer_location = global_data.result.orders[i].buyer_location;
            var deliver_name = global_data.result.orders[i].deliver_name;
            var create_time = global_data.result.orders[i].create_time.substring(0,10);
            var buyer_name = global_data.result.orders[i].buyer_name;
            var id = global_data.result.orders[i].id;
            var deliver_number = global_data.result.orders[i].deliver_number;
            var data_obj = JSON.parse(data);
            var data_message = "";
            if(type==0){
                data_message = "待支付"
            }else if(type==1){
                data_message = "待发货"
            }else if(type==2){
                data_message = "待收货"
            }else{
                data_message = "全部"
            }

            orderListStyle(data_message,deliver_number, id, buyer_description, buyer_mobile, total_price, buyer_location, deliver_name, create_time, buyer_name);


            for (var j = 0; j < data_obj.data.length; j++) {
                var name = data_obj.data[j].name;
                var price = data_obj.data[j].price;
                var number = data_obj.data[j].number;
                var ke = data_obj.data[j].name.substring(0,3);
                orderList(i,ke,name,price,number)
            }
            if(type==0 || type==1){
                $('.delete_list').show();
                $('.express_box').hide();
            }
            else{
                $('.delete_list').hide();
                $('.express_box').show();
            }

            if (buyer_description == "") {
                $($('.buyer_description')[i]).hide();
            }

        }
    }

    function orderListStyle(data_message,deliver_number, id, buyer_description, buyer_mobile, total_price, buyer_location, deliver_name, create_time, buyer_name) {
        $('.not_message').before('<a href="javascript:(0)" data_id="'+id+'" class="order_box">' +
            '<div class="ddlist-i">' +
            '<div class="ddlist-i-t"><span class="t">'+create_time+'</span><span class="zt">'+data_message+'</span></div>' +
            '<div class="ddlist-i-c order_list">' +
            '</div>' +
            '<div class="express_box">' +
            '<span class="">快递公司：'+deliver_name+'</span><br/>' +
            '<span class="">快递单号：'+deliver_number+'</span>' +
            '</div>' +
            '<span class="delete_list" onclick="showDeleteListTips(this)">删除</span>' +
            '<div class="ddlist-i-b">总计:￥'+total_price+' </div>' +
            '</div>' +
            '</a>');
    }

    function orderList(i,ke,name,price,number){
        var message;
        var message_img;
        if(ke=="五连包"){
            message="130克*5袋";
            message_img="/resource/76/images/a04.jpg";
        }else {
            message="130克*8盒";
            message_img="/resource/76/images/a05.jpg";
        }
        $($('.order_list')[i]).append('<div class="ddlist-item">' +
            '<div class="ddlist-item-img"><img src="'+message_img+'"/> </div>' +
            '<div class="ddlist-item-con">' +
            '<div class="ddlist-item-con-t">'+name+'</div>' +
            '<div class="ddlist-item-con-c">'+message+'</div>' +
            '</div>' +
            '<div class="ddlist-item-cs">' +
            '<div class="ddlist-item-cs-jg">￥'+price+'</div>' +
            '<div class="ddlist-item-cs-sl">×'+number+'</div>' +
            '</div>' +
            '</div>');
    }

    function showDeleteListTips(obj){
        global_id = $(obj).parent().parent().attr('data_id');
        formTip("确认删除？");

    }

    function  delectList(){
        var obj = {};
        obj.action = "delete";
        obj.mobile = order_mobile;
        obj.id = global_id;
        validate.validate_submit3('/api/campaign/76', obj, loadMessage);
    }
    function formTip(message) {
        $("#js-layer-tipcon").html(message);
        $(".layer-tip").css("top", "50%");
        $("#mask2, .layer-tip").show();
        $('.hover_all').show()
    }
</script>
</body>
</html>

