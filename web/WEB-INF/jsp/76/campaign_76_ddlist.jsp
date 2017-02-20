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
</style>
</head>
<body class="bg1">

<div>

    <div class="ddlist-t">
        <a href="">待支付</a>
        <a href="">待发货</a>
        <a href="">待收获</a>
        <a class="active" href="">全部</a>
        <a class="list_menu" href="javascript:(0)" data_type="0">待支付</a>
        <a class="list_menu list_active" href="javascript:(0)" data_type="1">待发货</a>
        <a class="list_menu" href="javascript:(0)" data_type="2">待收获</a>
        <a class="list_menu" data_type="3" href="javascript:(0)">全部</a>
    </div>

    <a href="dddetail.html">
        <div class="ddlist-i">
            <div class="ddlist-i-t"><span class="t">2017-01-16</span> <span class="zt">待发货</span></div>
            <div class="ddlist-i-c">
                <div class="ddlist-item">
                    <div class="ddlist-item-img"><img src="/resource/76/images/gg1.jpg"/> </div>
                    <div class="ddlist-item-con">
                        <div class="ddlist-item-con-t">礼品装(麻辣烩面)</div>
                        <div class="ddlist-item-con-c">12克*12包</div>
                    </div>
                    <div class="ddlist-item-cs">
                        <div class="ddlist-item-cs-jg">￥60</div>
                        <div class="ddlist-item-cs-sl">×1</div>
                    </div>
                </div>
            </div>
            <div class="ddlist-i-b">共计1件 总计:￥60 </div>
        </div>
    </a>

    <a href="dddetail.html">
        <div class="ddlist-i">
            <div class="ddlist-i-t"><span class="t">2017-01-16</span> <span class="zt">待发货</span></div>
            <div class="ddlist-i-c">
                <div class="ddlist-item">
                    <div class="ddlist-item-img"><img src="/resource/76/images/gg1.jpg"/> </div>
                    <div class="ddlist-item-con">
                        <div class="ddlist-item-con-t">礼品装(麻辣烩面)</div>
                        <div class="ddlist-item-con-c">129克*12包</div>
                    </div>
                    <div class="ddlist-item-cs">
                        <div class="ddlist-item-cs-jg">￥60</div>
                        <div class="ddlist-item-cs-sl">×1</div>
                    </div>
                </div>
                <div class="ddlist-item">
                    <div class="ddlist-item-img"><img src="/resource/76/images/gg1.jpg"/> </div>
                    <div class="ddlist-item-con">
                        <div class="ddlist-item-con-t">礼品装(麻辣烩面)</div>
                        <div class="ddlist-item-con-c">130*8盒</div>
                    </div>
                    <div class="ddlist-item-cs">
                        <div class="ddlist-item-cs-jg">￥60</div>
                        <div class="ddlist-item-cs-sl">×2</div>
                    </div>
                </div>
            </div>
            <div class="ddlist-i-b">共计3件 总计:￥180 </div>
        </div>
    </a>

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
        });
        loadMessage();
    });
    var url = window.location.href;
    //    var order_mobile = url.split("order_mobile=")[1];
    //    order_mobile = order_mobile.split("&")[0];
    var type=0;
    //获取列表数据
    function loadMessage() {
        type = $('.list_active').attr('data_type');
        var obj = {};
        obj.action = "show";
        obj.mobile = "13838741272";
        obj.type = 1;
        validate.validate_submit3('/api/campaign/76', obj, innerMessage);
    }

    function innerMessage() {
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


            orderListStyle(deliver_number, id, buyer_description, buyer_mobile, total_price, buyer_location, deliver_name, create_time, buyer_name);


            for (var j = 0; j < data_obj.data.length; j++) {
                var name = data_obj.data[j].name;
                var price = data_obj.data[j].price;
                var number = data_obj.data[j].number;
                var ke = data_obj.data[j].name.substring(0,3);
                orderList(i,ke,name,price,number)
            }


            if (buyer_description == "") {
                $($('.buyer_description')[i]).hide();
            }

        }
    }

    function orderListStyle(deliver_number, id, buyer_description, buyer_mobile, total_price, buyer_location, deliver_name, create_time, buyer_name) {
        $('.not_message').before('<a href="dddetail.html" data_id="'+id+'">' +
            '<div class="ddlist-i">' +
            '<div class="ddlist-i-t"><span class="t">'+create_time+'</span> <span class="zt">待发货</span></div>' +
            '<div class="ddlist-i-c order_list">' +

            '</div>' +
            '<div class="ddlist-i-b">共计1件 总计:￥'+total_price+' </div>' +
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
</script>
</body>
</html>

