<%--
  Created by IntelliJ IDEA.
  User: super
  Date: 2017/2/10
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>76烩面</title>
    <link rel="stylesheet" href="/resource/76/css/mobiscroll.min.css">
    <link rel="stylesheet" href="/resource/76/css/swiper-3.4.1.min.css">
    <link rel="stylesheet" href="/resource/76/css/default.css">

</head>
<body>
<div class="swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="/resource/76/images/banner-5.png"/></div>
        <div class="swiper-slide"><img src="/resource/76/images/banner-6.jpg"/></div>
        <div class="swiper-slide"><img src="/resource/76/images/banner-3.jpg"/></div>
        <div class="swiper-slide"><img src="/resource/76/images/banner-4.jpg"/></div>
    </div>
    <div class="swiper-pagination"></div>
</div>

<div class="ptitle">
    <div><span>热卖</span>76人老烩面，非油炸，手工抻面，和馆子一个味</div>
</div>

<div id="js-pnav" class="pnav">
    <span data-target="#js-xiangqing" class="active">商品详情</span>
    <span data-target="#js-guige">商品规格</span>
</div>
<form id="form" method="post" action="">
    <!--详情-->
    <div id="js-xiangqing">
        <div class="intro">
            <img src="/resource/76/images/a00.jpg"/>
            <div class="w">
                <p>76人老烩面，源自于对一个时代的缅怀与记忆。</p>
                <p>76人是龙的传人，也是承上启下的一代。</p>
                <p>76年，是一个时代的转折点。动荡的岁月即将过去，改革开放即将到来。</p>
                <p>而这碗出锅带辣椒的传统老式烩面，也总让人想起老郑州特有的味道……</p>
                <p>不同于其他速食面饼，76人老烩面是非油炸的，采用手工抻面，和馆子一个味道。无论你远在哪里，随时都能吃到河南的老味道！</p>
                <p>目前，76人烩面已有52家实体店，每天销售15000碗面，历时六年的精心沉淀，只为一筷子到河南！ 送亲戚，送朋友，76人老烩面都是最好的选择！</p>
                <p style="text-align: center;">一筷子到河南</p>
            </div>
            <img src="/resource/76/images/a04.jpg"/>
            <img src="/resource/76/images/a05.jpg"/>
            <img src="/resource/76/images/a02.jpg"/>
            <img src="/resource/76/images/a08.jpg"/>
            <img src="/resource/76/images/a07.jpg"/>
            <img src="/resource/76/images/a06.jpg"/>
            <img src="/resource/76/images/a01.jpg"/>
        </div>
    </div>
    <!--规格-->
    <div id="js-guige" style="display: none;">
        <div class="o">
            <div class="o-item">
                <div class="t">五连包</div>
                <p>单价: 48元</p>
                <p>口味: 麻辣口味</p>
                <p>净含量：面饼+配料130克×5包</p>
            </div>
            <div class="o-item">
                <div class="t">五连包</div>
                <p>单价: 52元</p>
                <p>口味: 咖喱口味</p>
                <p>净含量：面饼+配料130克×5包</p>
            </div>
            <div class="o-item">
                <div class="t">五连包</div>
                <p>单价: 58元</p>
                <p>口味: 滋补口味</p>
                <p>净含量：面饼+配料130克×5包</p>
            </div>
            <div class="o-item">
                <div class="t">礼盒装</div>
                <p>单价: 98元</p>
                <p>口味: 麻辣口味</p>
                <p>净含量：面饼+配料130克×8碗</p>
            </div>
            <div class="o-item">
                <div class="t">礼盒装</div>
                <p>单价: 108元</p>
                <p>口味: 咖喱口味</p>
                <p>净含量：面饼+配料130克×8碗</p>
            </div>
            <div class="o-item">
                <div class="t">礼盒装</div>
                <p>单价: 106</p>
                <p>口味: 滋补口味</p>
                <p>净含量：面饼+配料130克×8碗</p>
            </div>
        </div>
    </div>

    <div class="xd">
        <div style="padding:0 10px;">
            <div class="p-header">
                <div class="p-name">商品种类</div>
                <div class="p-price">单价</div>
                <div class="p-number">购买数量</div>
            </div>
            <div class="p-header list product_list">
                <div class="p-name">五连包(麻辣口味)</div>
                <div class="p-price">48元</div>
                <div class="p-number item">
                    <div class="jian">&nbsp;</div>
                    <div class="np">
                        <input class="inputn" type="number" name="product1" data-price="48" data-productID="0001"
                               maxlength="4" readonly value="0"/>
                    </div>
                    <div class="jia">&nbsp;</div>
                </div>
            </div>
            <div class="p-header list product_list">
                <div class="p-name">五连包(咖喱口味)</div>
                <div class="p-price">52元</div>
                <div class="p-number item">
                    <div class="jian">&nbsp;</div>
                    <div class="np">
                        <input class="inputn" type="number" name="product2" data-price="52" data-productID="0002"
                               maxlength="4" readonly value="0"/>
                    </div>
                    <div class="jia">&nbsp;</div>
                </div>
            </div>
            <div class="p-header list product_list">
                <div class="p-name">五连包(滋补口味)</div>
                <div class="p-price">58元</div>
                <div class="p-number item">
                    <div class="jian">&nbsp;</div>
                    <div class="np">
                        <input class="inputn" type="number" name="product3" data-price="58" data-productID="0003"
                               maxlength="4" readonly value="0"/>
                    </div>
                    <div class="jia">&nbsp;</div>
                </div>
            </div>
            <div class="p-header list product_list">
                <div class="p-name">礼盒装(麻辣口味)</div>
                <div class="p-price">98元</div>
                <div class="p-number item">
                    <div class="jian">&nbsp;</div>
                    <div class="np">
                        <input class="inputn" type="number" name="product4" data-price="98" data-productID="0004"
                               maxlength="4" readonly value="0"/>
                    </div>
                    <div class="jia">&nbsp;</div>
                </div>
            </div>
            <div class="p-header list product_list">
                <div class="p-name">礼盒装(咖喱口味)</div>
                <div class="p-price">108元</div>
                <div class="p-number item">
                    <div class="jian">&nbsp;</div>
                    <div class="np">
                        <input class="inputn" type="number" name="product5" data-price="108" data-productID="0005"
                               maxlength="4" readonly value="0"/>
                    </div>
                    <div class="jia">&nbsp;</div>
                </div>
            </div>
            <div class="p-header list last product_list">
                <div class="p-name">礼盒装(滋补口味)</div>
                <div class="p-price">106元</div>
                <div class="p-number item">
                    <div class="jian">&nbsp;</div>
                    <div class="np">
                        <input class="inputn" type="number" name="product6" data-price="106" data-productID="0006"
                               maxlength="4" readonly value="0"/>
                    </div>
                    <div class="jia">&nbsp;</div>
                </div>
            </div>
        </div>

        <div class="fb">
            <div class="fb-i">
                <div class="fb-i-t">
                    <div class="tongji-t">合计:<span><strong>￥</strong><strong id="js-zongji">0</strong></span></div>
                </div>
                <div class="fb-i-n">
                    <div id="js-yuofei" class="tongji-y">含邮费<strong>20</strong>元(满<strong>60</strong>包邮)</div>
                </div>
            </div>
            <div id="js-jiesuan" class="" onclick="saveMessage()">结算</div>
        </div>

    </div>

    <div class="fb fixed">
        <div class="fb-i">
            <div class="fb-i-t">一筷子到河南</div>
            <div class="fb-i-n">短暂烩面，长久想念</div>
        </div>
        <div id="js-qxd" class="">带TA回家</div>
    </div>

    <!--
    收货地址
    支付方式
    -->
    <div class="fk">
        <div class="fk-item">
            <div class="label">收货地址:</div>
            <input id="city" name="city" type="text" placeholder="请选择收获地址" readonly class="fk-item-input"/>
        </div>
        <div class="fk-item">
            <div class="label">详细地址:</div>
            <input id="address" type="text" name="address" placeholder="请填写详细地址" value="华城国际" class="fk-item-input"/>
        </div>
        <div class="fk-item">
            <div class="label">收件人:</div>
            <input id="username" type="text" name="username" placeholder="请填写收件人" value="正式在下" class="fk-item-input"/>
        </div>
        <div class="fk-item">
            <div class="label">手机号:</div>
            <input id="mobile" type="tel" name="mobile" placeholder="请填写手机号" value="13838741272" class="fk-item-input"/>
        </div>
        <div class="fk-item">
            <div class="label">备注信息:</div>
            <input id="remark" type="text" name="remark" placeholder="备注信息" value="快点送" class="fk-item-input"/>
        </div>
        <div class="zf">
            <div class="zf-t">支付方式</div>
            <label class="zf-i zfb_label" for="zfb">
                <input type="radio" name="zfsf" value="0" id="zfb" checked>
                <div class="zf-i-s">&nbsp</div>
                <div class="zf-i-i zfb"></div>
                <div class="zf-i-t">支付宝</div>

            </label>
            <label class="zf-i wx_label" for="wx">
                <input type="radio" name="zfsf" value="1" id="wx">
                <div class="zf-i-s">&nbsp</div>
                <div class="zf-i-i wx"></div>
                <div class="zf-i-t">微信</div>

            </label>
        </div>
    </div>

    <div class="fb fixed fkb">
        <div class="fb-i">
            <div class="fkb-productFee">总计<strong>￥</strong><strong id="js-fkb-Fee">300</strong></div>
        </div>
        <div id="js-qzf" class="">去支付</div>
    </div>

