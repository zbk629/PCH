<%--
  Created by IntelliJ IDEA.
  User: super
  Date: 2016/10/18
  Time: 9:30
  describtion:后台管理--主页
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
  <title>使用指南</title>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
  <link href="/resource/css/role.css" rel="stylesheet" type="text/css">
  <style>
    .role_box img{
      width: 60%;
    }
  </style>
  <script type="text/javascript">
    $(document).ready(function () {
      changeFontSize();
      checkUser();
    });
    //改变字体适应效果
    function changeFontSize() {
      var w = $(document.body).width();
      if (w >= 1080) {
        w = 1080;
        $('html').css('font-size', w / 78 + 'px');
      } else {
        $('html').css('font-size', w / 34 + 'px');
      }

    };

    function hideApp() {
      $('.app_load').hide();
      $('.app_box').show();
      $('.bottom_menu ').show();
    }
    function showApp() {
      if ($('.menu_style_icon').hasClass('menu_style_active')) {
        $('.app_load').show().css('bottom', '4.2rem');
      } else {
        $('.app_load').show().css('bottom', '0');

      }
      $('.app_box').hide();
      $('.bottom_menu ').hide();
    }
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

    function checkUser(){
      if (browser.versions.mobile) {//判断是否是移动设备打开。browser代码在下面
        $('.app_load').show();
      }
    }
  </script>
</head>
<body>
<div class="container">

  <%--宣传图--%>
  <img src="/resource/images/role_ad13.png" class="role_ad">
  <%--内容--%>
  <div class="role_container">
    <div class="role">
      <div class="role_title">
        <span>一秒看懂如何发布车单，预约车辆</span>
      </div>
      <div class="role_model">
        <span class="role_context">来回拼车app实现了城际出行线上操作的完整流程，乘客可直接筛选找车，车主只需通过认证，即可发布出行信息。那么，如何玩转来回拼车app？还不知如何操作的小伙伴看这里。</span>
        <br>
        <span class="role_context">首先，打开来回拼车app，填写手机号进行登录。</span>
        <div class="role_box">
          <img src="/resource/images/role_ad5.png">
        </div>
        <span class="role_context">如您是车主：</span>
        <span class="role_context">第一步，点击左上角三横线标志。</span>
        <div class="role_box">
          <img src="/resource/images/role_ad6.png">
        </div>
        <span class="role_context">第二步，点击车主认证进行身份认证。（点击头像可更换头像照片）</span>
        <div class="role_box">
          <img src="/resource/images/role_ad7.png">
        </div>
        <span class="role_context">第三步，填写相关信息，申请认证，等待管理员审核。（在线即时审核）</span>
        <div class="role_box">
          <img src="/resource/images/role_ad8.png">
        </div>
        <span class="role_context">第四步，审核通过后，点击主页右下角发布按钮，即可发布出行信息。</span>
        <div class="role_box">
          <img src="/resource/images/role_ad9.png">
        </div>
        <span class="role_context">如果您是乘客：</span>
        <span class="role_context">第一步，直接点击页面信息，或点击搜索车单来选择合适出行信息。</span>
        <div class="role_box">
          <img src="/resource/images/role_ad10.png">
        </div>
        <span class="role_context">第二步，点击信息进行预订，填写人数、出发地和目的地，并点击预约。</span>
        <div class="role_box">
          <img src="/resource/images/role_ad11.png">
        </div>
        <span class="role_context">最后，车主和乘客都可在我的行程中查看自己的车单详情。</span>
        <div class="role_box">
          <img src="/resource/images/role_ad12.png">
        </div>
        <div class="role_box">
          <img src="/resource/images/role_ad14.png">
        </div>
        <span class="role_context">来回拼车的操作方便快捷，学会了基本操作，接下来就可以投身美好的出行旅程了。更多人性化的功能持续更新中，请不要错过，快叫上你的小伙伴们，一起下载，一起来回吧！</span>
      </div>

    </div>
  </div>
  <%--引导下载APP--%>
    <a href="http://admin.pinchenet.com/app/download">
      <div class="app_box">
        <img src="/resource/images/pc_icon_app_downloade.png" class="app_show">
      </div>
    </a>
    <div class="app_load">
      <div class="app_load_hover"></div>
      <div class="app_load_container">
        <span class="close_app_load" onclick="hideApp()">x</span>
        <a href="http://admin.pinchenet.com/app/download">
          <img src="/resource/images/role_logo.png" class="app_logo">
            <span class="app_text">
                下载来回拼车APP</br>
              <span style="font-size: 1.2rem">相伴你出行的每一个来回</span>
            </span>
        </a>
      </div>
    </div>
</div>
</body>
</html>
