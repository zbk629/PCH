package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.OrderOf76;
import com.cyparty.laihui.domain.User;
import com.cyparty.laihui.utilities.PayConfigUtils;
import com.cyparty.laihui.utilities.Utils;
import com.cyparty.laihui.utilities.WxUserBaseUtil;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * Created by zhu on 2017/2/10.
 */
@Controller
public class WebPayController {
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
            String subject="76烩面";
            AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do", PayConfigUtils.getApp_id(), PayConfigUtils.getPrivate_key(), "json", "utf-8", PayConfigUtils.getAlipay_public_key(), "RSA");
            AlipayTradeWapPayRequest alipayRequest = new AlipayTradeWapPayRequest();//创建API对应的request
            alipayRequest.setReturnUrl("http://domain.com/CallBack/return_url.jsp");
            alipayRequest.setNotifyUrl(PayConfigUtils.getAlipay_notify_url());//在公共参数中设置回跳和通知地址
            alipayRequest.setBizContent("{" +
                    "    \"out_trade_no\":\""+order.getPay_number()+"\"," +
                    "    \"total_amount\":\""+price+"\"," +
                    "    \"subject\":\""+subject+"\"," +
                    "    \"seller_id\":\"2088421500051433\"," +
                    "    \"product_code\":\"QUICK_WAP_PAY\"" +
                    "  }");//填充业务参数

            String form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单 AlipayServiceEnvConstants.CHARSET
            httpResponse.setContentType("text/html;charset=" + "utf-8");
            httpResponse.getWriter().write(form);//直接将完整的表单html输出到页面
            httpResponse.getWriter().flush();
        }
        return null;
    }
    @ResponseBody
    @RequestMapping(value = "/wxpay/trade")
    public ResponseEntity<String> sendWX(HttpServletRequest request, HttpServletResponse httpResponse) throws Exception {
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
            //total_fee="1";//
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
                    result.put("package","prepay_id="+prepay_id);
                    result.put("noncestr",current_noncestr);
                    result.put("timestamp",current_timestamp);
                    //加密算法
                    String nowStringA="appid="+PayConfigUtils.getWx_app_id()+"&noncestr="+current_noncestr+"&package=Sign=WXPay&partnerid="+PayConfigUtils.getWx_mch_id()+"&prepayid="+prepay_id+"&timestamp="+current_timestamp+"&key="+PayConfigUtils.getWx_app_secret_key();
                    current_sign=Utils.encode("MD5",nowStringA).toUpperCase();
                    result.put("paySign",current_sign);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return new ResponseEntity<>(result.toString(), responseHeaders, HttpStatus.OK);
        }
        return null;
    }

    /*@RequestMapping(value = "/wxpay/trade")
    public String sendWX(HttpServletRequest request, HttpServletResponse httpResponse) throws Exception {

        String pay_number=request.getParameter("pay_id");
        JSONObject result=new JSONObject();
        String openId=(String) request.getSession().getAttribute("openId");

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
            //total_fee="1";//
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
                    result.put("package","prepay_id="+prepay_id);
                    result.put("noncestr",current_noncestr);
                    result.put("timestamp",current_timestamp);
                    //加密算法
                    String nowStringA="appid="+PayConfigUtils.getWx_app_id()+"&noncestr="+current_noncestr+"&package=Sign=WXPay&partnerid="+PayConfigUtils.getWx_mch_id()+"&prepayid="+prepay_id+"&timestamp="+current_timestamp+"&key="+PayConfigUtils.getWx_app_secret_key();
                    current_sign=Utils.encode("MD5",nowStringA).toUpperCase();
                    result.put("paySign",current_sign);

                    request.getSession().setAttribute("result",result);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "76/campaign_76_index";
        }
        return null;
    }*/

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
        System.out.println(result);
        return result;
    }

}