</form>
<div style="height:50px;"></div>
<div id="mask"></div>

<div id="mask2"></div>
<div class="layer-tip">
    <div class="title">温馨提示</div>
    <div class="con" id="js-layer-tipcon">请选择一些商品再结算吧</div>
    <div class="op">
        <span class="op-ok">好的</span>
    </div>
</div>
<script src="/resource/js/style.js"></script>

<script src="/resource/76/js/jquery3.1.1-min.js"></script>
<script src="/resource/76/js/mobiscroll.min.js"></script>
<script src="/resource/76/js/mobiscroll.i18n.zh.min.js"></script>
<script src="/resource/76/js/swiper-3.4.1.jquery.min.js"></script>
<script src="/resource/76/js/jweixin-1.0.0.js"></script>

<script>

    var mySwiper = new Swiper('.swiper-container', {
        loop: true,

        // 如果需要分页器
        pagination: '.swiper-pagination'
    })

    $(document).ready(function () {
        $('.fk-item').click(function () {
            $(this).find('input').focus();
        })

        checkUser();
    })


</script>

<script>
    /*==========================
     常用函数
     ==========================*/
    function checker() {
        var validators = Array.prototype.slice.call(arguments, 0);

        return function (obj) {
            return Array.prototype.reduce.call(validators, function (errs, check) {
                if (check(obj)) {
                    return errs;
                } else {
                    errs.push(check.message);
                    return errs;
                }
            }, [])
        }
    }
    function validator(message, fun) {
        var f = function () {
            return fun.apply(fun, arguments);
        };
        f['message'] = message;
        return f;
    }
    function existy(variableName) {
        try {
            if (typeof(variableName) == "undefined") {
                return false;
            } else {
                return true;
            }
        } catch (e) {
        }
        return false;
    }
    function inputValueIsValid(value) {
        if (value === null || value == '') {
            return false;
        }
        return existy(value);
    }
    //验证手机号
    function inputCheckPhone(value) {
        if ((/^1[34578]\d{9}$/.test(value))) {
            return true;
        }
        return false;
    }

    var feikongChecker = checker(validator(true, inputValueIsValid));
    var mobileChecker = checker(validator("手机号不能为空", inputValueIsValid), validator("手机号不正确", inputCheckPhone));

    function formTip(message) {
        $("#js-layer-tipcon").html(message);
        $(".layer-tip").css("top", "50%");
        $("#mask2, .layer-tip").show();
    }
