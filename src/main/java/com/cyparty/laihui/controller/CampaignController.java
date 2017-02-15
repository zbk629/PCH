package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.*;
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
import java.util.List;

/**
 * Created by zhu on 2016/5/11.
 */
@Controller
public class CampaignController {
    @Autowired
    LaiHuiDB laiHuiDB;

    @ResponseBody
    @RequestMapping(value = "/campaign",method=RequestMethod.POST)
    public ResponseEntity<String> share(HttpServletRequest request) {
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        String token = request.getParameter("token");
        String action = request.getParameter("action");
        String mobile = request.getParameter("mobile");
        String json;
        JSONObject result=new JSONObject();
        int user_id;
        String user_mobile="";
        try {
            user_id=laiHuiDB.getIDByToken(token);
            String where=" where _id="+user_id;
            user_mobile=laiHuiDB.getUserList(where).get(0).getUser_mobile();
        } catch (Exception e) {
            user_id=0;
            e.printStackTrace();
        }
        String code;

        switch (action) {
            case "sms":
                int total = laiHuiDB.getSendCodeTimes(mobile);
                if (total <= 3) {
                    //发送验证码
                    code = Utils.sendCodeMessage(mobile);
                } else {
                    result.put("error_code",301);
                    json = ReturnJsonUtil.returnFailJsonString(result, "发送验证码过于频繁，请稍后重试！");
                    return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
                }
                if (code != null) {
                    //保存记录
                    laiHuiDB.createSMS(mobile, code);
                    json = ReturnJsonUtil.returnSuccessJsonString(result, "验证码发送成功！");
                    return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
                } else {
                    result.put("error_code",302);
                    json = ReturnJsonUtil.returnFailJsonString(result, "验证码发送失败，请校验您输入的手机号是否正确！");
                    return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
                }
            case "sms_check":
                code = request.getParameter("code");
                String where = " where mobile='" + mobile + "' ";
                List<Code> codeList = laiHuiDB.getSMS(where);
                String update_sql;
                if (codeList.size() > 0) {
                    Code now_code = codeList.get(0);
                    if (now_code.getCode().equals(code)) {
                        //创建该用户
                        where = " where be_popularized_mobile='" + mobile + "'";
                        List<Campaign> userList = laiHuiDB.getCampaign(where);
                        if (userList.size() > 0) {
                            //update
                            where= " where be_popularized_mobile='" + mobile + "' and is_reg!=1 ";
                            List<Campaign> userList1 = laiHuiDB.getCampaign(where);
                            if(userList1.size()>0){
                                json = ReturnJsonUtil.returnSuccessJsonString(result, "记录保存成功！");
                                return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
                            }else {
                                update_sql=" set user_id="+user_id+" where be_popularized_mobile='"+mobile+"'";
                                laiHuiDB.update("pc_campaign",update_sql);
                            }
                        } else {
                            //保存推广记录
                            Campaign campaign=new Campaign();
                            campaign.setUser_id(user_id);
                            campaign.setBe_popularized_mobile(mobile);

                            if(user_id!=0&&!mobile.equals(user_mobile)){
                                String user_where=" where user_mobile like '%"+mobile+"%'";
                                List<AppUser> appUserList=laiHuiDB.getUserList(user_where);
                                if(appUserList.size()>0){
                                    json = ReturnJsonUtil.returnFailJsonString(result, "抱歉，您已经是注册用户了哦！");
                                    return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
                                }
                                laiHuiDB.createCampaign(campaign);
                            }else {
                                json = ReturnJsonUtil.returnFailJsonString(result, "抱歉，自己不能邀请自己哦！");
                                return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
                            }
                        }
                        json = ReturnJsonUtil.returnSuccessJsonString(result, "验证码正确！");
                        return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
                    } else {
                        result.put("error_code",401);
                        json = ReturnJsonUtil.returnFailJsonString(result, "验证码错误，请核对您的校验码！");
                        return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
                    }
                } else {
                    result.put("error_code",402);
                    json = ReturnJsonUtil.returnFailJsonString(result, "请确认是否收到验证码！");
                    return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
                }
            case "show":
                int page=0;
                int size=10;
                if(request.getParameter("page")!=null&&!request.getParameter("page").trim().equals("")){
                    try {
                        page=Integer.parseInt(request.getParameter("page"));
                    } catch (NumberFormatException e) {
                        page=0;
                        e.printStackTrace();
                    }
                }
                if(request.getParameter("size")!=null&&!request.getParameter("size").trim().equals("")){
                    try {
                        size=Integer.parseInt(request.getParameter("size"));
                    } catch (NumberFormatException e) {
                        size=10;
                        e.printStackTrace();
                    }
                }
                int id=0;
                if(token!=null&&!token.isEmpty()){
                    try {
                        id=laiHuiDB.getIDByToken(token);
                    } catch (Exception e) {
                        result.put("status",false);
                        result.put("msg","非法token！");
                    }
                }else {
                    result.put("status",false);
                    result.put("msg","非法token！");
                }
                JSONArray dataArray=new JSONArray();
                int offset=page*size;
                where=" where user_id="+id+" and is_reg=1";
                total=laiHuiDB.getCount("pc_campaign",where);
                where=where+" order by create_time DESC limit "+offset+","+size;

                List<Campaign> campaignList=laiHuiDB.getCampaign(where);
                for(Campaign campaign:campaignList){
                    JSONObject jsonObject=new JSONObject();
                    jsonObject.put("mobile",campaign.getBe_popularized_mobile());
                    jsonObject.put("create_time",campaign.getCreate_time());

                    dataArray.add(jsonObject);
                }
                result.put("data",dataArray);
                result.put("total",total);

                json = ReturnJsonUtil.returnSuccessJsonString(result, "推广人信息获取成功！");
                return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
            case "show_info":
                id=0;
                AppUser user=new AppUser();
                if(token!=null&&!token.isEmpty()){
                    try {
                        id=laiHuiDB.getIDByToken(token);
                        String user_where=" where _id="+id;
                        List<AppUser> userList=laiHuiDB.getUserList(user_where);
                        if(userList.size()>0){
                            user=userList.get(0);
                        }
                    } catch (Exception e) {
                        result.put("status",false);
                        result.put("msg","非法token！");
                    }
                }else {
                    result.put("status",false);
                    result.put("msg","非法token！");
                }
                where=" where user_id="+id+" and is_reg=1";
                int total_campaign=laiHuiDB.getCount("pc_campaign",where);

                where=" where p_id="+user_id+" and order_status=1 ";
                int total_departure=laiHuiDB.getCount("pay_cash_log",where);

                result.put("total_campaign",total_campaign);
                result.put("total_departure",total_departure);

                mobile=user.getUser_mobile();
                String now_mobile=mobile;
                if(mobile.length()==11){
                    mobile=mobile.substring(0,3)+"****"+now_mobile.substring(now_mobile.length()-4);
                }
                result.put("mobile",mobile);
                result.put("avatar",user.getAvatar());

                json = ReturnJsonUtil.returnSuccessJsonString(result, "全民代理信息获取成功！");
                return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
        }

        json = ReturnJsonUtil.returnFailJsonString(result, "参数错误！");
        return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
    }

