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
  <title>版本先知</title>
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

    function hideAll(){
      $('.app_load').hide();
      $('.app_box').hide();
      $('.bottom_menu ').hide();
    }
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
  <img src="/resource/images/role_ad3.png" class="role_ad">
  <%--内容--%>
  <div class="role_container">
    <div class="role">
      <div class="role_title">
        <span>为了提升您的体验，我们一直在进步</span>
      </div>
      <span class="role_context">为了提升用户体验，来回拼车一直在不断完善各项功能。目前，车主发布行程、乘客预约行程等功能已相当完善。乘客可以根据自己的需求筛选相应的车主，而不用在一堆混乱的信息中逐一查找，相对于传统拼车群而言，要简单便捷的多。</span>
      <span class="role_context">在接下来的版本更新中，来回拼车将加入更多人性化的功能，力求让用户体验更完美的出行过程。除去小的方面的改动，下一版本主要会增加这两大功能模块：</span>
      <div class="role_model">
        <span class="role_context_main">地图模式</span>
        <span class="role_context">加上地图模式后，乘客进入app页面就可以准确定位自己的位置，并且可以通过地图查找附近的出行车辆，相对于普通模式而言，地图模式更直观方便。</span>
        <span class="role_context">在此模式下，乘客预定车辆后，可以看到车主的行程轨迹，而车主也能看到乘客的准确位置，免去了双方需要通过频繁的电话沟通来获知对方动态的麻烦。</span>
        <span class="role_context">此外，乘客上车后还可以分享自己的行程给家人朋友，他们可以根据行车动态来判断何时去接人或者是否出了意外，无形中省去了很多麻烦，也增加了安全性。</span>
        <div class="role_box">
          <img src="/resource/images/role_ad4.png">
        </div>
      </div>
      <div class="role_model">
        <span class="role_context_main">小件捎带</span>
        <span class="role_context">小件捎带功能是基于市场上巨大的物急送需求缺口而添加的，虽然快递行业已相当成熟，但仍无法满足一些要求当日达甚至半日达的急件。</span>
        <span class="role_context">而经常往返于两地的顺风车车主，恰巧是一个很好的“快递员”。与普通快递相比，小件捎带更快更安全，省内多则六七个小时，少则一两个小时即可送到。</span>
        <span class="role_context">这项功能是对基础拼车功能的拓展，也是基于用户体验考虑的附加功能，在给车主增加额外收入的同时，也方便了用户。</span>
        <br>
        <span class="role_context">以上是来回拼车下一版本更新的主要内容，我们会根据用户反馈不断的完善产品，更多精彩敬请期待……</span>
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
        <a href="http://www.pinchenet.com/app/download">
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
