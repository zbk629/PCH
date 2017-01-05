package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.db.LHDB;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.AlipayNotify;
import com.cyparty.laihui.domain.PayLog;
import com.cyparty.laihui.utilities.PercentageConfig;
import com.cyparty.laihui.utilities.ReturnJsonUtil;
import com.cyparty.laihui.utilities.Utils;
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
import java.util.*;

/**
 * Created by zhu on 2016/5/11.
 */
@Controller
public class PayController {

    @Autowired
    LaiHuiDB laiHuiDB;
    @ResponseBody
    @RequestMapping(value = "/pay/abstract", method = RequestMethod.POST)
    public ResponseEntity<String> departure(HttpServletRequest request,HttpServletResponse response) {

        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        JSONObject result = new JSONObject();
        String json = "";

        String token=request.getParameter("token");
        int user_id=0;
        if(token!=null&&!token.isEmpty()){
            try {
                user_id = laiHuiDB.getIDByToken(token);
            } catch (Exception e) {
                user_id=0;
                e.printStackTrace();
            }
        }
        if(user_id==0){
            json = ReturnJsonUtil.returnFailJsonString(result, "参数错误！");
            return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
        }else {
            double campaign_cash=0;
            double unable_campaign_cash=0;
            double pc_cash=0;
            double unable_pc_cash=0;
            double total_cash=0;
            double unable_total_cash=0;
            double already_got_cash=0;
            double current_cash=0;
            double account_left=0;
            String where=" where p_id="+user_id+" and order_status=1 ";
            List<PayLog> payLogList1=laiHuiDB.getPayLog(where);
            for(PayLog pay:payLogList1){
                //分为可用和即将可用，保护期大于最大支付时间间隔
                long is_enable_timeStamp=Utils.date2TimeStamp(Utils.getTimeSubOrAdd(pay.getDeparture_time(), 24));
                long current_timeStamp=Utils.date2TimeStamp(Utils.getCurrentTime());
                //如果当前时间大于订单创建时间5天，则为可提现金额
                if(current_timeStamp<=is_enable_timeStamp){
                    unable_campaign_cash=unable_campaign_cash+pay.getCash();//即将可用拼车金额
                }
                campaign_cash=campaign_cash+pay.getCash();
            }

            campaign_cash=campaign_cash* PercentageConfig.getCampaign_percentage();
            unable_campaign_cash=unable_campaign_cash* PercentageConfig.getCampaign_percentage();
            //拼车所得
            where=" where driver_id="+user_id+" and order_status=1 ";
            List<PayLog> payLogList2=laiHuiDB.getPayLog(where);
            for(PayLog pay:payLogList2){
                //分为可用和即将可用，保护期大于最大支付时间间隔
                long is_enable_timeStamp=Utils.date2TimeStamp(Utils.getTimeSubOrAdd(pay.getDeparture_time(), 24));
                long current_timeStamp=Utils.date2TimeStamp(Utils.getCurrentTime());
                //如果当前时间大于订单创建时间5天，则为可提现金额
                if(current_timeStamp<=is_enable_timeStamp){
                    unable_pc_cash=unable_pc_cash+pay.getCash();//即将可用拼车金额
                }
                pc_cash=pc_cash+pay.getCash();//全部拼车所得金额
            }
            pc_cash=pc_cash* PercentageConfig.getPc_percentage();
            unable_pc_cash=unable_pc_cash* PercentageConfig.getPc_percentage();
            total_cash=campaign_cash+pc_cash;
            unable_total_cash=unable_campaign_cash+unable_pc_cash;//全部即将可用金额
            where=" where user_id="+user_id+" and action_type=1 ";//and order_status=1
            List<PayLog> payLogList3=laiHuiDB.getPayLog(where);
            for(PayLog pay:payLogList3){
                already_got_cash=already_got_cash+pay.getCash();
            }
            current_cash=total_cash-already_got_cash-unable_total_cash;
            account_left=total_cash-already_got_cash;

            result.put("campaign_cash",campaign_cash);//推广收入
            result.put("total_cash",account_left);//全部收入
            result.put("already_got_cash",already_got_cash);//已提现金额
            result.put("current_cash",current_cash);//当前可提现金额
        }
        json = ReturnJsonUtil.returnSuccessJsonString(result, "响应成功");
        return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
    }
    @ResponseBody
    @RequestMapping(value = "/pay/list", method = RequestMethod.POST)
    public ResponseEntity<String> list(HttpServletRequest request){
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        JSONObject result=new JSONObject();
        String json="";
        String token=request.getParameter("token");
        String type=request.getParameter("type");
        int user_id=0;
        if(token!=null&&!token.isEmpty()){
            try {
                user_id = laiHuiDB.getIDByToken(token);
            } catch (Exception e) {
                user_id=0;
                e.printStackTrace();
            }
        }
        if(user_id==0){
            json = ReturnJsonUtil.returnFailJsonString(result, "非法token！");
            return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
        }else {
            if(type==null||type.isEmpty()){
                String where=" where p_id="+user_id+" and order_status=1";//推广
                List<PayLog> payLogList1=laiHuiDB.getPayLog(where);
                for(PayLog payLog:payLogList1){
                    payLog.setAction_type(1);//推广
                    payLog.setCash(payLog.getCash()*PercentageConfig.getCampaign_percentage());
                }
                where=" where driver_id="+user_id+" and order_status=1 ";//拼车
                List<PayLog> payLogList2=laiHuiDB.getPayLog(where);
                for(PayLog payLog:payLogList2){
                    payLog.setAction_type(2);//拼车
                    payLog.setCash(payLog.getCash()*PercentageConfig.getPc_percentage());
                }
                where=" where user_id="+user_id+" and action_type=1 ";//提现
                List<PayLog> payLogList3=laiHuiDB.getPayLog(where);
                for(PayLog payLog:payLogList3){
                    payLog.setAction_type(3);//提现
                }
                where=" where user_id="+user_id+" and action_type=0 ";//乘客拼车
                List<PayLog> payLogList4=laiHuiDB.getPayLog(where);
                for(PayLog payLog:payLogList4){
                    payLog.setAction_type(4);//乘客
                    payLog.setCash(-payLog.getCash());
                }
                List<PayLog> payLogList=new ArrayList<>();
                payLogList.addAll(payLogList1);
                payLogList.addAll(payLogList2);
                payLogList.addAll(payLogList3);
                payLogList.addAll(payLogList4);

                Collections.sort(payLogList);


                json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getAllPayLog(payLogList), "响应成功");
                return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
            }else if(type.equals("1")){
                //推广
                String where=" where p_id="+user_id+" and order_status=1";//推广
                List<PayLog> payLogList1=laiHuiDB.getPayLog(where);
                for(PayLog payLog:payLogList1){
                    payLog.setAction_type(1);//推广
                    payLog.setCash(payLog.getCash()*PercentageConfig.getCampaign_percentage());
                }

                List<PayLog> payLogList=new ArrayList<>();
                payLogList.addAll(payLogList1);

                Collections.sort(payLogList);

                json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getAllPayLog(payLogList), "响应成功");
                return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
            }else if(type.equals("3")){
                //提现
                String where=" where user_id="+user_id+" and action_type=1 ";//提现
                List<PayLog> payLogList3=laiHuiDB.getPayLog(where);
                for(PayLog payLog:payLogList3){
                    payLog.setAction_type(3);//提现
                }
                List<PayLog> payLogList=new ArrayList<>();
                payLogList.addAll(payLogList3);
                Collections.sort(payLogList);

                json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getAllPayLog(payLogList), "响应成功");
                return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
            }else {
                json = ReturnJsonUtil.returnFailJsonString(result, "参数错误");
                return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
            }
        }
    }

    @ResponseBody
    @RequestMapping(value = "/pay/info", method = RequestMethod.POST)
    public ResponseEntity<String> info(HttpServletRequest request){
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        JSONObject result=new JSONObject();
        String json="";
        String token=request.getParameter("token");
        String type=request.getParameter("type");
        String id=request.getParameter("id");
        int user_id=0;
        if(token!=null&&!token.isEmpty()){
            try {
                user_id = laiHuiDB.getIDByToken(token);
            } catch (Exception e) {
                user_id=0;
                e.printStackTrace();
            }
        }
        if(user_id==0){
            json = ReturnJsonUtil.returnFailJsonString(result, "非法token！");
            return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
        }else {
            json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getPayInfo(laiHuiDB,type,id), "详情获取成功");
            return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
        }
    }
    @ResponseBody
    @RequestMapping(value = "/pay/account", method = RequestMethod.POST)
    public ResponseEntity<String> pay_account(HttpServletRequest request){
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        JSONObject result=new JSONObject();
        String json="";
        String token=request.getParameter("token");
        String action=request.getParameter("action");
        String type=request.getParameter("type");
        int user_id=0;
        if(token!=null&&!token.isEmpty()){
            try {
                user_id = laiHuiDB.getIDByToken(token);
            } catch (Exception e) {
                user_id=0;
                e.printStackTrace();
            }
        }
        if(user_id==0){
            json = ReturnJsonUtil.returnFailJsonString(result, "非法token！");
            return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
        }else {
            PayLog payLog=new PayLog();
            switch (action){
                case "show":
                    String where=" where user_id="+user_id+" and action_type=1  order by create_time DESC limit 0,1";
                    List<PayLog> payLogList=laiHuiDB.getPayLog(where);
                    if(payLogList.size()>0){
                        payLog=payLogList.get(0);
                        result.put("pay_account",payLog.getPay_account());
                        result.put("type",payLog.getPay_type());
                    }else {
                        result.put("pay_account","");
                        result.put("type",-1);
                    }
                    json = ReturnJsonUtil.returnSuccessJsonString(result, "上次提现记录获取成功！");
                    return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
                case "add":
                    String pay_account=request.getParameter("pay_account");
                    int pay_type=0;
                    double cash=0;
                    try {
                        pay_type=Integer.parseInt(request.getParameter("pay_type"));
                        cash=Double.parseDouble(request.getParameter("cash"));

                    } catch (NumberFormatException e) {

                        json = ReturnJsonUtil.returnFailJsonString(result, "提现类型有误！");
                        return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
                    }

                    payLog.setUser_id(user_id);
                    payLog.setPay_account(pay_account);
                    payLog.setPay_type(pay_type);
                    payLog.setCash(cash);

                    laiHuiDB.createPayLog(payLog);

                    json = ReturnJsonUtil.returnSuccessJsonString(result, "提现申请提交成功！");
                    return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
            }
            json = ReturnJsonUtil.returnFailJsonString(result, "参数错误！");
            return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
        }
    }

}
