<%--
  Created by IntelliJ IDEA.
  User: super
  Date: 2016/10/14
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>来回拼车客户端下载</title>
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <%--<!-- 新 Bootstrap 核心 CSS 文件 -->--%>
  <%--<link rel="stylesheet" href="/resource/css/bootstrap.min.css">--%>
  <%--<!-- 可选的Bootstrap主题文件（一般不用引入） -->--%>
  <%--<link rel="stylesheet" href="/resource/css/bootstrap-theme.min.css">--%>
  <script src="/resource/js/jquery-1.11.3.min.js"></script>
  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
  <%--<script src="/resource/js/bootstrap.min.js"></script>--%>
  <link rel="stylesheet" href="/resource/css/swiper-3.3.1.max.css">


  <style type="text/css">
    body {
      margin: 0;
      padding: 0
    }
    a {
      text-decoration: none;
      color: #000000;
    }

    a:link {
      color: #000000;
      text-decoration: none;
    }

    a:visited {
      color: #000000;
      text-decoration: none;
    }

    a:visited:hover {
      color: #000000;
      text-decoration: none;
    }

    a:hover {
      text-decoration: none;
      color: #000000;
    }

    a:active {
      text-decoration: none;
      color: #000000;
    }

    .addWrap .swipe {
      overflow: hidden;
      visibility: hidden;
      position: relative;
    }

    .addWrap .swipe-wrap {
      overflow: hidden;
      position: relative;
    }

    .addWrap .swipe-wrap > div {
      float: left;
      width: 100%;
      position: relative;
    }

    #position {
      bottom: -14px!important;
      position: absolute;
      margin: 0 0 40px 0;
      width: 100%;
      text-align: center;
    }

    #position li {
      width: 10px;
      height: 10px;
      margin: 0 2px;
      display: inline-block;
      -webkit-border-radius: 5px;
      border-radius: 5px;
      background-color: #e8e8e8;
    }

    .swiper-pagination-bullet{
      background:#ADA7A7 ;
      opacity: 0.7;
    }

    .swiper-pagination-bullet-active{
      background: #e26454;
    }

    .img-responsive {
      display: block;
      width: 100%;
      height: 100%;
      margin: 0 auto;
      /*box-shadow: 0px 0px 14px 3px #cccccc;*/
    }
    .app_toLast{
      position: absolute;
      top: 4%;
      right: 6%;
      border: 2px solid #edf1f1;
      border-radius: 6px;
      cursor: pointer;
      text-align: center;
    }
    .app_toLast span{
      padding: 0px 7px;
      color: #edf1f1;
      /* line-height: 30px; */
      font-size: 28px;
      display: block;
    }
    .app_toLoad{
      margin: 0 auto;
      background-color: #f5ad4e;
      /* padding-left: 59px; */
      width: 48%;
      padding-top: 8px;
      padding-bottom: 8px;
      text-align: center;
    }
    .app_toLoad span{
      font-size: 40px;
      padding: 6px;
      color: #fff;
    }
    .app_toLoad:hover{
      color: #FF8F0c;
    }

    .footer{
      margin-top: 0;
    }

    .clear{
      clear: both;

    }

    .app_tittle_box{
      margin: 0px auto ;
      padding-top: 40px;
      width: 80%;
      padding-bottom: 10px;
    }
    .add_news_bg{
      width: 100%;
    }
    .app_tittle_next{
      width: 100%;
    }
    .app_tittle_next p{
      font-size: 34px;
      color: #636363;
      text-align: center;
    }
    .app_mid_box{
      width: 500px;
      margin: 34px auto 0;
    }
    .app_mid_box span{
      font-size: 48px;
    }
    .app_er_box{
      width: 38%;
      margin: 30px auto 50px;
      text-align: center;
    }
    .app_er_box img{
      width: 100%;
    }
    .app_er_box span{
      font-size: 30px;
      color: #636363;
    }
    .hover_all{
      top: 0;
      display:none;
      position: absolute;
      width: 100%;
      height: 100%;
      background-color: #000;
      filter:alpha(opacity=85);
      -moz-opacity:0.85;
      -khtml-opacity:0.85;
      opacity: 0.85;
      z-index: 100;
    }
    .app_hover_close{
      position: absolute;
      bottom: 15%;
      width: 100%;
      cursor: pointer;
    }
    .app_hover_close span{
      color: #fff;
      font-size: 15px;
    }
    .app_hover_box{
      width: 102px;
      margin: 0 auto;
      background-color: #F22910;
      padding: 6px 12px;
      border-radius: 18px;
    }
    .swiper-container{
      height: 100%;
    }
    .app_box{
      background-color:#f5f2e9 ;
    }

    /*text*/
    .app_box_bg1{
      background-color: #4aa3df;
    }
    .app_box_bg2{
      background-color: #47d284;
    }
    .app_box_bg3{
      background-color: #e9c96c;
    }
    .app_box_bg4{
      background-color: #47d284;
    }
    .app_box_bg5{
      background-color: #4aa3df;
    }
    .app_box_up{
      height: 72%;
      overflow: hidden;
    }
    .app_box_down{
      height: 28%;
      padding-top: 11%;
      background-color: #edf1f1;
      text-align: center;
    }
    .app_box_up_img{
      margin: 0 auto;
      height: 100%;
      display: block;
      border-radius: 30px;
    }
    .app_toLast_box{
      height: 19%;
    }
    .app_box_down_tittle span{
      font-size: 34px;
    }
    .app_box_down_text span{
      font-size: 22px;
    }
    .app_box_tittle1{
      color: #4aa3df;
    }
    .app_box_tittle2{
      color: #2ecc71;
    }
    .app_box_tittle3{
      color: #d8b459;
    }
    .app_box_tittle4{
      color: #2ecc71;
    }
    .app_box_tittle5{
      color: #4aa3df;
    }
    .app_box_down_t1{
      color: #80a9bf;
    }
    .app_box_down_t2{
      color: #80c197;
    }
    .app_box_down_t3{
      color: #bfa980;
    }
    .app_box_down_t4{
      color: #80c197;
    }
    .app_box_down_t5{
      color: #80a9bf;
    }

    .app_tittle_next2{
      display: none;
    }

    /* padding-top: 25%; */
    @media screen and (max-width: 768px) {
      .app_tittle_box{
        width: 72%;
        padding-top:80px;
      }
      .app_tittle_next p{
        font-size: 24px;
      }
      .app_toLast span {
        font-size: 27px;
        padding-top: 3px;
      }
      .app_mid_box{
        width: 500px;
        margin: 34px auto 0;
      }
      .app_er_box {
        margin: 30px auto 40px;
      }
      .app_mid_box span{
        font-size: 34px;
      }
      .app_mid_box{
        width: 340px;
      }
    }
    @media screen and (max-width: 690px) {
      .app_mid_box span{
        font-size: 30px;
      }
      .app_toLast span {
        font-size: 25px;
        padding-top: 2px;
      }
      .app_tittle_box{
        padding-top:70px;
      }
      .app_mid_box{
        width: 300px;
        margin: 34px auto 0;
      }

      .app_tittle_next p{
        font-size: 20px;
      }
      .app_toLoad span{
        font-size: 20px;
        padding: 6px;
        color: #fff;
      }
      /*.app_toLoad{*/
      /*width: 240px;*/
      /*}*/
      .app_er_box {
        margin: 24px auto 36px;
      }
      .app_er_box span{
        font-size: 40px;
      }
    }
    @media screen and (max-width: 590px) {
      #position{
        margin: 0 0 30px 0;
      }
      .app_toLast span {
        font-size: 23px;
      }
    }
    @media screen and (max-width: 426px) {
      #position{
        margin: 0 0 44px 0;
      }
      .app_toLast span {
        font-size: 21px;
      }
      .app_tittle_box{
        width: 72%;
        padding-top:50px;
      }
      /*.app_toLoad{*/
      /*width: 187px;*/
      /*}*/
      .app_tittle_next p{
        font-size: 18px;
      }
      .app_mid_box span{
        font-size: 24px;
        margin-top: 26px;
      }
      .app_mid_box{
        width: 240px;
      }
      .app_er_box span {
        font-size: 28px;
      }
      .app_toLoad span{
        font-size: 18px;
        padding: 6px;
        color: #fff;
      }
    }
    @media screen and (max-width: 400px) {
      #position{
        margin: 0 0 40px 0;
      }
    }
    @media screen and (max-width: 375px) {
      .app_tittle_next p{
        font-size: 18px;
      }
      .app_mid_box span{
        font-size: 18px;
      }
      .app_mid_box{
        width: 180px;
      }
      #position{
        margin: 0 0 30px 0;
      }
      .app_er_box span {
        font-size: 24px;
      }
      .app_tittle_box{
        width: 72%;
        padding-top:30px;
      }
    }
    /*@media screen and (max-width: 340px){*/
    /*.app_er_box {*/
    /*margin: 20px auto 30px;*/
    /*}*/
    /*}*/
    @media screen and (max-width: 320px) {
      .app_mid_box {
        margin: 22px auto 0;
      }
      .app_box_down{
        padding-top:7%;
      }
      .app_toLast span{
        padding-top: 1px;
        font-size: 18px;
      }
      .app_box_down_tittle span{
        font-size: 28px;
      }
      .app_box_down_text span{
        font-size: 20px;
      }
      .app_tittle_next p{
        font-size: 14px;
      }
      .app_mid_box span{
        font-size: 16px;
      }
      .app_mid_box{
        width: 160px;
      }
      .app_er_box {
        margin: 8px auto 16px;
      }
      #position{
        margin: 0 0 26px 0;
      }
      .app_er_box span {
        font-size: 18px;
      }
    }
    @media all and (orientation : landscape) {
      @media screen and (max-height: 800px) {
        .app_tittle_next2{
          display: block;
        }
        .app_er_box span{
          font-size: 30px;
        }
        .app_tittle_next1{
          display: none;
        }
        .app_tittle_box {
          width: 60%;
          padding-top: 3%;
        }
        .app_tittle_next p {
          font-size: 26px;
        }
        .app_mid_box{
          width: 200px;
          float: left;
        }
        .app_er_box {
          float: right;
          width: 40%;
        }
        .app_mid_box span {
          font-size: 36px;
          line-height: 70px;
        }
        .app_mid_box {
          margin: 36px auto 0;
        }
        .app_box_down{
          padding-top: 5%;
        }

        .app_change{
          margin: -10px auto 0;
          width: 435px;
        }
      }
      @media screen and (max-height: 623px) {
        .app_tittle_box {
          width: 80%;
          padding-top: 2%;
        }
        .app_tittle_next p {
          font-size: 20px;
        }
        .app_mid_box{
          width: 140px;
        }
        .app_er_box {
          width: 36%;
          margin: 20px auto 30px;
        }
        .app_mid_box span {
          font-size: 28px;
          color: #323232;
          line-height: 40px;
        }
        .app_mid_box {
          margin: 10px 0 0 46px;
        }
        .app_toLoad span {
          font-size: 34px;
        }
        .app_er_box {
          margin: 15px 0px 10px 70px;
        }

      }
      @media screen and (max-height: 580px) {
        .app_tittle_box {
          width: 90%;
          padding-top: 4%;
        }
        .app_er_box {
          margin: 20px 0px 10px 60px;
          float: left;
        }
      }
      @media screen and (max-height:540px){
        .app_mid_box {
          margin: 10px 0 0 44px;
        }
      }
      @media screen and (max-height: 520px){
        .app_er_box {
          margin: 5px 0px 10px 60px;
        }
        .app_change {
          width: 385px;
        }
      }
      @media screen and (max-height: 500px){
        .app_mid_box {
          margin: 10px 0 0 40px;
        }
        .app_tittle_box {
          padding-top: 3%;
        }
        .app_change {
          width: 365px;
        }
        .app_er_box {
          margin: 5px 0px 10px 60px;
        }
      }
      @media screen and (max-height: 470px){
        .app_er_box {
          width: 32%;
        }
        .app_change {
          width: 345px;
        }
      }
      @media screen and (max-height: 415px){
        .app_tittle_box {
          padding-top: 2%;
          width: 50%;
        }
        .app_tittle_next p {
          font-size: 16px;
        }
        .app_change {
          margin: -10px auto 0;
          width: 315px;
        }
        .app_mid_box{
          width: 110px;
        }
        .app_mid_box span{
          font-size: 22px;
          line-height:normal;
        }
        .app_er_box {
          width: 30%;
        }
        .app_er_box {
          margin: 5px 0px 10px 60px;
        }
        #position {
          margin: 0 0 28px 0;

        }
        .app_toLoad span {
          font-size: 25px;
        }
        .app_box_up {
          height: 70%;
          overflow: hidden;
        }
        .app_box_down {
          height: 30%;
          padding-top: 2%;
        }
        .app_box_down_tittle span{
          font-size: 28px;
        }
        .app_box_down_text span{
          font-size: 18px;
        }
      }
      @media screen and (max-height: 375px){
        .app_tittle_box {
          padding-top: 1%;
        }
        .app_toLoad span {
          font-size: 16px;
        }
        .app_mid_box span {
          font-size: 18px;
        }
        .app_mid_box{
          width: 90px;
        }
        #position {
          margin: 0px 0 22px 0;
        }
        .app_box_down {
          height: 30%;
          padding-top: 1%;
        }
        .app_change {
          margin: -10px auto 0;
          width: 280px;
        }
      }
    }
    .hover_all_app{
      top: 0;
      display:none;
      position: fixed;
      width: 100%;
      height: 100%;
      background-color: #000;
      filter:alpha(opacity=85);
      -moz-opacity:0.85;
      -khtml-opacity:0.85;
      opacity: 0.85;
      z-index: 105;
    }
    .app_hover_close{
      position: absolute;
      bottom: 30%;
      width: 100%;
      cursor: pointer;
      -webkit-tap-highlight-color:transparent;
    }
    .app_hover_close span{
      color: #fff;
      font-size: 15px;
    }
    .app_hover_box{
      width: 102px;
      margin: 0 auto;
      background-color: #F22910;
      padding: 6px 12px;
      border-radius: 18px;
      text-align: center;
    }
  </style>
  <script>
    $(document).ready(function () {
      var h6 = window.innerHeight;
      $('.app_hover_all').css('height',h6+'px');
      $('.app_hover_box').click(function(){
        $(this).parent().parent().parent().css("display","none");
      });
      $('.app_toLast').click(function(){
        $($('.swiper-pagination-bullet')[3]).click();
      });
      openApp()
      check();
    });

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
    }

    function openApp(){
      if (navigator.userAgent.match(/(iPhone|iPod|iPad);?/i)) {
          $('.app_a').attr('href','https://itunes.apple.com/app/id1174366776')
      } else if (navigator.userAgent.match(/android/i)) {
        $('.app_a').attr('href','http://download.pinchenet.com/app/laihui.apk')
      }
    }

    function check(){
      if (browser.versions.mobile) {//判断是否是移动设备打开。browser代码在下面
        var ua = navigator.userAgent.toLowerCase();//获取判断用的对象
        if (ua.match(/MicroMessenger/i) == "micromessenger") {
          //在微信中打开
//          alert("请在非微信，QQ和QQ浏览器中打开");
          $('body,html').animate({scrollTop: 0}, 300);
          $('.hover_all_app').css("display","block");

        }else{
          openApp();
        }
      } else {
      }
    }
  </script>

