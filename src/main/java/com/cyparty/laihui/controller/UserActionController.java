package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.*;
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
import java.util.List;

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
        if(is_logined){

            return "driver_order_list";
        }
        return "redirect:/";
    }
    @RequestMapping("/laihui/driver/create_order")
    public String create_order(Model model, HttpServletRequest request) {
        is_logined= Utils.isLogined(request);

        is_has_openid=Utils.isHasMapOpenid(request);

        is_has_openid=true;
        is_logined=true;
        if(is_logined){
            if(is_has_openid){
                return "driver_create_order";
            }
            return "redirect:/wx/map/login";
        }
        return "redirect:/";
    }
//update
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
    } @RequestMapping("/laihui/passenger/my_booking_list")
      public String passenger_booking_list( HttpServletRequest request) {
        is_logined= Utils.isLogined(request);
//        is_logined=true;
        if(is_logined){
            return "passenger_my_booking_list";
        }
        return "redirect:/";
    }
    @RequestMapping("/laihui/my_passenger/booking_list")
    public String my_passenger_booking_list( HttpServletRequest request) {
        String open=request.getParameter("open");
        if(open!=null&&!open.trim().equals("")){
            String where =" where user_map_openid='"+open+"'";
            if(laiHuiDB.getWxUser(where).size()>0){
                User now_user=laiHuiDB.getWxUser(where).get(0);
                request.getSession().setAttribute("user",now_user);
                request.getSession().setAttribute("user_id", now_user.getUser_id());
            }
        }
        is_logined= Utils.isLogined(request);
        if(is_logined){
            return "my_passenger_booking_list";
        }
        return "redirect:/";
    }

    @RequestMapping("/share_more")
    public String share_more(Model model, HttpServletRequest request) {
        //is_logined= Utils.isLogined(request);
        is_logined=true;
        if(is_logined){
            return "share_more";
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
                            int id=laiHuiDB.getMaxID("_id", "pch_passenger_publish_info");

                            UserRoleAction userRoleAction=new UserRoleAction();
                            userRoleAction.setPassenger_order_id(id);
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
                    String keyword=request.getParameter("keyword");
                    result=ReturnJsonUtil.getPassengerPublishInfo(laiHuiDB, 0, page, size, order_id, now_date, departure_city, destination_city,keyword);
                    json = ReturnJsonUtil.returnSuccessJsonString(result, "出发市信息获取成功");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "show_mine":
                    try {
                        if(request.getParameter("order_id")!=null){
                            order_id=Integer.parseInt(request.getParameter("order_id"));
                        }

                    } catch (NumberFormatException e) {
                        order_id=0;
                        e.printStackTrace();
                    }
                    json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getMinePassengerPublishInfo(laiHuiDB, user_id, page, size, order_id, null, null, null), "出行信息获取成功");
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
                        if(request.getParameter("booking_seats")!=null){

                            seats=Integer.parseInt(request.getParameter("booking_seats"));
                        }
                        //todo:user_id改为从session中获取
                        order_id=Integer.parseInt(request.getParameter("order_id"));
                    } catch (NumberFormatException e) {
                        seats=0;
                        e.printStackTrace();
                    }
                    if(user_id>0){
                        int driver_id=0;
                        if(request.getParameter("driver_id")!=null){
                            driver_id=Integer.parseInt(request.getParameter("driver_id"));
                        }
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
                        String driver_order_where =" where _id="+order_id;
                        List<DepartureInfo> departureInfoList=laiHuiDB.getPCHDepartureInfo(driver_order_where);
                        if(departureInfoList.size()>0){
                            String now_where=" where user_id="+user_id;
                            String p_mobile=laiHuiDB.getWxUser(now_where).get(0).getUser_mobile();

                            DepartureInfo departureInfo=departureInfoList.get(0);
                            String driver_departure_city=departureInfo.getDeparture_city();
                            String driver_destination_city=departureInfo.getDestination_city();
                            order.setDeparture_city(driver_departure_city);
                            order.setDestination_city(driver_destination_city);
                            order.setDeparture_time(start_time);
                            order.setMobile(p_mobile);


                            String departure_time=departureInfo.getStart_time().split(" ")[0];
                            String order_where =" where mobile like '%"+p_mobile+"%' and departure_city='"+driver_departure_city+"' and destination_city='"+driver_destination_city+"' and departure_time >= '"+departure_time+" 00:00:00' and departure_time <='"+departure_time+" 24:00:00'";

                            //String where_now=" where user_id="+user_id+" and order_id="+order_id+" and order_source=0";
                            List<PassengerOrder> passengerOrderList=laiHuiDB.getPassengerOrder(order_where);
                            if(departureInfo.getCurrent_seats()<seats){
                                result.put("errcode",300);
                                json = ReturnJsonUtil.returnFailJsonString(result, "座位已满！");
                                return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                            }
                            //控制订多少单
                            if(passengerOrderList.size()>1){
                                result.put("errcode",401);
                                //您已预定过该行程单或类似行程单，请不要重复操作！
                                json = ReturnJsonUtil.returnFailJsonString(result, "最多可同时预订两次车程，请在个人中心取消订单后再次预定！");
                                return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                            }
                            if(boarding_point!=null&&breakout_point!=null){
                                is_success=laiHuiDB.createPassengerOrder(order);
                                //更新车单座位个数
                                boolean is_stop=false;
                                while (!is_stop){
                                    String update_sql=" set current_seats=current_seats-"+seats+" where _id="+departureInfo.getR_id();
                                    is_stop=laiHuiDB.update("pch_publish_info",update_sql);
                                }
                            }else {
                                is_success=false;
                            }
                            if(is_success){
                                //通知司机
                                /*String now_where=" where user_id="+user_id;
                                String p_mobile=laiHuiDB.getWxUser(now_where).get(0).getUser_mobile();*/

                                //保存用户操作
                                int id=laiHuiDB.getMaxID("_id","pc_wx_passenger_orders");
                                UserRoleAction userRoleAction = new UserRoleAction();
                                userRoleAction.setBooking_order_id(id);
                                userRoleAction.setOrder_type(3);
                                userRoleAction.setOrder_source(0);
                                userRoleAction.setUser_mobile(p_mobile);

                                laiHuiDB.createUserAction(userRoleAction);
                                //微信模版通知
                                String driver_where=" where user_id ="+driver_id;
                                User user=new User();
                                if(laiHuiDB.getWxUser(driver_where).size()>0){
                                    user=laiHuiDB.getWxUser(driver_where).get(0);
                                }

                                /*DepartureInfo departureInfo=new DepartureInfo();*/
                                departureInfo.setDriving_name(laiHuiDB.getWxUser(now_where).get(0).getUser_nickname());//乘客姓名
                                departureInfo.setInit_seats(seats);
                                departureInfo.setMobile(p_mobile);
                                departureInfo.setPoints(boarding_point);
                                departureInfo.setOpenid(user.getOpenid());
                                departureInfo.setR_id(order_id);

                                WXUtils.pinCheNotify(request,departureInfo,2);
                                //发送通知短信

                                Utils.sendNotifyMessage(d_mobile,p_mobile);
                                json = ReturnJsonUtil.returnSuccessJsonString(result, "订单创建成功！");
                                return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                            }
                            json = ReturnJsonUtil.returnSuccessJsonString(result, "可以预定该订单！");
                            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                        }
                        json = ReturnJsonUtil.returnFailJsonString(result, "司机车单不存在！");
                        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                    }
                    result.put("errcode",403);
                    json = ReturnJsonUtil.returnFailJsonString(result, "请登陆！");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "show_myself":
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
                case "delete_my_order":
                    if(user_id>0){

                        order_id=Integer.parseInt(request.getParameter("order_id"));
                        String user_where=" where user_id="+user_id;
                        String p_mobile=laiHuiDB.getWxUser(user_where).get(0).getUser_mobile();
                        String driver_mobile=request.getParameter("mobile");
                        String status=request.getParameter("status");
                        String order_where=" where _id="+order_id;
                        PassengerOrder passengerOrder=new PassengerOrder();
                        if(laiHuiDB.getPassengerOrder(order_where).size()>0){
                            passengerOrder=laiHuiDB.getPassengerOrder(order_where).get(0);
                            if(status!=null&&status.equals("-1")){
                                //短信通知车主
                                laiHuiDB.deleteUserAction(order_id,p_mobile,1);
                                is_success=false;
                                while (!is_success){
                                    String update_sql=" set current_seats=current_seats+"+passengerOrder.getSeats()+" where _id="+passengerOrder.getDriver_order_id();
                                    is_success=laiHuiDB.update("pch_publish_info",update_sql);
                                }
                                if(p_mobile!=null&&!p_mobile.trim().equals("")&&p_mobile.length()==11){
                                    Utils.sendCancleNotifyMessage(driver_mobile, p_mobile);
                                }
                            }
                        }
                        String update_sql=" set current_seats=init_seats where current_seats>init_seats ";
                        laiHuiDB.update("pch_publish_info",update_sql);
                        json = ReturnJsonUtil.returnSuccessJsonString(result, "删除成功！");
                        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                    }
                    json = ReturnJsonUtil.returnFailJsonString(result, "请先登陆！");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "show_my_passenger_orders":
                    if(user_id>0){


                        String user_where=" where user_id="+user_id;
                        String p_mobile=laiHuiDB.getWxUser(user_where).get(0).getUser_mobile();

                        json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getMyPassengerOrders(laiHuiDB,page,size,p_mobile), "订单数据获取成功！");
                        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                    }
                    json = ReturnJsonUtil.returnFailJsonString(result, "请先登陆！");
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
