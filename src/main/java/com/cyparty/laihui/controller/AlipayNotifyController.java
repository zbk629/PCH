package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.db.LHDB;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.AlipayNotify;
import com.cyparty.laihui.utilities.ReturnJsonUtil;
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
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Map;

/**
 * Created by zhu on 2016/5/11.
 */
@Controller
public class AlipayNotifyController {
    private static final String publickey="MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";
    //private static final String publickey="km03j0ahu78h7s2v3j2oxqb9vqqi94gs";
    @Autowired
    LaiHuiDB laiHuiDB;
    @ResponseBody
    @RequestMapping(value = "/alipay/notify", method = RequestMethod.POST)
    public ResponseEntity<String> departure(HttpServletRequest request,HttpServletResponse response) {

        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        JSONObject result = new JSONObject();
        String json = "";

        boolean is_success = true;
        Map<String, String[]> parameterMap = request.getParameterMap();

        int size = parameterMap.size()-2;
        String[] parameters = new String[size];
        int i = 0;
        for (String key : parameterMap.keySet()) {
            if(!key.equals("sign")&&!key.equals("sign_type")){
                parameters[i] = key;
                i++;
            }
        }
        String result_parameter = "";
        Arrays.sort(parameters);
        for (String str : parameters) {
            result_parameter = result_parameter + str +"="+ parameterMap.get(str)[0]+"&";
        }
        result_parameter=result_parameter.substring(0,result_parameter.length()-1);

        String discount = request.getParameter("discount");
        String payment_type = request.getParameter("payment_type");
        String subject = request.getParameter("subject");
        String trade_no = request.getParameter("trade_no");
        String buyer_email = request.getParameter("buyer_email");
        String gmt_create = request.getParameter("gmt_create");
        String notify_type = request.getParameter("notify_type");
        String quantity = request.getParameter("quantity");
        String out_trade_no = request.getParameter("out_trade_no");
        String seller_id = request.getParameter("seller_id");
        String notify_time = request.getParameter("notify_time");
        String body = request.getParameter("body");
        String trade_status = request.getParameter("trade_status");
        String is_total_fee_adjust = request.getParameter("is_total_fee_adjust");
        String total_fee = request.getParameter("total_fee");
        String gmt_payment = request.getParameter("gmt_payment");
        String seller_email = request.getParameter("seller_email");
        String price = request.getParameter("price");
        String buyer_id = request.getParameter("buyer_id");
        String notify_id = request.getParameter("notify_id");
        String use_coupon = request.getParameter("use_coupon");
        String sign_type = request.getParameter("sign_type");
        String sign = request.getParameter("sign");

        //is_success=verify(result_parameter,sign);
//        if(is_success){
            if(trade_status!=null&&(trade_status.equals("TRADE_SUCCESS")||trade_status.equals("TRADE_FINISHED"))){
                AlipayNotify alipay=new AlipayNotify();

                alipay.setBuyer_email(buyer_email);
                alipay.setBuyer_id(buyer_id);
                alipay.setSeller_email(seller_email);
                alipay.setSeller_id(seller_id);
                alipay.setGmt_create(gmt_create);
                alipay.setTrade_status(trade_status);
                alipay.setPrice(price);
                alipay.setSign(sign);
                alipay.setOut_trade_no(out_trade_no);
                alipay.setDiscount(discount);
                alipay.setPayment_type(payment_type);
                alipay.setTrade_no(trade_no);
                alipay.setNotify_type(notify_type);
                alipay.setQuantity(quantity);
                alipay.setNotify_time(notify_time);
                alipay.setBody(body);
                alipay.setTotal_fee(total_fee);
                alipay.setGmt_payment(gmt_payment);
                alipay.setNotify_id(notify_id);
                alipay.setUse_coupon(use_coupon);
                alipay.setSign_type(sign_type);
                alipay.setIs_total_fee_adjust(is_total_fee_adjust);
                alipay.setSubject(subject);
                is_success=laiHuiDB.createAlipayNotify(alipay,parameterMap.size());
                if(is_success){
                    try {
                        if(subject!=null&&subject.equals("诚信保证金")){
                            //int id=Integer.parseInt(out_trade_no.substring(17));
                            //更新司机发车单状态
                            LHDB.transactionDemo(out_trade_no);
                            //laiHuiDB.procedureUpdateDriverPublishInfo(1,id,0,out_trade_no);
                        }
                        PrintWriter out=response.getWriter();
                        out.write("success");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
//        }
        json = ReturnJsonUtil.returnSuccessJsonString(result, "响应成功");
        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
    }
    //校验sign

   /* public static boolean verify( String plainText, String sign) {
        try {
            boolean is_passed=AlipaySignature.rsaCheckContent(plainText,sign,publickey,"GBK");
            // 验证签名是否正常
            return is_passed;
        } catch (Throwable e) {
            System.out.println("校验签名失败");
            e.printStackTrace();
            return false;
        }
    }*/
    /**
     * 从公钥数据取得公钥
     *
     * @param bPubKeyInput
     * @return
     */
//    public static PublicKey getPublicKey(byte[] bPubKeyInput) {
//        PublicKey rsaPubKey = null;
//        byte[] bX509PubKeyHeader = { 48, -127, -97, 48, 13, 6, 9, 42, -122, 72,
//                -122, -9, 13, 1, 1, 1, 5, 0, 3, -127, -115, 0 };
//        try {
//            byte[] bPubKey = new byte[bPubKeyInput.length
//                    + bX509PubKeyHeader.length];
//            System.arraycopy(bX509PubKeyHeader, 0, bPubKey, 0,
//                    bX509PubKeyHeader.length);
//            System.arraycopy(bPubKeyInput, 0, bPubKey,
//                    bX509PubKeyHeader.length, bPubKeyInput.length);
//
//            X509EncodedKeySpec rsaKeySpec = new X509EncodedKeySpec(bPubKey);
//            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
//            rsaPubKey = keyFactory.generatePublic(rsaKeySpec);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return rsaPubKey;
//
//    }


}
