package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.internal.util.AlipaySignature;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.*;
import com.cyparty.laihui.utilities.PayConfigUtils;
import com.cyparty.laihui.utilities.Utils;
import com.cyparty.laihui.utilities.XmlParse;
import org.apache.commons.io.IOUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
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
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.*;


/**
 * Created by zhu on 2016/5/11.
 */
@Controller
public class PayNotifyController {
    private static final String publickey="MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB";
    @Autowired
    LaiHuiDB appDB;
    @ResponseBody
    @RequestMapping(value = "/alipay/notify", method = RequestMethod.POST)
    public ResponseEntity<String> departure(HttpServletRequest request, HttpServletResponse response) {

        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        JSONObject result = new JSONObject();
        String json = "";
        boolean is_success ;
        Map<String, String[]> parameterMap = request.getParameterMap();

        int size = parameterMap.size()-2;
        String[] parameters = new String[size];
        Map<String,String> params=new HashMap<>();
        int i = 0;
        for (String key : parameterMap.keySet()) {
            if(!key.equals("sign")&&!key.equals("sign_type")){
                parameters[i] = key;
                params.put(key,parameterMap.get(key)[0]);
                i++;
            }
        }


        String result_parameter = "";
        Arrays.sort(parameters);
        for (String str : parameters) {
            result_parameter = result_parameter + str +"="+ parameterMap.get(str)[0]+"&";
        }
        result_parameter=result_parameter.substring(0,result_parameter.length()-1);

        String sign = request.getParameter("sign");

        System.out.println("-----开始处理支付宝通知------");
        is_success=verify(result_parameter,sign);
        System.out.println("verify校验："+is_success);

        String out_trade_no = request.getParameter("out_trade_no");
        String trade_status = request.getParameter("trade_status");

        if(is_success){
            if(trade_status!=null){

                boolean is_pay_success=false;
                if(trade_status.equals("TRADE_SUCCESS")||trade_status.equals("TRADE_FINISHED")){
                    is_pay_success=true;
                }
                if(is_success&&is_pay_success){

                    String where =" where pay_number="+out_trade_no+" and pay_status=0";
                    OrderOf76 order;
                    List<OrderOf76> orderList = appDB.getOrderOf76(where);
                    if(orderList.size()>0){
                        //支付完成，更改各个状态
                        order=orderList.get(0);
                        String update_sql=" set pay_status=1 ,pay_type=1,update_time='"+ Utils.getCurrentTime()+"' where _id="+order.getId()+" and pay_status=0";//记录状态
                        appDB.update("pc_76_orders",update_sql);

                        System.out.println("订单状态更新成功！");

                    }else {
                        System.out.println("未查询到该商户号对应的订单信息");
                    }
                    PrintWriter out = null;
                    try {
                        response.reset();
                        out = response.getWriter();
                        out.write("success");
                    } catch (IOException e) {
                        e.printStackTrace();
                    } finally {
                        out.close();
                    }
                }
            }
        }
        return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
    }
    //校验sign
    public static boolean verify( String plainText, String sign) {
        try {
            boolean is_passed= AlipaySignature.rsaCheckContent(plainText, sign, publickey, "utf-8");

            // 验证签名是否正常
            return is_passed;
        } catch (Throwable e) {
            System.out.println("校验签名失败");
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping(value = "/wx_pay/notify", method = RequestMethod.POST)
    public ResponseEntity<String> wx_pay(HttpServletRequest request, HttpServletResponse response) {

        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        String json = "";
        try {
            PrintWriter out=response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String response_content="<xml> \n" +
                "\n" +
                "  <return_code><![CDATA[SUCCESS]]></return_code>\n" +
                "  <return_msg><![CDATA[OK]]></return_msg>\n" +
                "</xml> \n";
        //获取回执参数
        System.out.println("-----开始处理微信通知------");
        InputStream is;
        String return_xml=null;
        try {
            is = request.getInputStream();
            return_xml= IOUtils.toString(is, "utf-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
        //System.out.println("微信异步通知内容："+return_xml);
        boolean is_success = true;
        Document doc ;
        Map<String, String> parameterMap = new HashMap<>();
        try {
            doc = DocumentHelper.parseText(return_xml); // 将字符串转为XML
            Element rootElt = doc.getRootElement(); // 获取根节点
            Iterator return_code = rootElt.elementIterator("return_code"); // 获取根节点下的子节点return_code

            while (return_code.hasNext()) {
                Element recordEle = (Element) return_code.next();
                String code = recordEle.getText(); // 拿到return_code返回值
                if(code!=null&&code.equals("SUCCESS"))
                {
                    is_success=true;
                }
                System.out.println("code:" + code);
            }
            if(is_success){
                //System.out.println("得到的xml:"+return_xml);
                parameterMap= XmlParse.parse(return_xml);
            }else {
                //直接停止执行
                PrintWriter out = null;
                try {
                    response.reset();
                    out = response.getWriter();
                    out.write(response_content);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    out.close();
                }
                return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
            }
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        String sign = parameterMap.get("sign");
        String result_code = parameterMap.get("result_code");
        String out_trade_no = parameterMap.get("out_trade_no");
        //System.out.println("map大小："+parameterMap.size()+"sign="+sign+"result_code="+result_code+"out_trade_no="+out_trade_no);

        List<String> keys=new ArrayList<>(parameterMap.keySet());
        keys.remove("sign");
        String result_parameter = "";
        Collections.sort(keys);
        for (String str : keys) {
            result_parameter = result_parameter + str +"="+ parameterMap.get(str)+"&";
        }
        result_parameter=result_parameter+"key="+ PayConfigUtils.getWx_app_secret_key();

        //System.out.println("待签名字符串为："+result_parameter);
        String current_sign= Utils.encode("MD5",result_parameter).toUpperCase();
        if(current_sign.equals(sign))
        {
            is_success=true;
        }else {
            is_success=false;
        }
        System.out.println("微信支付签名校验："+is_success);

        if(is_success){
            if(result_code.equals("SUCCESS")){
                if(is_success) {
                    String where =" where pay_number="+out_trade_no+" and pay_status=0";
                    OrderOf76 order;
                    List<OrderOf76> orderList = appDB.getOrderOf76(where);
                    if(orderList.size()>0){
                        //支付完成，更改各个状态
                        order=orderList.get(0);
                        String update_sql=" set pay_status=1 ,pay_type=0,update_time='"+ Utils.getCurrentTime()+"' where _id="+order.getId()+" and pay_status=0";//记录状态
                        appDB.update("pc_76_orders",update_sql);

                        System.out.println("订单状态更新成功！");

                    }else {
                        System.out.println("未查询到该商户号对应的订单信息");
                    }
                    PrintWriter out = null;
                    try {
                        response.reset();
                        out = response.getWriter();
                        out.write(response_content);
                    } catch (IOException e) {
                        e.printStackTrace();
                    } finally {
                        out.close();
                    }
                }
            }
        }
        return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
    }

}
