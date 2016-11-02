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
  <title>后台管理</title>
  <script src="/resource/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css">
  <style type="text/css">
    body{
      background-color: #fff;
      font-size: 1.15rem;
      height: auto;
      min-width: 200px;
    }
    .container{
      max-width: 1080px;
      margin: 0 auto;
      background: #f5f5f5;
      height:100%;
    }
    .crile{
      width: 6px;
      height: 6px;
      background-color: #f5ad4e;
      display: inline-block;
      border-radius: 50%;
      position: relative;
      top: -.15rem;
      margin: 0 .2rem;
    }
    .role_ad{
      width: 100%;
    }
    .role_container{
      padding: 0 .8rem;
      height: 100%;
    }
    .role_title{
      border-left: 4px solid #F5AD4E;
      padding-left: .5rem;
      font-size: 1.4rem;
      color: #f5ad4e;
      margin: 1rem 0;
    }
    .role_context{
      text-indent: 1rem;
      display: inline-block;
      line-height: 2rem;
    }
    .role_context_main{
      display: block;
      font-size: 1.4rem;
      margin-top: 1rem;
      margin-bottom: .4rem;
      color: #f5ad4e;
      text-indent: 1rem;
    }
    .role_box{
      background: #F4CC93;
      border-radius: 5px;
      padding: 0 .8rem;
      margin: .4rem 0;
    }
    .role_box_span{
      color: #fff;
      /*text-indent: 1rem;*/
      /*display: inline-block;*/
    }
    .role_box_div{
      padding: .8rem 0;
    }
    .role_p{
      color: #888;
      margin-bottom: .4rem;
    }
    /*下载APP*/
    .app_load{

      height: 4.6rem;
      width: 100%;
      z-index: 100;
      display: block;
      background-color: #fff;
    }
    .app_load_container{
      position: relative;
      height: 100%;
      padding: 0 1.5rem;
    }
    .app_load_container a{
      width: 80%;
      height: 100%;
      display:block;
      position: relative;
      z-index: 999;
    }
    .app_logo{
      width: 3rem;
      margin-top: 1rem;
    }
    .close_app_load{
      position: absolute;
      right: 1rem;
      color: #FFF;
      display: inline-block;
      border-radius: 50%;
      width: 4rem;
      height: 4rem;
      text-align: center;
      font-size: 2.6rem;
      line-height: 4rem;
    }
    .app_text{
      line-height: 2rem;
      color: #f5ad4e;
      display: inline-block;
      margin-top: .2rem;
      margin-left: .6rem;
      font-size: 1.6rem;
    }
    .app_load_hover{
      background-color: #000;
      opacity: 0.75;
      width: 100%;
      position: absolute;
      height: 100%;
    }
    .app_box{
      position: fixed;
      bottom: 13.8rem;
      right: 1rem;
      width: 3.2rem;
      background-color: #fff;
      z-index: 101;
      border-radius: 50%;
      border: 1px solid #e8e8e8;
      padding: .3rem .3rem .1rem .4rem;
      display: none;
    }
    .app_show{
      width: 100%;
    }
    .open_APP{
      float: right;
      background: #f5ad4e;
      color: #fff;
      border-radius: 5px;
      padding: .8rem 1rem;
      margin-top: .8rem;
    }

  </style>
  <script type="text/javascript">
    $(document).ready(function () {
      changeFontSize();
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


  </script>
</head>
<body>
<div class="container">

  <%--宣传图--%>
  <img src="/resource/images/role_ad.png" class="role_ad">
  <%--内容--%>
  <div class="role_container">
    <div class="role">
      <div class="role_title">
        <span>计费规则</span>
      </div>
      <span class="role_context">来回拼车成本由三部分构成：油费、过路费过桥费，车辆使用成本。综合考虑这三方面费用，我们根据成本分摊机制制定了拼车计费规则，计算公式如下：</span>

      <div class="role_model">
        <span class="role_context_main">车主发布单人拼车费用=0.3×公里数</span>
        <span class="role_context">来回拼车成本由三部分构成：油费、过路费过桥费，车辆使用成本。综合考虑这三方面费用，我们根据成本分摊机制制定了拼车计费规则，计算公式如下：</span>

        <div class="role_box">
          <div class="role_box_div">
            如果个位数为1-4，则直接舍去。<span class="role_box_span">&nbsp;如24，四舍五入为20。</span></br>
          </div>
          <div class="role_box_div">
            如果个位数为5，则直接保留。<span class="role_box_span">&nbsp;如25，仍保留为25。</span></br>
          </div>
          <div class="role_box_div">
            如果个位数为6-9，则直接进一位。<span class="role_box_span">&nbsp;如27，四舍五入为30。</span>
          </div>
        </div>

        <span class="role_context">经过以上计算方法后，会得出一个拼车价格。平台会在这个价格的基础上，上下浮动5元，让车主自主选择。例如：计算得到的价格为20元，则平台会分别定15、20、25三个价位供车主选择。</span>

      </div>
      <div class="role_model">
        <span class="role_context_main">乘客发布单人拼车费用=0.35×公里数</span>
        <span class="role_context">按照以上公式计算，直接把小数点后面的数字省略不计，再对个位数进行四舍五入。即：</span>

        <div class="role_box">
          <div class="role_box_div">
            如果个位数为1-4，则直接舍去。<span class="role_box_span">&nbsp;如24，四舍五入为20。</span></br>
          </div>
          <div class="role_box_div">
            如果个位数为5，则直接保留。<span class="role_box_span">&nbsp;如25，仍保留为25。</span></br>
          </div>
          <div class="role_box_div">
            如果个位数为6-9，则直接进一位。<span class="role_box_span">&nbsp;如27，四舍五入为30。</span>
          </div>
        </div>

        <span class="role_context">经过以上计算方法后，会得出一个拼车价格。平台会在这个价格的基础上，上下浮动5元，让车主自主选择。例如：计算得到的价格为20元，则平台会分别定15、20、25三个价位供乘客选择。</span>

      </div>
    </div>

    <div class="role">
      <div class="role_title">
        <span>规则说明</span>
      </div>
      <p class="role_p"><i class="crile"></i>乘客发布单价高于车主发布单价原因：乘客发布需要车主前去接送，此段路途费用需乘客支付；</p>

      <p class="role_p"><i class="crile"></i>平台倡导分享经济，仅分摊出行成本，不涉及盈利性质；</p>

      <p class="role_p"><i class="crile"></i>平台可能会临时调整价格以保障服务能力。</p>
      </span>
    </div>
  </div>
    <%--<div class="app_load">--%>
      <%--<div class="app_load_container">--%>
        <%--<img src="/resource/images/role_logo.png" class="app_logo">--%>
      <%--<span class="app_text">--%>
                <%--来回拼车</br>--%>
        <%--<span style="font-size: 1.2rem;color: #999">省内最大的城际拼车信息服务平台</span>--%>
      <%--</span>--%>
        <%--<div class="open_APP">打开APP</div>--%>
      <%--</div>--%>
    <%--</div>--%>
</div>
</body>
</html>