</head>
<body>
<%--APP下载遮罩层--%>
<div class="hover_all_app">
  <div class="weixin_hover">
    <img src="/resource/images/live_weixin.png" style="width: 95%;margin: 2px 0 0 12px;">
  </div>
</div>
<%--轮播效果--%>

<div class="clear"></div>
<div class="app_hover_all">
  <div class="swiper-container">
    <div class="swiper-wrapper" id="mySwipe">
      <%--<div class="swiper-slide">--%>
        <%--<div class="app_box_up app_box_bg1"  width="100%">--%>
          <%--<div class="app_toLast_box">--%>
            <%--<div class="app_toLast">--%>
              <%--<span>跳过</span>--%>
            <%--</div>--%>
          <%--</div>--%>
          <%--<img class="app_box_up_img" src="/resource/images/ad_1.png">--%>
        <%--</div>--%>
        <%--<div class="app_box_down">--%>
          <%--<div class="app_box_down_tittle app_box_tittle1">--%>
            <%--<span>超低价格</span>--%>
          <%--</div>--%>
          <%--<div class="app_box_down_text app_box_down_t1">--%>
            <%--<span>仅分摊出行成本</span>--%>
          <%--</div>--%>
        <%--</div>--%>
      <%--</div>--%>
      <%--<div class="swiper-slide">--%>
        <%--<div class="app_box_up app_box_bg2"  width="100%">--%>
          <%--<div class="app_toLast_box">--%>
            <%--<div class="app_toLast">--%>
              <%--<span>跳过</span>--%>
            <%--</div>--%>
          <%--</div>--%>
          <%--<img class="app_box_up_img" src="/resource/images/ad_2.png">--%>
        <%--</div>--%>
        <%--<div class="app_box_down app_box_down_t2">--%>
          <%--<div class="app_box_down_tittle app_box_tittle2">--%>
            <%--<span>手机发布</span>--%>
          <%--</div>--%>
          <%--<div class="app_box_down_text  app_box_down_t2">--%>
            <%--<span>一键寻找顺路乘客</span>--%>
          <%--</div>--%>
        <%--</div>--%>
      <%--</div>--%>
      <%--<div class="swiper-slide">--%>
        <%--<div class="app_box_up app_box_bg3"  width="100%">--%>
          <%--<div class="app_toLast_box">--%>
            <%--<div class="app_toLast">--%>
              <%--<span>跳过</span>--%>
            <%--</div>--%>
          <%--</div>--%>
          <%--<img class="app_box_up_img" src="/resource/images/ad_3.png">--%>
        <%--</div>--%>
        <%--<div class="app_box_down app_box_down_t3">--%>
          <%--<div class="app_box_down_tittle app_box_tittle3">--%>
            <%--<span>实时定位</span>--%>
          <%--</div>--%>
          <%--<div class="app_box_down_text app_box_down_t3">--%>
            <%--<span>行车位置一目了然</span>--%>
          <%--</div>--%>
        <%--</div>--%>
      <%--</div>--%>
      <div class="swiper-slide app_box">
        <div class="app_tittle_box">
          <img class="add_news_bg" src="/resource/images/pch_share_logo.png"/>
        </div>
        <div class="app_tittle_next">
          <p class="app_tittle_next1">相伴你出行的每一个<span style="color: #F5AD4E;font-size: 18px;">来回</span></p>
        </div>
        <div class="app_change">
          <%--<div class="app_mid_box">--%>
            <%--<span>扫描二维码下载客户端</span>--%>
          <%--</div>--%>
          <%--<div class="app_er_box">--%>
            <%--<img class="add_news_down" src="/resource/images/pc_app_load.png"/>--%>
          <%--</div>--%>
          <div class="clear"></div>
        </div>
        <a href="http://laihui.oss-cn-shanghai.aliyuncs.com/app/laihui.apk" class="app_a">
          <div class="app_toLoad">
            <span>下载客户端</span>
          </div>
        </a>
      </div>
      <%--</div>--%>
    </div>
    <%--<div class="swiper-pagination" id="position">--%>
      <%--<span class="swiper-pagination-bullet"></span>--%>
    <%--</div>--%>
  </div>
</div>
<!-- Swiper JS -->
<script src="/resource/js/swiper.min.js"></script>

<!-- Initialize Swiper -->
<%--<script type="text/javascript">--%>
  <%--var bullets = document.getElementById('position').getElementsByTagName('li');--%>
  <%--var banner = new Swiper('.swiper-container', {--%>
    <%--pagination: '.swiper-pagination',--%>
    <%--nextButton: '.swiper-button-next',--%>
    <%--prevButton: '.swiper-button-prev',--%>
    <%--slidesPerView: 1,--%>
    <%--paginationClickable: true,--%>
    <%--autoplayDisableOnInteraction:false,--%>
    <%--spaceBetween: 0,--%>
    <%--loop: false--%>
  <%--});--%>
<%--</script>--%>
</body>
</html>
