/**
 * Created by super on 2016/7/26.
 */
var data_obj = {};
var pageTitle;
var browser = {
    versions: function () {
        var u = navigator.userAgent, app = navigator.appVersion;
        return {         //移动终端浏览器版本信息
            trident: u.indexOf('Trident') > -1, //IE内核
            presto: u.indexOf('Presto') > -1, //opera内核
            webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
            gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
            mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
            ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
            android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
            iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
            iPad: u.indexOf('iPad') > -1, //是否iPad
            webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
        };
    }(),
    language: (navigator.browserLanguage || navigator.language).toLowerCase()
};

//检测信息
var validate = (function(){

    var validate_submit = function(url,array,callback){
        $.ajax({
            type: "POST",
            url: url,
            data: array,
            dataType: "json",
            beforeSend: loading,//执行ajax前执行loading函数.直到success
            success: function (data) {
                global_data=data;
                if(global_data.status==true){
                    console.log("交互成功");
                    callback();
                    closeLoading();
                }else{
                    validate.showTips("身份证格式不正确");
                }
            },
            error: function () {
                console.log("交互失败");
                callback();
            }
        })
    };
    //同步传输
    var validate_submit2 = function(url,array,callback){
        $.ajax({
            type: "POST",
            url: url,
            data: array,
            async:false,
            dataType: "json",
            beforeSend: loading,//执行ajax前执行loading函数.直到success
            success: function (data) {
                closeLoading();
                if(data.status==true){
                    global_data=data.result;
                    console.log("交互成功");
                    callback();
                }else{
                    showErrorTips(data.message);
                }
            },
            error: function () {
                displayErrorMsg(data.message);
            }
        })
    };
//同步传输
    var validate_submit3 = function(url,array,callback){
        $.ajax({
            type: "POST",
            url: url,
            data: array,
            async:false,
            dataType: "json",
            beforeSend: loading,//执行ajax前执行loading函数.直到success
            success: function (data) {
                global_data=data;
                if(global_data.status==true){
                    console.log("交互成功");
                    callback();
                    closeLoading();
                }else{
                    validate.showTips("身份证格式不正确");
                }
            },
            error: function () {
                console.log("交互失败");
                callback();
            }
        })
    };
    var baidu_api = function(url,callback){
        $.ajax({
            type: "POST",
            url: url,
            dataType: "json",
            //dataType: 'jsonp',
            crossDomain: true,
            success: function (data) {
                global_data=data;
                if(global_data.status==0){
                    console.log("交互成功");
                    callback();
                }else{
                    validate.showTips("身份证格式不正确");
                }
            },
            error: function () {
                global_data=city_obj;
                console.log("交互失败");
            }
        })
    };

    function showTips(message){
        $('.validate_error_tips').show().text(message);
    };

    function hideTips(){
        $('.validate_error_tips').hide().text("");
    }
    //控制输入的只能是数字
    function onlyNum(obj)
    {
        if(isNaN($(obj).val())){
            $(obj).val("");
            validate.showTips("请输入合法的身份证号");
        }else{
            validate.hideTips();
        }
    }
    return {
        validate_submit : validate_submit,
        showTips:showTips,
        hideTips:hideTips,
        onlyNum:onlyNum,
        baidu_api:baidu_api,
        validate_submit2:validate_submit2,
        validate_submit3:validate_submit3

    }

})();
//改变字体适应效果
//改变字体适应效果
function changeFontSize(){
    var w = $(document.body).width();
    if(w>=1080) {
        w = 1080;
        $('html').css('font-size',w/78+'px');
    }else{
        $('html').css('font-size',w/34+'px');
    }

};

//ajax加载画面
function loading(){
    $('.hover_all').show();
    $('.loading_box').show();
}
function closeLoading(){
    $('.hover_all').hide();
    $('.loading_box').hide();
}


//查看大图
var changeImg = (function(){
    //查看大图
    function showBigImg(obj) {
        $('.hover').show();
        $('.image_tips').show().css({'top': '10rem'}).children('img').attr('src', $(obj).attr('src'));
        $('.reload_img').show();
        $('.cancel').show();
    }
    function cancelBigImg(){
        $('.hover').hide();
        $('.image_tips').hide();
        $('.cancel').hide();
    }

    return {
        showBigImg : showBigImg,
        cancelBigImg:cancelBigImg
    }

})();

$("input").bind("touchstart click",function(e){
    e.stopPropagation()
    if(e.originalEvent.touches){
        //touch 移动端事件处理
        return false;
    }else{
        // PC端 click事件处理
    }

});

//展示浮动层，自动消失
function showFloatStyle(errorTips){
    $('.hover').fadeIn(200);
    $('.float_container').fadeIn(200);
    $('.float_box_span').text(errorTips);
    setTimeout(function () {
        $('.hover').fadeOut(200);
        $('.float_container').fadeOut(200);
    }, 1500);
}

//展示浮动层可编辑
function showFloatStyle2(){
    $('.hover').fadeIn(200);
    $('.float_container2').fadeIn(200);
}

function removeFloatMessage(){
    $('.hover').fadeOut(200);
    $('.float_container2').fadeOut(200);
}
//显示菜单
function changeMenu(obj){
    if($(obj).children().hasClass('menu_style_active')){
        $(obj).children().removeClass('menu_style_active');
        $(obj).children().attr('src','/resource/images/pch_icon_menu_style.png');
        $('.message_bottom').animate({'left':'300%'},300)
    }else{
        $(obj).children().addClass('menu_style_active');
        $(obj).children().attr('src','/resource/images/pch_icon_toright.png');
        $('.message_bottom').animate({'left':'0'},300)
    }
}
//菜单的跳转
function toMine(){
    //if (browser.versions.mobile) {//判断是否是移动设备打开。browser代码在下面
    //    alert("移动")
    //    window.location.href="/wx/login";
    //    var ua = navigator.userAgent.toLowerCase();//获取判断用的对象
    //    if (ua.match(/MicroMessenger/i) == "micromessenger") {
    //        //在微信中打开
    //    }
    //    if (ua.match(/WeiBo/i) == "weibo") {
    //        //在新浪微博客户端打开
    //    }
    //    if (ua.match(/QQ/i) == "qq") {
    //        //在QQ空间打开
    //    }
    //    if (browser.versions.ios) {
    //        //是否在IOS浏览器打开
    //    }
    //    if(browser.versions.android){
    //        //是否在安卓浏览器打开
    //    }
    //} else {
    //    alert("电脑")
    //    //否则就是PC浏览器打开
    //    window.location.href="/auth/base"
    //}
    window.location.href="/wx/login";
}
//暂未开放
function notOpend(){
//      window.location.href="/laihui/driver/create_order"
    showFloatStyle("即将开通，敬请期待");
}
function toList(){
    window.location.href="/laihui/car/list"
}
function toPassengerList(){
    window.location.href="/laihui/passenger/my_order_list"
}