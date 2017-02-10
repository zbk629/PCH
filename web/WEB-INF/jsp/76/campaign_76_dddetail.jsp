<%--
  Created by IntelliJ IDEA.
  User: super
  Date: 2017/2/10
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>订单详情</title>
    <link rel="stylesheet" href="/resource/76/css/default.css">
</head>

<body class="bg1">

<div>
    <div class="dd-state">
        <!--div class="dd-state-text"><span class="daizhifu">&nbsp;</span>待付款</div-->
        <!--div class="dd-state-text"><span class="daifahuo">&nbsp;</span>待发货</div-->
        <!--div class="dd-state-text"><span class="daishouhuo">&nbsp;</span>待收货</div-->
        <div class="dd-state-text"><span class="yiwancheng">&nbsp;</span>已完成</div>
        <div class="dd-state-kddh">顺丰: 231212312123</div>
    </div>

    <div class="ddlist-i pd5">
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
                <div class="ddlist-item-img"><img src="images/gg1.jpg"/> </div>
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
    </div>

    <div class="dd-hj">
        <div class="dd-hj-item">
            <div class="t">商品合计</div>
            <div class="p">￥180</div>
        </div>
        <div class="dd-hj-item">
            <div class="t">实付</div>
            <div class="p"><strong>￥180</strong></div>
        </div>
    </div>

    <div class="dd-info">
        <div class="dd-info-item">
            <div class="t">订单编号</div>
            <div class="c">1231212312</div>
        </div>
        <div class="dd-info-item">
            <div class="t">成交时间</div>
            <div class="c">2017-01-03 11:39:47</div>
        </div>
    </div>

    <div class="dd-kf">客服电话: <a href="tel:168********">168********</a></div>


</div>


<script src="/resource/76/js/jquery3.1.1-min.js"></script>
</body>
</html>