</script>
<script>
    var productFee = 0;
    var data_json = "";
    var data_array = [];
    var data_mobile;
    $(function () {
        $("#js-pnav span").click(function () {
            var $this = $(this);
            $("#js-xiangqing, #js-guige").hide();
            console.log($this.attr("data-target"));
            $($this.attr("data-target")).show();
            $this.addClass("active").siblings().removeClass("active");

        });

        //商品总金额


        //带TA回家点击后进入商品规格选择
        $qxd = $("#js-qxd");


        $jiesuan = $("#js-jiesuan");
        $zongji = $("#js-zongji");

        /*==========================
         数据提交
         ==========================*/
        $("#js-qzf").click(function () {
            if (feikongChecker($("#city").val()).length != 0) {
                formTip("请选择城市");
                return;
            }
            if (feikongChecker($("#address").val()).length != 0) {
                formTip("请填写详细地址");
                return;
            }
            if (feikongChecker($("#username").val()).length != 0) {
                formTip("请填写收件人");
                return;
            }
            var mobilemessage = mobileChecker($("#mobile").val());
            if (mobilemessage.length != 0) {
                formTip(mobilemessage[0])
                return;
            }

            sendAllMessage();
        })

        /*==========================
         商品总金额计算
         低于包邮价需加邮费
         ==========================*/
        //包邮最低价
        var limitProductFee = 60;
        //邮费
        var postageFee = 20;

        //用于计算总结额
        function tongji() {
            productFee = 0;
            $(".inputn").each(function () {
                productFee += parseInt($(this).val()) * parseInt($(this).attr("data-price"));
            })
            if (productFee === 0) {
                $("#js-yuofei").html('含邮费<strong>20</strong>元(满<strong>60</strong>包邮)');
            } else if (productFee < limitProductFee) {
                productFee += postageFee;
                $("#js-yuofei").html('含邮费<strong>20</strong>元(满<strong>60</strong>包邮)');
            } else {
                $("#js-yuofei").html('免包邮')
            }
            $zongji.html(productFee);
            console.log(productFee)
        }

        /*==========================
         商品规格选择 加号
         ==========================*/
        $(".jia").click(function () {
            var $input = $(this).siblings(".np").find("input");
            var number = parseInt($input.val()) + 1;
            $input.val(number);
            tongji()

        })
        /*==========================
         商品数量 减号
         ==========================*/
        $(".jian").click(function () {
            var $input = $(this).siblings(".np").find("input");
            if (parseInt($input.val()) === 0) {
                $input.val(0);
                return;
            }
            $input.val(parseInt($input.val()) - 1);
            tongji()
        })
        /*==========================
         商品规格选择 显示
         ==========================*/

        //用于保存页面滚动的位置
        var scrollnum = 0;

        function xd_show() {
            $("#mask").show();
            $(".xd").css("display", "block");
            $(".xd").animate({"bottom": "0"}, 200);
            scrollnum = $(window).scrollTop();
            setTimeout(function () {
                $(window).scrollTop(0)
            }, 0)

        }

        /*==========================
         商品规格选择 隐藏
         ==========================*/
        function xd_hide() {
            $("#mask").hide();
            $(".xd").animate({"bottom": "-110%"}, 200);
            $(window).scrollTop(scrollnum)
        }

        $qxd.click(function () {
            xd_show();
            tongji();
        });
        $("#mask").click(function () {
            xd_hide()
        });
        $(".xd, #mask").on("touchmove", function (e) {
            e.preventDefault();
        });

        $jiesuan.click(function () {
            if (productFee === 0) {
                $("#js-layer-tipcon").html("请选择一些商品再结算");
                $(".layer-tip").show();

                return;
            }
            xd_hide();
            $(".intro").hide();

            setTimeout(function () {
                $("#js-fkb-Fee").html(productFee);
                $(".fk").css({"display": "block", "zIndex": 11});
                $(".fkb").css({"zIndex": 11});
            }, 0)


        });


        $(".op-ok").click(function () {
            $("#mask2").hide();
            $(this).parents(".layer-tip").hide();
        });


        /*==========================
         地区选择 mobiscroll
         ==========================*/
        ;
        (function () {
            var nc_a = [];
            nc_a[0] = [[1, "郑州市"], [2, "周口市"], [3, "驻马店市"], [4, "信阳市"], [5, "商丘市"], [6, "开封市"], [7, "洛阳市"], [8, "平顶山市"], [9, "焦作市"], [10, "鹤壁市"], [11, "新乡市"], [12, "安阳市"], [13, "濮阳市"], [14, "济源市"], [15, "许昌市"], [16, "漯河市"], [17, "三门峡市"], [18, "南阳市"]]
            nc_a[1] = [[-1, "二七区"], [-1, "中原区"], [-1, "郑东新区"], [-1, "管城区"], [-1, "金水区"], [-1, "经济开发区"], [-1, "高新技术开发区"], [-1, "新郑市"], [-1, "巩义市"], [-1, "荥阳市"], [-1, "中牟县"], [-1, "新密市"], [-1, "登封市"], [-1, "惠济区"], [-1, "上街区"]]
            nc_a[2] = [[-1, "项城市"], [-1, "商水县"], [-1, "淮阳县"], [-1, "太康县"], [-1, "鹿邑县"], [-1, "西华县"], [-1, "扶沟县"], [-1, "沈丘县"], [-1, "郸城县"], [-1, "川汇区"], [-1, "东新区"], [-1, "经济开发区"]]
            nc_a[3] = [[-1, "确山县"], [-1, "新蔡县"], [-1, "上蔡县"], [-1, "泌阳县"], [-1, "西平县"], [-1, "遂平县"], [-1, "汝南县"], [-1, "平舆县"], [-1, "正阳县"], [-1, "驿城区"]]
            nc_a[4] = [[-1, "潢川县"], [-1, "淮滨县"], [-1, "息县"], [-1, "新县"], [-1, "固始县"], [-1, "罗山县"], [-1, "光山县"], [-1, "商城县"], [-1, "平桥区"], [-1, "浉河区"]]
            nc_a[5] = [[-1, "永城市"], [-1, "宁陵县"], [-1, "虞城县"], [-1, "民权县"], [-1, "夏邑县"], [-1, "柘城县"], [-1, "睢县"], [-1, "睢阳区"], [-1, "梁园区"]]
            nc_a[6] = [[-1, "金明区"], [-1, "龙亭区"], [-1, "顺河区"], [-1, "鼓楼区"], [-1, "禹王台区"], [-1, "通许县"], [-1, "开封县"], [-1, "杞县"], [-1, "兰考县"], [-1, "尉氏县"]]
            nc_a[7] = [[-1, "涧西区"], [-1, "西工区"], [-1, "洛龙区"], [-1, "嵩县"], [-1, "偃师市"], [-1, "孟津县"], [-1, "汝阳县"], [-1, "伊川县"], [-1, "洛宁县"], [-1, "宜阳县"], [-1, "栾川县"], [-1, "新安县"], [-1, "伊滨区"], [-1, "吉利区"], [-1, "瀍河区"], [-1, "老城区"]]
            nc_a[8] = [[-1, "湛河区"], [-1, "卫东区"], [-1, "新华区"], [-1, "汝州市"], [-1, "舞钢市"], [-1, "郏县"], [-1, "叶县"], [-1, "鲁山县"], [-1, "宝丰县"], [-1, "石龙区"]]
            nc_a[9] = [[-1, "沁阳市"], [-1, "孟州市"], [-1, "修武县"], [-1, "温县"], [-1, "武陟县"], [-1, "博爱县"], [-1, "山阳区"], [-1, "解放区"], [-1, "马村区"], [-1, "中站区"]]
            nc_a[10] = [[-1, "淇滨区"], [-1, "浚县"], [-1, "淇县"], [-1, "鹤山区"], [-1, "山城区"]]
            nc_a[11] = [[-1, "牧野区"], [-1, "红旗区"], [-1, "卫滨区"], [-1, "卫辉市"], [-1, "辉县市"], [-1, "新乡县"], [-1, "获嘉县"], [-1, "原阳县"], [-1, "长垣县"], [-1, "延津县"], [-1, "封丘县"], [-1, "凤泉区"]]
            nc_a[12] = [[-1, "龙安区"], [-1, "殷都区"], [-1, "文峰区"], [-1, "开发区"], [-1, "北关区"], [-1, "林州市"], [-1, "安阳县"], [-1, "滑县"], [-1, "汤阴县"], [-1, "内黄县"]]
            nc_a[13] = [[-1, "濮阳县"], [-1, "南乐县"], [-1, "台前县"], [-1, "清丰县"], [-1, "范县"], [-1, "华龙区"]]
            nc_a[14] = [[-1, "城区"], [-1, "五龙口镇"], [-1, "下冶镇"], [-1, "轵城镇"], [-1, "王屋镇"], [-1, "思礼镇"], [-1, "邵原镇"], [-1, "坡头镇"], [-1, "梨林镇"], [-1, "克井镇"], [-1, "大峪镇"], [-1, "承留镇"]]
            nc_a[15] = [[-1, "魏都区"], [-1, "禹州市"], [-1, "长葛市"], [-1, "许昌县"], [-1, "鄢陵县"], [-1, "襄城县"]]
            nc_a[16] = [[-1, "郾城区"], [-1, "临颍县"], [-1, "召陵区"], [-1, "舞阳县"], [-1, "源汇区"]]
            nc_a[17] = [[-1, "渑池县"], [-1, "湖滨区"], [-1, "义马市"], [-1, "灵宝市"], [-1, "陕县"], [-1, "卢氏县"]]
            nc_a[18] = [[-1, "社旗县"], [-1, "西峡县"], [-1, "卧龙区"], [-1, "宛城区"], [-1, "邓州市"], [-1, "桐柏县"], [-1, "方城县"], [-1, "淅川县"], [-1, "镇平县"], [-1, "唐河县"], [-1, "南召县"], [-1, "内乡县"], [-1, "新野县"]]
            //初始地区
            var init = ["1"];
            //mobiscroll初始值
            var parseValue = [];
            //第一次
            var init_on = 0;
            //省份
            nc_a.province = [];
            //城市
            nc_a.city = [];
            //初始化省份
            $.each(nc_a[0], function (i, item) {
                if (init[0] && item[0] == init[0]) {
                    parseValue[0] = i;
                }
                nc_a.province[i] = {key: item[0], value: i, display: item[1]};
            });
            //初始化城市
            function city(key) {
                if (key) {
                    nc_a.city = [];
                }

                key = (!key) ? nc_a.province[0].key : key;
                nc_a.city.length = 0;
                $.each(nc_a[key], function (i, item) {
                    if (init[1] && item[0] == init[1]) {
                        parseValue[1] = i;
                    }
                    nc_a.city[i] = {key: item[0], value: i, display: item[1]};
                });
                return nc_a.city;
            }

            city(init[0]);
            a = mobiscroll.scroller('#city', {
                lang: 'zh',
                theme: 'mobiscroll',
                circular: false,
                width: 120,
                height: 40,
                display: 'bottom',
                cssClass: "set-area",
                headerText: false,
                showLabel: false,
                wheels: [

                    [{
                        data: nc_a.province
                    }, {
                        data: nc_a.city
                    }]
                ],
                rows: 5,
                buttons: ['set', 'cancel'],
                validate: function (data, inst) {
                    var nowIndex = data.index;
                    var wheelsIndexArr = data.values;
                    var wheelsDataArr = inst.settings.wheels[0];
                    var key = wheelsDataArr[0].data[wheelsIndexArr[0]].key;


                    if (nowIndex === 0) {
                        inst.changeWheel({
                            1: {data: city(key)}
                        }, 300);
                        return {valid: [wheelsIndexArr[0], 0]}
                    }

                },
                onSet: function (event, inst) {
                    var arr = inst._tempWheelArray,
                        settings = inst.settings,
                        output = settings.wheels[0][0].data[arr[0]].display + " "
                            + settings.wheels[0][1].data[arr[1]].display;
                    console.log(output);
                    $("#city").val(output);
                }
            });

        })();


    })
    function saveMessage() {
        data_array = [];
        for (var i = 0; i < $('.product_list').length; i++) {
            var obj = {};
            if ($($('.product_list')[i]).find('.inputn').val() != 0) {
                obj.name = $($('.product_list')[i]).find('.p-name').text();
                obj.price = $($('.product_list')[i]).find('.p-price').text();
                obj.number = $($('.product_list')[i]).find('.inputn').val();
                data_array.push(obj);
            }
        }

    }
    //    送数据
    function sendAllMessage() {
        var location = $('#city').val() + " " + $('#address').val();
        var user_name = $('#username').val();
        data_mobile = $('#mobile').val();
        var description = $('#remark').val();

        var json_obj = {};
        json_obj.data = data_array;

//        json_obj.description=description;
        data_json = JSON.stringify(json_obj);
//        $("input[name='city']:checked").val();
//        alert("我是要开始创建订单")
        var obj = {};
        obj.data = data_json;
        obj.action = "add";
        obj.price = productFee;
        obj.location = location;
        obj.user_name = user_name;
        obj.mobile = data_mobile;
        obj.description = description;
        validate.validate_submit3('/api/campaign/76', obj, getPayId);
    }

    function getPayId() {

        var pay_id = global_data.result.pay_id;
//        alert("我是pay_id："+pay_id)
        var obj = {};
        obj.pay_id = pay_id;
        var action_url;
        if($("input[name='zfsf']:checked").val()==0){
            window.location.href='/alipay/trade?pay_id='+pay_id+'&mobile='+data_mobile+'&end';
        }else{
            action_url='/wxpay/trade';
            $.ajax({
                type: "POST",
                url: action_url,
                data: obj,
                dataType: "json",
                beforeSend: loading,//执行ajax前执行loading函数.直到success
                success: function (data) {
                    global_data = data;
                    onBridgeReady();
                },
                error: function () {
                    /* alert('ajax交互失败');*/
                    onBridgeReady();
                }
            })
        }

    }
    function successMessage(){
        formTip("订单创建成功");
    }
    function onBridgeReady() {

        var package = global_data.package;
        var paySign = global_data.paySign;
        var appid = global_data.appid;
        var signType = global_data.signType;
        var noncestr = global_data.noncestr;
        var timestamp = global_data.timestamp;

        WeixinJSBridge.invoke(
            'getBrandWCPayRequest', {
                "appId": appid,     //公众号名称，由商户传入
                "timeStamp": timestamp,         //时间戳，自1970年以来的秒数
                "nonceStr": noncestr, //随机串
                "package": package,
                "signType": signType,         //微信签名方式：
                "paySign": paySign //微信签名
            },
            function (res) {
               /* alert(res.err_msg);
                alert(res.err_code+res.err_desc+res.err_msg);*/
                if (res.err_msg == "get_brand_wcpay_request:ok") {
                    //支付成功
                    formTip("支付成功");
                    window.location.href='/campaign/76/ddlist?mobile='+data_mobile;
                }else if(res.err_msg == "get_brand_wcpay_request:cancel"){
                    //支付取消
                    formTip("支付取消");
                }else if(res.err_msg == "get_brand_wcpay_request:fail"){
                    //支付失败
                    formTip("支付失败");
                }else{
                    //代码错误
                    formTip("网络错误");
                }
            }
        );
    }

    if (typeof WeixinJSBridge == "undefined") {
        if (document.addEventListener) {
            document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
        } else if (document.attachEvent) {
            document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
            document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
        }
    } else {
        onBridgeReady();
    }

    var is_got_auth=<%=request.getSession().getAttribute("is_got_auth")%>;
    function checkUser(){
        if (browser.versions.mobile) {//判断是否是移动设备打开。browser代码在下面
            var ua = navigator.userAgent.toLowerCase();//获取判断用的对象
            if (ua.match(/MicroMessenger/i) == "micromessenger") {
                //在微信中打开
                $('body,html').animate({scrollTop: 0}, 300);
                $('.hover_all_app').css("display","block");
                $('#wx').attr("checked",true);
                $('.zfb_label').remove();
                if(!is_got_auth){
                    wxGetOpenId();
                }
            }else{
                $('#zfb').attr("checked",true);
                $('.wx_label').remove();
            }
        } else {

        }
    }

    //微信调去获取token
    function wxGetOpenId() {

        window.location.href="/wx/callBack?url=3213";//url指定回调链接
    }

    //
    function successOpen(){

    }
</script>
</body>
</html>
