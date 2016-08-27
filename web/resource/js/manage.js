/**
 * Created by super on 2016/8/1.
 */
var global_data;
var global_page = 0;
var global_sum;
var page_sum=1;
var size=20;
var count;
var check;
//var check_click_search = 0;
//ajax加载画面
function loading(){
    $('.hover_all').show();
    $('.loading_box').show();
}
function closeLoading(){
    $('.hover_all').hide();
    $('.loading_box').hide();
}

//加载页码
var loadPage = (function(){
    //加载下一页
    function pageNext(){
            global_page=$($('.page_current')[0]).text()-1;
            $('.user_manage_container_li').remove();
            global_page++;
            findMessage();
    }
    //加载上一页
    function pagePrev(){
            global_page=$($('.page_current')[0]).text()-1;
            $('.user_manage_container_li').remove();
            global_page--;
            findMessage();
    }
    //控制上一页下一页按钮
    function pageButton(){
        console.log("当前"+global_page);
        if(global_page==0){
            console.log("page_sum总页数"+page_sum);
            if(global_page==page_sum-1){
                $('.page_prev').hide();
                $('.page_next').hide();
                $('.page_input_number').hide();
                $('.page_go').hide();
            }else{
                $('.page_input_number').show();
                $('.page_go').show();
                $('.page_prev').hide();
                $('.page_next').show();
            }
        }else if(global_page==page_sum-1){
            console.log("page_sum总页数2"+page_sum);
            $('.page_input_number').show();
            $('.page_go').show();
            $('.page_prev').show();
            $('.page_next').hide();
        }else{
            $('.page_input_number').show();
            $('.page_go').show();
            $('.page_prev').show();
            $('.page_next').show();
        }
    }
    //页码检查
    function checkPageTo(){
            if($($('.page_input_number')[0]).val()==""){
                global_page=$($('.page_input_number')[1]).val()-1;
            }else{
                global_page=$($('.page_input_number')[0]).val()-1;
            }
            if(global_page>page_sum-1 || global_page<0){
                global_page = $('.page_current').text()-1;
                $('.page_input_number').val("");
                displayErrorMsg("输入的页码有误");
            }else if($($('.page_input_number')[0]).val()=="" && $($('.page_input_number')[1]).val()==""){
                global_page = $('.page_current').text()-1;
                $('.page_input_number').val("");
                displayErrorMsg("输入的页码为空");
            }else if(isNaN($('.page_input_number').val())){
                global_page = $('.page_current').text()-1;
                $('.page_input_number').val("");
                displayErrorMsg("输入的页码格式不正确");
            }else if($('.page_input_number').val()==$($('.page_current')[0]).text() || $('.page_input_number').val()==$($('.page_current')[1]).text()) {
                return false;
            }else{
                $('.page_input_number').val("");
                findMessage();
            }

    }

    //判断用户权限
    function checkUserPrivilege(count,listStyleFunction){
        $('.right_menu_li_all').show();
        global_sum=count;
        if(global_sum==0){
            $('.page_box').hide();
            $('.not_find_message').show();
        }else{
            $('.page_box').show();
            $('.not_find_message').hide();
        }
        $('.sub_message').text("总数"+"("+global_sum+")");
        //统计分页总数配置
        page_sum=Math.ceil(global_sum/size);
        if((global_page+1)>page_sum){
            global_page=0;
        }
        $('.page_content').text(page_sum);
        listStyleFunction();
        pageButton();
        $('.page_current').text(global_page+1);
        console.log("page:" + global_page);
        console.log("page_sum:" + page_sum);
    }
    return {
        pageNext : pageNext,
        pagePrev : pagePrev,
        checkPageTo : checkPageTo,
        checkUserPrivilege : checkUserPrivilege
    }
}());

//增删改查
var operation= (function(){
    //查
    var operation_ajax = function(url,array,callback){
        $.ajax({
            type: "POST",
            url: url,
            data: array,
            dataType: "json",
            beforeSend: loading,//执行ajax前执行loading函数.直到success
            success: function (data) {
                closeLoading();
                if(data.status==true){
                    global_data=data.result;
                    console.log("操作成功");
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
    //同步
    var operation_ajax2 = function(url,array,callback){
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

    return {
        operation_ajax : operation_ajax,
        operation_ajax2:operation_ajax2,
    }

})();

//展示错误信息
function showErrorTips(errorMessageTip){
    $('.error_animate_tips').animate({
        top:'60px',
        opacity:1
    },200).text(errorMessageTip);
    setTimeout(function(){backTips()},2000)
}
function displayErrorMsg(errorMsg)
{
    $('.error_message_tip').fadeIn();
    $('.error_message').text(errorMsg);
}
function backTips(){
    $('.error_animate_tips').animate({
        top:'-50px',
        opacity:0
    },500)
};

var pageSet = (function(){
    var page_array=[10,20,30,50,100];
    //显示页码设置
    function showPageSetDrop(obj) {
        $(obj).children('.page_set_ul').toggle();
    }
    //隐藏页码
    function hidePageSet(obj){
        $(obj).children('.page_set_ul').hide();
    }
    //获取页码信息
    function getPageNumber(obj){
        size=$(obj).children('.page_set_number').text();
        $('.show_page').text(size);
        findMessage();
    }
    //添加页码选择数据
    function setPageNumber(){
        for(var i=0;i<page_array.length;i++){
            $('.page_set_ul').append('<li onclick="pageSet.getPageNumber(this)">'+
                '<span class="page_set_style">每页</span>'+
                '<span class="page_set_number">'+page_array[i]+'</span>'+
                '<span>条</span>'+
                '</li>')
        }
    }

    return{
        showPageSetDrop:showPageSetDrop,
        hidePageSet:hidePageSet,
        getPageNumber:getPageNumber,
        setPageNumber:setPageNumber
    }
}());
//控制输入的只能是数字
function onlyNum(obj)
{
    if(isNaN($(obj).val())){
        $(obj).val("");
        showErrorTips("只允许输入数字")
    }
}