package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.OrderOf76;
import com.cyparty.laihui.utilities.PayConfigUtils;
import com.cyparty.laihui.utilities.SignUtils;
import com.cyparty.laihui.utilities.Utils;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;

/**
 * Created by zhu on 2017/2/10.
 */
@Controller
public class WebPay2Controller {
    @Autowired
    LaiHuiDB laiHuiDB;
    @ResponseBody
    @RequestMapping(value = "/alipay/trade")
    public ResponseEntity<String> sendAlipay(HttpServletRequest request, HttpServletResponse httpResponse) throws Exception {
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        String pay_number=request.getParameter("pay_id");

        String where =" where pay_number='"+pay_number+"' and pay_status=0";
        OrderOf76 order=new OrderOf76();
        List<OrderOf76> orderList = laiHuiDB.getOrderOf76(where);
        if(orderList.size()>0){
            order=orderList.get(0);
            double price=0.01;
            String subject="76烩面"; //utf-8
            String body="76烩面"; //utf-8
            AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do", PayConfigUtils.getApp_id(), PayConfigUtils.getPrivate_key(), "json", "utf-8", PayConfigUtils.getAlipay_public_key(), "RSA");
            AlipayTradeWapPayRequest alipayRequest = new AlipayTradeWapPayRequest();//创建API对应的request
            alipayRequest.setReturnUrl("http://laihuiwx.cyparty.com/campaign/76/ddlist");
            alipayRequest.setNotifyUrl(PayConfigUtils.getAlipay_notify_url());//在公共参数中设置回跳和通知地址
            alipayRequest.setBizContent("{" +
                    "    \"out_trade_no\":\""+order.getPay_number()+"\"," +
                    "    \"total_amount\":\""+price+"\"," +
                    "    \"subject\":\""+subject+"\"," +
                    "    \"seller_id\":\"2088421500051433\"," +
                    "    \"product_code\":\"QUICK_WAP_PAY\"" +
                    "  }");//填充业务参数

            String form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单 AlipayServiceEnvConstants.CHARSET
            String form1="<form id='alipaysubmit' name='alipaysubmit' action='https://openapi.alipay.com/gateway.do?charset=UTF-8' method='POST'><input type='hidden' name='biz_content' value='{\"productCode\":\"QUICK_WAP_PAY\",\"body\":\"支付宝公众号充值\",\"subject\":\"梦想直播充值\",\"out_trade_no\":\"17021712041001000583\",\"total_amount\":\"0.01\",\"timeout_express\":\"1m\"}'/><input type='hidden' name='app_id' value='2016122004460499'/><input type='hidden' name='version' value='1.0'/><input type='hidden' name='format' value='json'/><input type='hidden' name='sign_type' value='RSA'/><input type='hidden' name='method' value='alipay.trade.wap.pay'/><input type='hidden' name='timestamp' value='2017-02-17 12:04:10'/><input type='hidden' name='alipay_sdk' value='alipay-sdk-php-20161101'/><input type='hidden' name='notify_url' value='http://api.dreamlive.tv/deposit/notify_alipay5'/><input type='hidden' name='return_url' value='http://api.dreamlive.tv/deposit/notify_alipay5'/><input type='hidden' name='charset' value='UTF-8'/><input type='hidden' name='sign' value='fQAs7/QIQqkWf/0Z7IM9mpHNygx8L5Y/fO5n80l8ueHMPOfsRVptZzHbUE+8gSunm1QTc1E3V1TW0+peA6gS580q3FQrq+b2fkcQf2uueTp/xDuI6V7rRcwiwRWNl0PksRQNrCvzHWl7Ll+QOlumGmgbHMNuGLxld+3Cv7ZP4Vw='/><input type='submit' value='ok' style='display:none;''></form><script>document.forms['alipaysubmit'].submit();</script>";
            /**
             * 构造支付参数
             * */
            String defort_pay_number=order.getPay_number();
            Map<String, String> keyValues = new HashMap<String, String>();
            String current_time=Utils.getCurrentTime();
            keyValues.put("app_id", PayConfigUtils.getApp_id());
            keyValues.put("method", "alipay.trade.wap.pay");
            keyValues.put("charset", "UTF-8");
            keyValues.put("sign_type", "RSA");
            keyValues.put("version", "1.0");
            keyValues.put("timestamp", current_time);
            keyValues.put("biz_content", "{\"timeout_express\":\"30m\",\"product_code\":\"QUICK_MSECURITY_PAY\",\"total_amount\":\""+price+"\",\"subject\":\""+subject+"\",\"body\":\""+body+"\",\"out_trade_no\":\"" + defort_pay_number +  "\"}");
            keyValues.put("notify_url", PayConfigUtils.getAlipay_notify_url());
            keyValues.put("return_url", "http://laihuiwx.cyparty.com/campaign/76/ddlist");
            String sign=getSign(keyValues,PayConfigUtils.getPrivate_key());

            httpResponse.setContentType("text/html;charset=utf-8");
            String form2="<form id='alipaysubmit' name='alipaysubmit' action='https://openapi.alipay.com/gateway.do?charset=UTF-8' method='POST'>\n" +
                    "<input type='hidden' name='biz_content' value='"+keyValues.get("biz_content")+"'/>\n" +
                    "<input type='hidden' name='app_id' value='"+PayConfigUtils.getApp_id()+"'/>\n" +
                    "<input type='hidden' name='version' value='1.0'/>\n" +
                    "<input type='hidden' name='sign_type' value='RSA'/>\n" +
                    "<input type='hidden' name='method' value='alipay.trade.wap.pay'/>\n" +
                    "<input type='hidden' name='timestamp' value='"+current_time+"'/>\n" +
                    "<input type='hidden' name='notify_url' value='"+keyValues.get("notify_url")+"'/>\n" +
                    "<input type='hidden' name='return_url' value='http://laihuiwx.cyparty.com/campaign/76/ddlist'/>\n" +
                    "<input type='hidden' name='charset' value='utf-8'/>\n" +
                    "<input type='hidden' name='sign' value='"+sign+"'/>\n" +
                    "<input type='submit' value='ok' style='display:none;''></form><script>document.forms['alipaysubmit'].submit();</script>";
            httpResponse.getWriter().write(form2);//直接将完整的表单html输出到页面
            httpResponse.getWriter().flush();
        }
        return null;
    }
    public static String getSign(Map<String, String> map, String rsaKey) {
        List<String> keys = new ArrayList<String>(map.keySet());
        // key排序
        Collections.sort(keys);

        StringBuilder authInfo = new StringBuilder();
        for (int i = 0; i < keys.size() - 1; i++) {
            String key = keys.get(i);
            String value = map.get(key);
            authInfo.append(buildKeyValue(key, value, false));
            authInfo.append("&");
        }

        String tailKey = keys.get(keys.size() - 1);
        String tailValue = map.get(tailKey);
        authInfo.append(buildKeyValue(tailKey, tailValue, false));

        String oriSign = SignUtils.sign(authInfo.toString(), rsaKey);
        String encodedSign = "";

      /*  try {
            encodedSign = URLEncoder.encode(oriSign, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }*/
        return  oriSign.trim().replace("\n","");
    }
    /**
     * 拼接键值对
     *
     * @param key
     * @param value
     * @param isEncode
     * @return
     */
    private static String buildKeyValue(String key, String value, boolean isEncode) {
        StringBuilder sb = new StringBuilder();
        sb.append(key);
        sb.append("=");
        if (isEncode) {
            try {
                sb.append(URLEncoder.encode(value, "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                sb.append(value);
            }
        } else {
            sb.append(value);
        }
        return sb.toString();
    }
    @ResponseBody
    @RequestMapping(value = "/wxpay/trade")
    public ResponseEntity<String> sendWXPay(HttpServletRequest request, HttpServletResponse httpResponse) throws Exception {
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        String pay_number=request.getParameter("pay_id");
        JSONObject result=new JSONObject();
        String  openId=(String) request.getSession().getAttribute("openId");
        System.out.println("openId:"+openId);
        String where =" where pay_number='"+pay_number+"' and pay_status=0";
        OrderOf76 order=new OrderOf76();
        List<OrderOf76> orderList = laiHuiDB.getOrderOf76(where);
        if(orderList.size()>0){
            order=orderList.get(0);
            String subject="76烩面";
            //微信支付 Utils.getIP(request)
            String now_ip= "192.168.1.3";
            String nonce_str=Utils.getCharAndNum(32);
            double inputFee=order.getGoods_price()*100;
            int inputIntFee=(int)inputFee;
            String total_fee=inputIntFee+"";
            total_fee="1";//
            String prepay_id=null;
            Map<String,String> paraMap=new HashMap<>();
            paraMap.put("appid", PayConfigUtils.getWx_app_id());
            paraMap.put("attach", subject);
            paraMap.put("body", subject);
            paraMap.put("mch_id", PayConfigUtils.getWx_mch_id());
            paraMap.put("nonce_str", nonce_str);
            paraMap.put("notify_url", PayConfigUtils.getWx_pay_notify_url());
            paraMap.put("openid", openId);
            paraMap.put("out_trade_no", order.getPay_number());
            paraMap.put("spbill_create_ip", now_ip);
            paraMap.put("total_fee", total_fee);
            paraMap.put("trade_type", "JSAPI");
            List<String> keys =new ArrayList<>(paraMap.keySet());
            Collections.sort(keys);

            StringBuilder authInfo = new StringBuilder();
            for (int i=0;i<keys.size()-1; i++) {
                String value = paraMap.get(keys.get(i));
                authInfo.append(keys.get(i)+"="+value+"&");
            }
            authInfo.append(keys.get(keys.size()-1)+"="+paraMap.get(keys.get(keys.size()-1)));
            String stringA=authInfo.toString()+"&key="+PayConfigUtils.getWx_app_secret_key();
            String sign=Utils.encode("MD5",stringA).toUpperCase();
            //封装xml
            String paras="<xml>\n" +
                    "   <appid>"+PayConfigUtils.getWx_app_id()+"</appid>\n" +
                    "   <attach>"+subject+"</attach>\n" +
                    "   <body>"+subject+"</body>\n" +
                    "   <mch_id>"+PayConfigUtils.getWx_mch_id()+"</mch_id>\n" +
                    "   <nonce_str>"+nonce_str+"</nonce_str>\n" +
                    "   <notify_url>"+PayConfigUtils.getWx_pay_notify_url()+"</notify_url>\n" +
                    "   <out_trade_no>"+order.getPay_number()+"</out_trade_no>\n" +
                    "   <spbill_create_ip>"+now_ip+"</spbill_create_ip>\n" +
                    "   <total_fee>"+total_fee+"</total_fee>\n" +
                    "   <openid>"+openId+"</openid>\n" +
                    "   <trade_type>JSAPI</trade_type>\n" +
                    "   <sign>"+sign+"</sign>\n" +
                    "</xml>";
            try {
                String content=senPost(paras);
                if(content!=null){
                    prepay_id=Utils.readStringXml(content);
                }
                if(prepay_id!=null){
                    String current_noncestr=Utils.getCharAndNum(32);
                    String current_sign=null;
                    long current_timestamp=System.currentTimeMillis()/1000;
                    result.put("appid",PayConfigUtils.getWx_app_id());
                    result.put("signType","MD5");
                    result.put("package","prepay_id="+prepay_id); //a,n,p,s,t
                    result.put("noncestr",current_noncestr);
                    result.put("timestamp",current_timestamp);
                    //加密算法
                    String nowStringA="appId="+PayConfigUtils.getWx_app_id()+"&nonceStr="+current_noncestr+"&package=prepay_id="+prepay_id+"&signType=MD5&timeStamp="+current_timestamp+"&key="+PayConfigUtils.getWx_app_secret_key();
                    System.out.println(nowStringA);
                    current_sign=Utils.encode("MD5",nowStringA).toUpperCase();
                    System.out.println(current_sign);
                    /*StringBuffer paraString = new StringBuffer();
                    paraString.append("appId=").append(PayConfigUtils.getWx_app_id());
                    paraString.append("&nonceStr=").append(current_noncestr);
                    paraString.append("&package=").append("prepay_id="+prepay_id);
                    paraString.append("&signType=").append("MD5");
                    paraString.append("&timeStamp=").append(current_timestamp);
                    paraString.append("&key=").append(PayConfigUtils.getWx_app_secret_key());
                    String signature = DigestUtils.md5Hex(sign.toString()).toUpperCase();

                    System.out.println(paraString);
                    System.out.println(signature);*/


                    result.put("paySign",current_sign);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println(result.toString());
            return new ResponseEntity<>(result.toString(), responseHeaders, HttpStatus.OK);
        }
        return null;
    }

    public static String senPost(String paras) throws IOException {
        boolean is_success=true;
        int i=0;
        String  result="";
        while (is_success){
            String url = "https://api.mch.weixin.qq.com/pay/unifiedorder";
            HttpClient httpClient = new DefaultHttpClient();
            HttpPost post = new HttpPost(url);
            StringEntity postingString = new StringEntity(paras,"utf-8");// xml传递
            post.setEntity(postingString);
            post.setHeader("Content-type", "text/html; charset=UTF-8");
            HttpResponse response = httpClient.execute(post);
            result = EntityUtils.toString(response.getEntity());

            if(result==null||result.isEmpty()){
                i++;
            }else {
                break;
            }
            if(i>2){
                break;
            }
        }
        return result;
    }

}
