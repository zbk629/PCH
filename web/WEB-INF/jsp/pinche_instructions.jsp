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
        <span class="role_context">第二步，点击信息进行预订，填写座位数、出发地和目的地。</span>
        <div class="role_box">
          <img src="/resource/images/role_ad11.png">
        </div>
        <span class="role_context">第三步，点击预约，座位预订成功。</span>
        <div class="role_box">
          <img src="/resource/images/role_ad12.png">
        </div>
        <span class="role_context">来回拼车的操作方便快捷，学会了基本操作，接下来就可以投身美好的出行旅程了。更多人性化的功能持续更新中，请不要错过，快叫上你的小伙伴们，一起下载，一起来回吧！</span>
      </div>

    </div>
  </div>
</div>
</body>
</html>