    /**
     * 活动页面 ,76人烩面
     */
    //76主页
    @RequestMapping("/campaign/76/index")
    public String campaign_76_index(HttpServletRequest request) {
        if(request.getSession().getAttribute("is_got_auth")==null){
            request.getSession().setAttribute("is_got_auth",false);
        }
        return "76/campaign_76_index";
    }
    //76列表
    @RequestMapping("/campaign/76/ddlist")
    public String campaign_76_ddlist() {
        return "76/campaign_76_ddlist";
    }
    //76详情
    @RequestMapping("/campaign/76/detail")
    public String passenger_order_info() {
        return "76/campaign_76_dddetail";
    }


    @ResponseBody
    @RequestMapping(value = "/api/campaign/76", method = RequestMethod.POST)
    public ResponseEntity<String> pay_back(HttpServletRequest request,HttpServletResponse response) {

        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        JSONObject result = new JSONObject();
        String json = "";

        int order_id = 0;

        double goods_price;
        OrderOf76 order=new OrderOf76();
        String data=request.getParameter("data");
        try {
            goods_price=Double.valueOf(request.getParameter("price"));
        } catch (NumberFormatException e) {
            goods_price=0;
        }
        String buyer_location=request.getParameter("location");
        String buyer_name=request.getParameter("user_name");
        String buyer_mobile=request.getParameter("mobile");
        String buyer_description=request.getParameter("description");

        order.setData(data);
        order.setGoods_price(goods_price);
        order.setBuyer_location(buyer_location);
        order.setBuyer_name(buyer_name);
        order.setBuyer_mobile(buyer_mobile);
        order.setBuyer_description(buyer_description);

        try {
            order_id=laiHuiDB.createOderOf76(order);
        } catch (Exception e) {
            order_id=0;
        }
        if (order_id!=0){
            String pay_id=Utils.transformID(order_id);
            String update_sql=" set pay_number='"+pay_id+"' where _id="+order_id;
            laiHuiDB.update("pc_76_orders",update_sql);

            result.put("pay_id",pay_id);
            result.put("pay_money",goods_price);

            json = ReturnJsonUtil.returnSuccessJsonString(result, "订单提交成功！");
            return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
        }
        json = ReturnJsonUtil.returnFailJsonString(result, "订单创建失败！");
        return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
    }


}
