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
  <title>全民代理</title>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
  <link href="/resource/css/role.css" rel="stylesheet" type="text/css">
  <style>
    .role_table{
      margin: 1rem 0;
      /*font-size: .9rem;*/
    }
    .role_table tbody{
      background: #FAFAFA;
      line-height: 3.2rem;
      text-align: center;
    }
  </style>
  <script type="text/javascript">
    $(document).ready(function () {
      changeFontSize();
      checkUser();
      hideAll();
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
  <%--内容--%>
  <div class="role_container">
    <div class="role">
      <div class="role_title">
        <span>全民代理，让每个个体都能创造奇迹！</span>
      </div>
      <span class="role_context">很多人渴望一劳永逸，渴望一次付出就能获得源源不断的回报。其实，只要敢想敢做，一切皆有可能。而此刻，就有这样一个摆在你面前的机会！ </span>
      <span class="role_context">为了让更多的人和我们一起成长并从中受益，平台特启动“全民代理”模式，即：凡平台用户均可成为我们的代理商，推荐别人下载并注册来回拼车APP，只要该用户在平台产生交易，您就可以享受平台高额分成。具体分成模式如下：</span>
      <span class="role_context">1、	如果您推荐的都是乘客，只要该乘客在平台上有拼车行为，您都将获得其交易额的3%提成。</span>
      <span class="role_context">2、	如果您推荐的都是车主，只要该车主在平台上有拼车行为，您都将获得其交易额的2%提成。</span>
      <span class="role_context">3、	如果您推荐的既有车主又有乘客，而且刚好该乘客坐了该车主的车，则您可同时获得双方交易额的2%和3%分成，即总共5%。</span>
      <span class="role_context">举个例子：假如您推荐了1000个用户</span>
      <table class="role_table">
        <tr class="role_tr">
          <td>
          推荐用户性质
          </td>
          <td>
            每人每月交易额（元）
          </td>
          <td>
            您的每月收益（元）
          </td>
        </tr>
        <tr class="role_tr">
          <td>
            车主
          </td>
          <td>
            100
          </td>
          <td>
            2000
          </td>
        </tr>
        <tr class="role_tr">
          <td>
            乘客
          </td>
          <td>
            500
          </td>
          <td>
            15000
          </td>
        </tr>
        <tr class="role_tr">
          <td>
            车主和乘客
          </td>
          <td>
            400
          </td>
          <td>
            20000
          </td>
        </tr>
      </table>
      <span class="role_context">最重要的是，这些收入是可持续性的，只要您推荐的用户长期使用，您就可以长期获得收入，而且随着推荐量的增加，您每个月的收益也会不断增加！此外，每逢节假日，平台还有其他活动，各种优惠和补贴都将优先考虑代理商！</span>
      <span class="role_context">大家都知道，拼车市场用户量庞大，平台发展壮大后收益将不可估量。如果您抓住了这次机会，前期多努力一把，相信后期给你带来的回报也将是不可估量的！</span>
      <span class="role_context">如果您能着眼长远，看到本项目后期能够带给您的巨大收益，欢迎加入我们，与我们一起开启全民代理，一起创造奇迹！</span>
      <br>
      <span class="role_context">注：本活动最终解释权归来回拼车所有，平台会根据具体发展情况对此政策做出相应调整。</span>

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
