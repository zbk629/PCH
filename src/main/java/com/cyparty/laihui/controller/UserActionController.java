package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.ErrorCodeMessage;
import com.cyparty.laihui.domain.PassengerOrder;
import com.cyparty.laihui.domain.UserRoleAction;
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
    boolean is_has_openid= false;
    @RequestMapping("/laihui/driver/order_list")
    public String car_departure(Model model, HttpServletRequest request) {
        is_logined= Utils.isLogined(request);
        //is_logined=true;
        if(is_logined){

            return "driver_order_list";
        }
        return "redirect:/";
    }
    @RequestMapping("/laihui/driver/create_order")
    public String create_order(Model model, HttpServletRequest request) {
        is_logined= Utils.isLogined(request);
        //is_logined=true;
        //is_has_openid=Utils.isHasMapOpenid(request);
        if(is_logined){
            //if(is_has_openid){
                return "driver_create_order";
            //}
            //return "redirect:/wx/map/login";
        }
        return "redirect:/";
    }

    @RequestMapping("/laihui/passenger/create_order")
    public String passenger_create_list(Model model, HttpServletRequest request) {
        is_logined= Utils.isLogined(request);
//        is_logined=true;
        if(is_logined){
            return "passenger_create_order";
        }
        return "redirect:/";
    }
    @RequestMapping("/laihui/passenger/order_list")
    public String passenger_order_list(Model model, HttpServletRequest request) {
        is_logined= Utils.isLogined(request);
//        is_logined=true;
        if(is_logined){

            return "passenger_order_list";
        }
        return "redirect:/";
    }
    @RequestMapping("/laihui/passenger/order_info")
    public String passenger_order_info(Model model, HttpServletRequest request) {
        //is_logined= Utils.isLogined(request);
        is_logined=true;
        if(is_logined){

            return "passenger_order_info";
        }
        return "redirect:/";
    }
    @RequestMapping("/laihui/passenger/my_order_list")
    public String passenger_order_list(Model model, HttpServletRequest request,HttpServletResponse response) {
        //is_logined= Utils.isLogined(request);
        is_logined=true;
        if(is_logined){
            return "passenger_my_order_list";
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
            int user_id=86;
            int order_id=0;
            //todo:user_id改为从session中获取
            if(request.getSession().getAttribute("user_id")!=null){
                try {
                    user_id=(Integer)request.getSession().getAttribute("user_id");
                } catch (Exception e) {
                    user_id=0;
                    e.printStackTrace();
                }
            }
            switch (action) {
                case "add":
                    try {
                        if(request.getParameter("booking_seats")!=null){

                            seats=Integer.parseInt(request.getParameter("booking_seats"));
                        }

                        if(request.getParameter("order_id")!=null){
                            order_id=Integer.parseInt(request.getParameter("order_id"));
                        }

                    } catch (NumberFormatException e) {
                        seats=0;
                        user_id=0;
                        order_id=0;
                        e.printStackTrace();
                    }
                    if(user_id>0){
                        String departure_city=request.getParameter("departure_city");
                        String destination_city=request.getParameter("destination_city");
                        String boarding_point=request.getParameter("boarding_point");
                        String breakout_point=request.getParameter("breakout_point");
                        String description=request.getParameter("description");
                        String start_time=request.getParameter("start_time");//出发时间
                        String end_time=request.getParameter("end_time");//出发时间
                        String name=request.getParameter("name");//司机出车时间
                        String mobile=request.getParameter("mobile");
                        //String date=start_time.split(" ")[0].split("-")[0]+"年"+start_time.split(" ")[0].split("-")[1]+"月"+start_time.split(" ")[0].split("-")[2]+"日";
                        PassengerOrder order=new PassengerOrder();
                        order.setUser_id(user_id);
                        order.setDeparture_city(departure_city);
                        order.setDestination_city(destination_city);
                        order.setStart_time(start_time);
                        order.setEnd_time(end_time);
                        order.setSeats(seats);
                        order.setBoarding_point(boarding_point);
                        order.setBreakout_ponit(breakout_point);
                        order.setDescription(description);
                        order.setName(name);
                        order.setMobile(mobile);
                        if(order_id>0){
                            String update_sql="  set departure_city='"+departure_city+"',destination_city='"+destination_city+"',boarding_point='"+boarding_point+"',breakout_point='"+breakout_point+"',booking_seats="+seats+",start_time='"+start_time+"',end_time='"+end_time+"',description='"+description+"' where user_id="+user_id;
                            laiHuiDB.update("pch_passenger_publish_info",update_sql);
                        }else {

                            is_success=laiHuiDB.createPassengerPublishInfo(order);
                            //更新状态，成为发过出行信息的乘客
                            String update_sql=" set is_passenger=1 where user_id="+user_id;
                            laiHuiDB.update("pc_wx_user",update_sql);

                            //保存用户操作记录
                            int id=laiHuiDB.getMaxPassengerPublishInfo();

                            UserRoleAction userRoleAction=new UserRoleAction();
                            userRoleAction.setDriver_order_id(id);
                            userRoleAction.setOrder_type(2);
                            userRoleAction.setOrder_source(0);
                            userRoleAction.setUser_mobile(mobile);

                            laiHuiDB.createUserAction(userRoleAction);
                            if(is_success){
                                json = ReturnJsonUtil.returnSuccessJsonString(result, "行程单创建成功！");
                                return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                            }
                        }
                    }
                    result.put("error_code", ErrorCodeMessage.getLoginError_code());
                    json = ReturnJsonUtil.returnFailJsonString(result, "登陆状态有误！");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "show":
                    try {
                        if(request.getParameter("order_id")!=null){
                            order_id=Integer.parseInt(request.getParameter("order_id"));
                        }

                    } catch (NumberFormatException e) {
                        order_id=0;
                        e.printStackTrace();
                    }
                    String now_date=request.getParameter("date");
                    String departure_city=request.getParameter("departure_city");
                    String destination_city=request.getParameter("destination_city");
                    result=ReturnJsonUtil.getPassengerPublishInfo(laiHuiDB, 0, page, size, order_id, now_date, departure_city, destination_city);
                    json = ReturnJsonUtil.returnSuccessJsonString(result, "出发市信息获取成功");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "show_mine":
                    try {
                        if(request.getParameter("order_id")!=null){
                            order_id=Integer.parseInt(request.getParameter("order_id"));
                        }

                    } catch (NumberFormatException e) {
                        user_id=0;
                        order_id=0;
                        e.printStackTrace();
                    }
                    json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getPassengerPublishInfo(laiHuiDB, user_id, page, size, order_id, null, null, null), "出发市信息获取成功");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "delete":
                    order_id=Integer.parseInt(request.getParameter("order_id"));
                    String where =" where _id="+order_id;
                    is_success = laiHuiDB.delete("pch_passenger_publish_info ", where);
                    if(is_success){
                        json = ReturnJsonUtil.returnSuccessJsonString(result, "删除成功！");
                        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                    }
                    json = ReturnJsonUtil.returnFailJsonString(result, "删除失败！");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
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
                            String now_where=" where _id="+user_id;
                            String p_mobile=laiHuiDB.getWxUser(now_where).get(0).getUser_mobile();
                            //发送通知短信
                            Utils.sendNotifyMessage(d_mobile,p_mobile,date);
                            json = ReturnJsonUtil.returnSuccessJsonString(result, "订单创建成功！");
                            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                        }
                    }
                    json = ReturnJsonUtil.returnFailJsonString(result, "参数有误！");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "show_myself":
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
                        json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getOrderInfo(laiHuiDB, user_id, page, size, now_order_id), "出发市信息获取成功");
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
