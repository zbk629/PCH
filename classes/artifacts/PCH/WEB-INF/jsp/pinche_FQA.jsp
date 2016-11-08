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
  <title>拼车新规</title>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
  <link href="/resource/css/role.css" rel="stylesheet" type="text/css">

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
  <img src="/resource/images/role_add2.png" class="role_ad">
  <%--内容--%>
  <div class="role_container">
    <div class="role">
      <div class="role_title">
        <span>您的拼车方式符合新的合乘规定吗？</span>
      </div>
      <span class="role_context">各地私人小客车合乘指导意见相继发布，针对私人小客车合乘的司机、车辆、运行模式、接单次数等做出明确规定，来回拼车成为合法的拼车平台。拼车新政有哪些规定？快来了解一下。</span>
      <div class="role_model">
        <span class="role_context_main">仅分摊出行成本或完全免费</span>
        <span class="role_context">出行者和车主应合理分摊出行成本或免费互助，这意味着政策支持的是来回拼车主张的共享经济。对于某顺风车以盈利为目的的模式，已被定为非法营运。</span>

        <div class="role_box">
          <img src="/resource/images/role_add1.png">
        </div>

      </div>
      <div class="role_model">
        <span class="role_context_main">不得再通过QQ群或微信群拼车</span>
        <span class="role_context">QQ群和微信群拼车，车主资质无法保障，用户信息得不到保护，其中更是充斥着大量的非法运营车辆，极为不规范，严重影响用户体验，未来将不再合法。</span>
        <span class="role_context">来回拼车对车主有严格的审核，同时保障用户信息安全，杜绝非法运营，最大限度保障用户权益。</span>
      </div>
      <div class="role_model">
        <span class="role_context_main">合乘软件需单独设置</span>
        <span class="role_context">合乘软件应当独立设置，不应与网约车软件合并。而如今某出行软件网约车、顺风车合二为一的运营方式显然已不合规定。</span>
        <span class="role_context">来回拼车专注于城际顺风车，软件只为跨市拼车服务，正是市场所需。</span>
      </div>
      <div class="role_model">
        <span class="role_context_main">每天拼车次数有限制</span>
        <span class="role_context">各地把私人小客车每日合乘次数限制在2次或4次，这表明拼车出行必须顺路而为，是一种互助行为，禁止以此为职，从根本上否定了私家营运车辆。</span>
        <span class="role_context">来回拼车本着共享经济的原则为用户服务，从功能设置到运营模式都完全符合新政要求。</span>
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
