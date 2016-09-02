package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.PassengerOrder;
import com.cyparty.laihui.utilities.ReturnJsonUtil;
import com.cyparty.laihui.utilities.Utils;
import com.cyparty.laihui.utilities.WXUtils;
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
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zhu on 2016/5/11.
 */
@Controller
public class UserActionController {
    @Autowired
    LaiHuiDB laiHuiDB;
    boolean is_logined=false;
    @RequestMapping("/laihui/driver/order_list")
    public String car_departure(Model model, HttpServletRequest request) {
        is_logined= Utils.isLogined(request);
//        is_logined=true;
        if(is_logined){

            return "driver_order_list";
        }
        return "redirect:/";
    }
    @RequestMapping("/laihui/driver/create_order")
    public String create_order(Model model, HttpServletRequest request) {
        is_logined= Utils.isLogined(request);
//        is_logined=true;

        if(is_logined){

            return "driver_create_order";
        }
        return "redirect:/";
    }
    @RequestMapping("/laihui/passenger/order_list")
    public String passenger_order_list(Model model, HttpServletRequest request,HttpServletResponse response) {
        is_logined= Utils.isLogined(request);
//        is_logined=true;
        if(is_logined){
            return "passenger_order_list";
        }
        return "redirect:/";
    }
    @ResponseBody
    @RequestMapping(value = "/api/db/passenger/departure", method = RequestMethod.POST)
    public ResponseEntity<String> booking(HttpServletRequest request) {
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        JSONObject result = new JSONObject();
        String json = "";
        try {
            String action = request.getParameter("action");
            int page = 0;
            int size = 10;
            if (request.getParameter("page") != null && !request.getParameter("page").trim().equals("")) {
                try {
                    page = Integer.parseInt(request.getParameter("page"));
                } catch (NumberFormatException e) {
                    page = 0;
                    e.printStackTrace();
                }
            }
            if (request.getParameter("size") != null && !request.getParameter("size").trim().equals("")) {
                try {
                    size = Integer.parseInt(request.getParameter("size"));
                } catch (NumberFormatException e) {
                    size = 10;
                    e.printStackTrace();
                }
            }
            boolean is_success = true;
            int seats=0;
            int user_id=0;
            int order_id=0;

            switch (action) {
                case "booking":
                    try {
                        seats=Integer.parseInt(request.getParameter("booking_seats"));
                        //todo:user_id改为从session中获取
                        user_id=Integer.parseInt(request.getParameter("user_id"));
                        order_id=Integer.parseInt(request.getParameter("order_id"));
                    } catch (NumberFormatException e) {
                        seats=0;
                        user_id=0;
                        order_id=0;
                        e.printStackTrace();
                    }
                    if(user_id>0){
                        String boarding_point=request.getParameter("boarding_point");
                        String breakout_point=request.getParameter("breakout_point");
                        String description=request.getParameter("description");
                        String start_time=request.getParameter("start_time");//司机出车时间
                        String d_mobile=request.getParameter("mobile");
                        String date=start_time.split(" ")[0].split("-")[0]+"年"+start_time.split(" ")[0].split("-")[1]+"月"+start_time.split(" ")[0].split("-")[2]+"日";
                        PassengerOrder order=new PassengerOrder();
                        order.setUser_id(user_id);
                        order.setDriver_order_id(order_id);
                        order.setSeats(seats);
                        order.setBoarding_point(boarding_point);
                        order.setBreakout_ponit(breakout_point);
                        order.setDescription(description);

                        is_success=laiHuiDB.createPassengerOrder(order);
                        if(is_success){
                            //通知司机
                            String where=" where _id="+user_id;
                            String p_mobile=laiHuiDB.getWxUser(where).get(0).getUser_mobile();
                            //发送通知短信
                            Utils.sendNotifyMessage(d_mobile,p_mobile,date);
                            json = ReturnJsonUtil.returnSuccessJsonString(result, "订单创建成功！");
                            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                        }
                    }
                    json = ReturnJsonUtil.returnFailJsonString(result, "参数有误！");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "show":
                    try {
                        user_id=Integer.parseInt("user_id");
                    } catch (NumberFormatException e) {
                        user_id=0;
                        e.printStackTrace();
                    }
                    if(user_id>0){
                        //返回该用户预定的发车单列表
                        int now_order_id=0;
                        try {
                            now_order_id=Integer.parseInt(request.getParameter("order_id"));
                        } catch (NumberFormatException e) {
                            now_order_id=0;
                            e.printStackTrace();
                        }
                        json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getOrderInfo(laiHuiDB, user_id,page,size,now_order_id), "出发市信息获取成功");
                        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                    }
                    json = ReturnJsonUtil.returnFailJsonString(result, "订单信息获取失败！");
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

}
