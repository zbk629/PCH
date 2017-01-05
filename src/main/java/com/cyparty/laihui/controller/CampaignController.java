package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.Campaign;
import com.cyparty.laihui.domain.Code;
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
        try {
            user_id=laiHuiDB.getIDByToken(token);
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

                            if(user_id!=0){
                                laiHuiDB.createCampaign(campaign);
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
        }
        json = ReturnJsonUtil.returnFailJsonString(result, "参数错误！");
        return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
    }


}
