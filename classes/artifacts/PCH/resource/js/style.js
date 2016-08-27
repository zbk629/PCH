/**
 * Created by super on 2016/7/26.
 */
var data_obj = {};
var pageTitle;
//检测信息
var validate = (function(){

    var validate_submit = function(url,array,callback){
        $.ajax({
            type: "POST",
            url: url,
            data: array,
            dataType: "json",
            success: function (data) {
                global_data=data;
                if(global_data.status==true){
                    console.log("交互成功");
                    callback();
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
        validate_submit2:validate_submit2
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
        $('html').css('font-size',w/38+'px');
    }

};

//ajax加载画面
function loading(){
    $('.hover').show();
    $('.loading_box').show();
}
function closeLoading(){
    $('.hover').hide();
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



