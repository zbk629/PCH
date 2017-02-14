package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.Code;
import com.cyparty.laihui.domain.ErrorCodeMessage;
import com.cyparty.laihui.domain.User;
import com.cyparty.laihui.utilities.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by zhu on 2016/5/11.
 */
@Controller
public class LoginController {
    @Autowired
    LaiHuiDB laiHuiDB;
    boolean is_logined=false;
    @RequestMapping("/MP_verify_suf8fVQzCk0Mh42y.txt")
    public ResponseEntity<String> checkWX(){
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        return new ResponseEntity<String>("suf8fVQzCk0Mh42y",responseHeaders, HttpStatus.OK);
    }
    @RequestMapping("/login")
    public String car_departure(Model model, HttpServletRequest request) {
        String mode = request.getParameter("mode");
        //微信登陆
        if (mode != null && mode.equals("wx")) {
            String code = request.getParameter("code");
            User user = WxUserBaseUtil.getUserWXIntro(code,"wx");
            boolean isExisting = false;
            //把该微信用户存入数据库
            String where = " where user_wx_unionid ='" + user.getUser_unionid() + "'";
            List<User> userList = laiHuiDB.getWxUser(where);
            if (userList.size() > 0) {
                String update_sql = " set user_last_login='" + Utils.getCurrentTime() + "' where user_id=" + userList.get(0).getUser_id();
                laiHuiDB.update("pc_wx_user", update_sql);
                isExisting = true;
            }
            if (!isExisting) {
                int id=0;
                if(user.getUser_token()!=null&&user.getUser_unionid()!=null){
                    id = laiHuiDB.createWxUser(user);
                }
                //下面保存手机号和密码
                if(id!=0){
                    request.getSession().setAttribute("user_id", id);
                    return "redirect:/reg" ;
                }
                return "/";
            } else {
                User now_user = userList.get(0);
                if (now_user.getUser_mobile() != null && now_user.getUser_mobile().length() == 11) {
                    request.getSession().setAttribute("user_id", now_user.getUser_id());
                    request.getSession().setAttribute("user", now_user);
                    request.getSession().setAttribute("user_mobile",now_user.getUser_mobile());
                    String ref=request.getParameter("ref");
                    if(ref!=null){
                        return "redirect:/laihui/car/detail?id="+ref;
                    }else {
                        return "redirect:/auth/base";
                    }
                } else {
                    request.getSession().setAttribute("user_id", now_user.getUser_id());
                    return "redirect:/reg";
                }
            }
        }else if (mode != null && mode.equals("wx_map")) {
            String ref=request.getHeader("referer");
            String code = request.getParameter("code");
            User user = WxUserBaseUtil.getUserWXIntro(code,"wx_map");
            int user_id=0;
            try {
                user_id=(Integer)request.getSession().getAttribute("user_id");
            } catch (Exception e) {
                user_id=0;
                e.printStackTrace();
            }
            if(user_id!=0){
                //update
                if(user.getOpenid()!=null){
                    String update_sql=" set user_map_openid='"+user.getOpenid()+"' where user_id="+user_id;
                    boolean is_success=laiHuiDB.update("pc_wx_user",update_sql);
                    if(is_success){
                        String where =" where user_id="+user_id;
                        User now_user=laiHuiDB.getWxUser(where).get(0);
                        request.getSession().setAttribute("user",now_user);
                    }
                }
                return "redirect:/auth/base";
            }
        }
        return "redirect:/";
    }
    @RequestMapping("/sendCode")
    public ResponseEntity<String> getOpenId( HttpServletRequest request) {
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        //微信登陆
        String code = request.getParameter("code");
        User user = WxUserBaseUtil.getUserWXIntro(code,"wx");

        return new ResponseEntity<>(user.getOpenid(), responseHeaders, HttpStatus.OK);
    }
    @RequestMapping("/share_spread")
    public String share_spread(HttpServletRequest request, Model model) {
            return "share_spread";
    }
    //提现主页
    @RequestMapping("/withdraw_cash")
    public String withdraw_cash(HttpServletRequest request, Model model) {
            return "withdraw_cash";
    }
    //提现支付
    @RequestMapping("/withdraw_cash_pay")
    public String withdraw_cash_pay(HttpServletRequest request, Model model) {
        return "withdraw_cash_pay";
    }
    //退款
    @RequestMapping("/refund_page")
    public String refund_money(HttpServletRequest request, Model model) {
        return "refund_page";
    }
    //账户明细
    @RequestMapping("/account_list")
    public String account_list(HttpServletRequest request, Model model) {
        return "account_list";
    }
    //账户详情
    @RequestMapping("/account_detail")
    public String account_detail(HttpServletRequest request, Model model) {
        return "account_detail";
    }
    //全民代理
    @RequestMapping("/universal_agency")
    public String universal_agency(HttpServletRequest request, Model model) {
        return "universal_agency";
    }
    //全民代理--账户明细
    @RequestMapping("/universal_account")
    public String universal_account(HttpServletRequest request, Model model) {
        return "universal_account";
    }
    @RequestMapping("/wx_map")
    public String wx_map(HttpServletRequest request, Model model) {
        return "wx_map";
    }
    @RequestMapping("/reg")
    public String register(HttpServletRequest request, Model model) {

//        is_logined=Utils.isLogined(request);
        is_logined=true;
        if(is_logined){
            return "register";
        }
        return "redirect:/";
    }
    @RequestMapping("/auth/base")
    public String self(HttpServletRequest request, Model model) {
        is_logined=Utils.isLogined(request);
        if(is_logined){
            return "auth_base";
        }
        return "redirect:/";
    }
    @RequestMapping("/wx/login")
    public String weixin(HttpServletRequest request, Model model) {
        is_logined=Utils.isLogined(request);
        if(is_logined){
            return "redirect:/auth/base";
        }else {
            String ref_id=request.getParameter("ref");
            if(ref_id!=null){
                return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc0d2e309454d7e18&redirect_uri=http%3A%2F%2Fwx.pinchenet.com%2Flogin%3fmode%3dwx%26ref%3d"+ref_id+"&response_type=code&scope=snsapi_login&state=dac24d03f848ce899f28ad787eba74e2&connect_redirect=1#wechat_redirect";
            }else {
                return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc0d2e309454d7e18&redirect_uri=http%3A%2F%2Fwx.pinchenet.com%2Flogin?mode=wx&response_type=code&scope=snsapi_login&state=dac24d03f848ce899f28ad787eba74e2&connect_redirect=1#wechat_redirect";
            }
        }
    }
    @RequestMapping("/wx/sendCode")
    public String send(HttpServletRequest request) {
        String pre_id=request.getParameter("pay_id");
        return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx79fccf65feb81e80&redirect_uri=http%3A%2F%2Flaihuiwx.cyparty.com%2Fwxpay%2Ftrade?pay_id="+pre_id+"&response_type=code&scope=snsapi_base&state=dac24d03f848ce899f28ad787eba74e2&connect_redirect=1#wechat_redirect";
    }
    @RequestMapping("/wx/pc/login")
    public String pc(HttpServletRequest request, Model model) {
        is_logined=Utils.isLogined(request);
        if(is_logined){
            return "redirect:/auth/base";
        }else {

            return "redirect:https://open.weixin.qq.com/connect/qrconnect?appid=wxc0d2e309454d7e18&redirect_uri=http%3A%2F%2Fwx.pinchenet.com%2Flogin?mode=wx&response_type=code&scope=snsapi_login&state=dac24d03f848ce899f28ad787eba74e2#wechat_redirect";
        }
    }
    @RequestMapping("/wx/map/login")
    public String weixin_map(HttpServletRequest request, Model model) {
        return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx79fccf65feb81e80&redirect_uri=http%3A%2F%2Fhuodong.pinchenet.com%2Ftransfer?mode=wx_map&response_type=code&scope=snsapi_base&state=dac24d03f848ce899f28ad787eba74e2&connect_redirect=1#wechat_redirect";
    }
    @ResponseBody
    @RequestMapping(value = "/api/reg", method = RequestMethod.POST)
    public ResponseEntity<String> reg(HttpServletRequest request) {
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        JSONObject result = new JSONObject();
        String json = "";
        try {
            //得到有效的手机号
            String mobile = request.getParameter("mobile");
            String action = request.getParameter("action");
            int id = 0;
            //todo:user_id改为从session中获取
            if (request.getSession().getAttribute("user_id") != null) {
                try {
                    id = (Integer) request.getSession().getAttribute("user_id");
                } catch (Exception e) {
                    id = 0;
                    e.printStackTrace();
                }
            }
            /*if (request.getParameter("user_id") != null) {
                try {
                    id = (Integer.parseInt(request.getParameter("user_id"))) ;
                } catch (Exception e) {
                    id = 0;
                    e.printStackTrace();
                }
            }*/
            String code = "";
            boolean is_success = true;
            switch (action) {
                case "sms":
                    if (id != 0) {
                        int total = laiHuiDB.getSendCodeTimes(mobile);
                        if (total <= 3) {
                            //发送验证码
                            code = Utils.sendCodeMessage(mobile);
                        } else {
                            json = ReturnJsonUtil.returnFailJsonString(result, "发送验证码过于频繁，请稍后重试！");
                            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                        }
                        if (code != null) {
                            //保存记录
                            laiHuiDB.createSMS(mobile, code);
                            json = ReturnJsonUtil.returnSuccessJsonString(result, "验证码发送成功！");
                            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                        } else {
                            json = ReturnJsonUtil.returnFailJsonString(result, "验证码发送失败，请校验您输入的手机号是否正确！");
                            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                        }
                    } else {
                        result.put("error_code", ErrorCodeMessage.getLoginError_code());
                        json = ReturnJsonUtil.returnFailJsonString(result, "链接失效，请重新打开！");
                        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                    }
                case "sms_check":
                    if (id != 0) {
                        code = request.getParameter("code");
                        String where = " where mobile='" + mobile + "' ";
                        List<Code> codeList = laiHuiDB.getSMS(where);
                        if (codeList.size() > 0) {
                            Code now_code = codeList.get(0);
                            if (now_code.getCode().equals(code)) {
                                //更新该用户手机号
                                String update_sql = " set user_mobile='" + mobile + "' where user_id=" + id;
                                laiHuiDB.update("pc_wx_user", update_sql);
                                String where_now=" where user_id="+id;
                                User user=laiHuiDB.getWxUser(where_now).get(0);
                                request.getSession().setAttribute("user_mobile",user.getUser_mobile());
                                request.getSession().setAttribute("user",user);

                                json = ReturnJsonUtil.returnSuccessJsonString(result, "验证码校验通过！");
                                return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                            } else {
                                json = ReturnJsonUtil.returnFailJsonString(result, "验证码校验失败，请核对您的校验码！");
                                return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                            }
                        } else {
                            json = ReturnJsonUtil.returnFailJsonString(result, "请确认是否收到验证码！");
                            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                        }
                    } else {
                        result.put("error_code", ErrorCodeMessage.getLoginError_code());
                        json = ReturnJsonUtil.returnFailJsonString(result, "链接失效，请重新打开！");
                        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                    }

            }
            json = ReturnJsonUtil.returnFailJsonString(result, "获取参数错误");
            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.BAD_REQUEST);

        } catch (Exception e) {
            e.printStackTrace();
            json = ReturnJsonUtil.returnFailJsonString(result, "获取参数错误");
            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.BAD_REQUEST);
        }
    }
    @ResponseBody
    @RequestMapping(value = "/api/user/info", method = RequestMethod.POST)
    public ResponseEntity<String> info(HttpServletRequest request) {
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        JSONObject result = new JSONObject();
        String json = "";
        try {
            //得到有效的手机号
            String action = request.getParameter("action");
            int id = 0;
            //todo:user_id改为从session中获取
            if (request.getSession().getAttribute("user_id") != null) {

                try {
                    id = (Integer) request.getSession().getAttribute("user_id");
                } catch (Exception e) {
                    id = 0;
                    e.printStackTrace();
                }
            }
            /*if (request.getParameter("user_id") != null) {
                try {
                    id = (Integer.parseInt(request.getParameter("user_id"))) ;
                } catch (Exception e) {
                    id = 0;
                    e.printStackTrace();
                }
            }*/
            boolean is_success = true;
            switch (action) {
                case "base":
                    if (id != 0) {
                        json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getUserInfo(laiHuiDB,id), "用户基本信息获取成功！");
                        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                    }
                    result.put("error_code", ErrorCodeMessage.getLoginError_code());
                    json = ReturnJsonUtil.returnFailJsonString(result, "登陆状态失效，请重新登陆！");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);

                case "un_binding":
                    if (id != 0) {
                        String update_sql=" set user_mobile=null where user_id="+id;
                        laiHuiDB.update("pc_wx_user",update_sql);
                        json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getUserInfo(laiHuiDB,id), "解绑成功！");
                        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                    }
                    result.put("error_code", ErrorCodeMessage.getLoginError_code());
                    json = ReturnJsonUtil.returnFailJsonString(result, "登陆状态失效，请重新登陆！");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);

            }
            json = ReturnJsonUtil.returnFailJsonString(result, "获取参数错误");
            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.BAD_REQUEST);

        } catch (Exception e) {
            e.printStackTrace();
            json = ReturnJsonUtil.returnFailJsonString(result, "获取参数错误");
            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.BAD_REQUEST);
        }
    }
    @RequestMapping("/app/download")
    public String download(Model model,HttpServletRequest request){


        return "app_download";

    }
    /***
     *拼车文案
     */
    @RequestMapping("/app/pinche_rules")
    public String pinche_rules(Model model,HttpServletRequest request){


        return "pinche_rules";

    }
    @RequestMapping("/app/pinche_instructions")
    public String pinche_instructions(Model model,HttpServletRequest request){


        return "pinche_instructions";

    }
    @RequestMapping("/app/pinche_FQA")
    public String pinche_FQA(Model model,HttpServletRequest request){


        return "pinche_FQA";

    }
    @RequestMapping("/laihui/accounting_rules/share")
    public String accounting_rules_share(Model model, HttpServletRequest request) {
        return "accounting_rules_share";
    }

    @RequestMapping("/app/download/url")
    public String download() {
        return "download";
    }
    //全民代理规则说明
    @RequestMapping("/app/agent_rule")
    public String agent_rule(Model model,HttpServletRequest request){
        return "agent_rule";
    }
}
