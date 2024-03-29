package com.cyparty.laihui.utilities;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Shadow on 2016/5/3.
 */
public class ReturnJsonUtil {
    /**
     * 返回成功信息
     *
     * @param result        需要返回的值
     * @param error_message 提示信息
     * @return
     */
    public static String returnFailJsonString(JSONObject result, String error_message) {
        JSONObject item = new JSONObject();
        item.put("message", error_message);
        item.put("status", false);
        item.put("result", result);
        String jsonString = JSON.toJSONString(item);
        return jsonString;
    }

    /**
     * 返回失败信息
     *
     * @param result  需要返回的值
     * @param message 提示信息
     * @return
     */
    public static String returnSuccessJsonString(JSONObject result, String message) {
        JSONObject item = new JSONObject();
        item.put("message", message);
        item.put("status", true);
        item.put("result", result);
        String jsonString = item.toJSONString();
        return jsonString;
    }

    /**
     * 获取ContentTypeList
     *
     * @param laiHuiDB 数据库连接
     * @return
     */

    public static JSONObject getPCHRoutePlace(LaiHuiDB laiHuiDB, String departure) {
        JSONObject result_json = new JSONObject();
        JSONArray dataArray = new JSONArray();
        String where = "";
        if (departure == null || departure.trim().equals("")) {
            where = "  where is_enable=1 group by departure_city order by _id";
            List<RouteInfo> routeInfoList = laiHuiDB.getPCHRoute(where);
            for (RouteInfo routeInfo : routeInfoList) {
                JSONObject jsonObject = new JSONObject();

                jsonObject.put("departure", routeInfo.getDeparture());

                dataArray.add(jsonObject);
            }
            result_json.put("data", dataArray);
        } else {
            where = " where departure_city='" + departure + "' and is_enable=1";
            List<RouteInfo> routeInfoList = laiHuiDB.getPCHRoute(where);
            for (RouteInfo routeInfo : routeInfoList) {
                JSONObject jsonObject = new JSONObject();

                jsonObject.put("destination", routeInfo.getDestination());
                dataArray.add(jsonObject);
            }
            result_json.put("data", dataArray);
        }
        return result_json;
    }

    public static JSONObject getPCHAllRoutePlace(LaiHuiDB laiHuiDB) {
        JSONObject result_json = new JSONObject();
        JSONArray dataArray = new JSONArray();
        String where = "";
        where = "  where is_enable=1 group by departure_city order by _id";
        int i = 1;
        int j = 1;
        List<RouteInfo> routeInfoList = laiHuiDB.getPCHRoute(where);
        for (RouteInfo routeInfo : routeInfoList) {
            JSONObject jsonObject = new JSONObject();

            jsonObject.put("id", i);
            jsonObject.put("name", routeInfo.getDeparture());
            i++;
            JSONArray dataSigleArray = new JSONArray();
            where = " where departure_city='" + routeInfo.getDeparture() + "' and is_enable=1";
            List<RouteInfo> routeList = laiHuiDB.getPCHRoute(where);
            for (RouteInfo route : routeList) {
                JSONObject now_jsonObject = new JSONObject();
                now_jsonObject.put("id", j);
                now_jsonObject.put("price", route.getCost());
                now_jsonObject.put("name", route.getDestination());

                j++;
                dataSigleArray.add(now_jsonObject);
            }
            jsonObject.put("child", dataSigleArray);
            dataArray.add(jsonObject);
        }
        result_json.put("data", dataArray);

        return result_json;
    }

    public static JSONObject getPCHRoute(LaiHuiDB laiHuiDB, int page, int size) {
        JSONObject result_json = new JSONObject();
        JSONArray dataArray = new JSONArray();
        String where = " where is_enable=1";
        int count = laiHuiDB.getRoute(where).size();
        int offset = page * size;

        where = where + " limit " + offset + "," + size;
        List<RouteInfo> routeInfoList = laiHuiDB.getPCHRoute(where);
        for (RouteInfo routeInfo : routeInfoList) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", routeInfo.getR_id());
            jsonObject.put("departure", routeInfo.getDeparture());
            jsonObject.put("destination", routeInfo.getDestination());
            jsonObject.put("driving_length", routeInfo.getDriving_length());
            jsonObject.put("create_time", routeInfo.getCreate_time());

            String current_time = Utils.getCurrentTime().split(" ")[0] + " 00:00:00";
            where = "  where is_enable=1 and departure_city='" + routeInfo.getDeparture() + "' and destination_city='" + routeInfo.getDestination() + "' ";
            int all_info_count = laiHuiDB.getCount("pch_publish_info", where);
            int all_driver_count = 0;
            if (all_info_count > 0) {
                where = where + " group by mobile";
                all_driver_count = laiHuiDB.getPCHDepartureInfo(where).size();
            }
            where = " where is_enable=1 and departure_city='" + routeInfo.getDeparture() + "' and destination_city='" + routeInfo.getDestination() + "' and start_time>'" + current_time + "'";
            int today_info_count = laiHuiDB.getCount("pch_publish_info", where);
            int today_driver_count = 0;
            if (today_info_count > 0) {
                where = where + " group by mobile";
                today_driver_count = laiHuiDB.getPCHDepartureInfo(where).size();
            }
            jsonObject.put("all_driver_count", all_driver_count);
            jsonObject.put("today_driver_count", today_driver_count);
            jsonObject.put("all_info_count", all_info_count);
            jsonObject.put("today_info_count", today_info_count);
            dataArray.add(jsonObject);
        }
        result_json.put("data", dataArray);
        result_json.put("total", count);
        result_json.put("page", page);
        result_json.put("size", size);
        return result_json;
    }

    public static JSONObject getPCHDepartureInfo(LaiHuiDB laiHuiDB, int page, int size, String departure_city, String destination_city, String status, String start_time, String end_time, String keyword, int id) {
        JSONObject result_json = new JSONObject();
        JSONArray dataArray = new JSONArray();
        String where = " where is_enable=1 and info_status!=-1";
        if (id == 0) {
            if (departure_city != null && !departure_city.trim().equals("")) {
                where = where + " and departure_city='" + departure_city + "'";
            }
            if (destination_city != null && !destination_city.trim().equals("")) {
                where = where + " and destination_city='" + destination_city + "'";
            }
            if (status != null) {
                if (status.equals("0")) {
                    where = where + " and info_status=0 ";
                }
                if (status.equals("1")) {
                    where = where + " and info_status=1 ";
                }
                if (status.equals("-1")) {
                    where = where + " and info_status=-1 ";
                }
            }
            if (start_time != null && !start_time.trim().equals("")) {
                where = where + " and start_time >'" + start_time + " 00:00:00' and start_time < '" + start_time + " 24:00:00'";
            } else {
                where = where + " and end_time >'" + Utils.getCurrentTime() + "'";
            }
                /*if(end_time!=null&&!end_time.trim().equals("")){
                    where=where+" and end_time <'"+end_time+"'";
                }else {
                    where=where+" and end_time >'"+Utils.getCurrentTime()+"'";
                }*/
            if (keyword != null && !keyword.trim().equals("")) {
                where = where + " and (departure like '%" + keyword + "%' or destination like '%" + keyword + "%') ";
            }
            where = where + " order by start_time ASC";

        } else {
            where = "where is_enable=1 and _id=" + id;
        }

        int count = laiHuiDB.getPCHDepartureInfo(where).size();
        int offset = page * size;
        where = where + " limit " + offset + "," + size;

        List<DepartureInfo> departureInfoList = laiHuiDB.getPCHDepartureInfo(where);
        for (DepartureInfo departure : departureInfoList) {
            JSONObject jsonObject = new JSONObject();
            boolean is_editor = false;
            jsonObject.put("id", departure.getR_id());
            jsonObject.put("driver_id", departure.getUser_id());
            jsonObject.put("start_time", departure.getStart_time());
            jsonObject.put("end_time", departure.getEnd_time());
            long current = Utils.getCurrenTimeStamp();
            long end_date = Utils.date2TimeStamp(departure.getEnd_time());
            if (end_date > current) {
                is_editor = true;
            }
            jsonObject.put("is_editor", is_editor);
            jsonObject.put("departure_city", departure.getDeparture_city());
            jsonObject.put("destination_city", departure.getDestination_city());
            jsonObject.put("inits_seats", departure.getCurrent_seats());
            jsonObject.put("mobile", departure.getMobile());
            jsonObject.put("points", departure.getPoints());
            jsonObject.put("description", departure.getDescription());
            jsonObject.put("car_brand", departure.getCar_brand());
            jsonObject.put("departure", departure.getDeparture_county());
            jsonObject.put("destination", departure.getDestination());
            jsonObject.put("driving_name", departure.getDriving_name());
            jsonObject.put("tag_yes_content", departure.getTag_yes_content());
            jsonObject.put("tag_no_content", departure.getTag_no_content());
            jsonObject.put("info_status", departure.getStatus());//-1,1,2
            jsonObject.put("create_time", departure.getCreate_time());
            jsonObject.put("price", departure.getPrice());
            jsonObject.put("origin_price", departure.getOrigin_price());

            where=" where route_id="+departure.getR_id();
            List<RoutePoint> points=laiHuiDB.getRoutePoint(where);
            if(points.size()>0){
                if(points.size()>=2){

                    jsonObject.put("boarding_point", points.get(0).getPoint_name());
                    jsonObject.put("breakout_point", points.get(1).getPoint_name());
                }else {
                    jsonObject.put("boarding_point", points.get(0).getPoint_name());
                    jsonObject.put("breakout_point", "");
                }
            }else {
                jsonObject.put("boarding_point", "");
                jsonObject.put("breakout_point", "");
            }
            dataArray.add(jsonObject);
        }
        result_json.put("data", dataArray);
        result_json.put("total", count);
        result_json.put("page", page);
        result_json.put("size", size);

        return result_json;
    }
    //得到车单详情
    public static JSONObject getDepartureInfo(LaiHuiDB laiHuiDB ,int id) {
        JSONObject result_json = new JSONObject();
        JSONArray dataArray = new JSONArray();

        String where=" where  a._id=" + id+" and a.is_enable=1 ";
        List<PassengerOrder> passengerOrderList = laiHuiDB.getPassengerDepartureInfo(where);
        for (PassengerOrder departure : passengerOrderList) {
            JSONObject passengerObject = new JSONObject();
            JSONObject dataObject = new JSONObject();

            passengerObject.put("mobile", departure.getMobile());
            passengerObject.put("name", departure.getName());
            passengerObject.put("avatar", departure.getAvatar());

            String order_where=" where order_type=0 and order_id="+departure.get_id();
            List<Order> orderList=laiHuiDB.getOrderReview(order_where,0);
            Order order=new Order();
            if (orderList.size()>0){
                order=orderList.get(0);
                dataObject.put("id", orderList.get(0).getOrder_id());
            }
            dataObject.put("order_status", order.getOrder_status());
            dataObject.put("departure_time", departure.getDeparture_time());
            dataObject.put("seats", departure.getSeats());
            dataObject.put("price", new BigDecimal (departure.getPrice()).setScale(2,BigDecimal.ROUND_HALF_UP).toString());
            dataObject.put("create_time", departure.getCreate_time());
            dataObject.put("boarding_point",JSONObject.parseObject(departure.getBoarding_point()));
            dataObject.put("breakout_point",JSONObject.parseObject(departure.getBreakout_ponit()));

            dataObject.put("user_data",passengerObject);

            dataArray.add(dataObject);
        }
        result_json.put("data", dataArray);

        return result_json;
    }
    public static JSONObject getMySelfDepartureInfo(LaiHuiDB laiHuiDB, int page, int size, String departure_city, String destination_city, String status, String start_time, String end_time, String keyword, int id, int user_id) {
        JSONObject result_json = new JSONObject();
        JSONArray dataArray = new JSONArray();
        String where = " where is_enable=1 and info_status!=-1";
        if (id == 0) {
            if (user_id != 0) {
                String now_where = " where user_id=" + user_id;
                String user_mobile=laiHuiDB.getWxUser(now_where).get(0).getUser_mobile();
                where = " where is_enable=1 and mobile like '%"+user_mobile+"%'";

                if (departure_city != null && !departure_city.trim().equals("")) {
                    where = where + " and departure_city='" + departure_city + "'";
                }
                if (destination_city != null && !destination_city.trim().equals("")) {
                    where = where + " and destination_city='" + destination_city + "'";
                }
                if (status != null) {
                    if (status.equals("0")) {
                        where = where + " and info_status=0 ";
                    }
                    if (status.equals("1")) {
                        where = where + " and info_status=1 ";
                    }
                    if (status.equals("-1")) {
                        where = where + " and info_status=-1 ";
                    }
                }
                if (start_time != null && !start_time.trim().equals("")) {
                    where = where + " and start_time >'" + start_time + "'";
                }
                if (end_time != null && !end_time.trim().equals("")) {
                    where = where + " and end_time <'" + end_time + "'";
                }
                if (keyword != null && !keyword.trim().equals("")) {
                    where = where + " and (mobile like '%" + keyword + "%' or driving_name like '%" + keyword + "%') ";
                }
                where = where + " order by start_time DESC";
            } else {
                if (departure_city != null && !departure_city.trim().equals("")) {
                    where = where + " and departure_city='" + departure_city + "'";
                }
                if (destination_city != null && !destination_city.trim().equals("")) {
                    where = where + " and destination_city='" + destination_city + "'";
                }
                if (status != null) {
                    if (status.equals("0")) {
                        where = where + " and info_status=0 ";
                    }
                    if (status.equals("1")) {
                        where = where + " and info_status=1 ";
                    }
                    if (status.equals("-1")) {
                        where = where + " and info_status=-1 ";
                    }
                }
                if (start_time != null && !start_time.trim().equals("")) {
                    where = where + " and start_time >'" + start_time + " 00:00:00' and start_time < '" + start_time + " 24:00:00'";
                } else {
                    where = where + " and end_time >'" + Utils.getCurrentTime() + "'";
                }
                /*if(end_time!=null&&!end_time.trim().equals("")){
                    where=where+" and end_time <'"+end_time+"'";
                }else {
                    where=where+" and end_time >'"+Utils.getCurrentTime()+"'";
                }*/
                if (keyword != null && !keyword.trim().equals("")) {
                    where = where + " and (mobile like '%" + keyword + "%' or driving_name like '%" + keyword + "%') ";
                }
                where = where + " order by start_time ASC";
            }
        } else {
            where = "where is_enable=1 and _id=" + id;
        }

        int count = laiHuiDB.getPCHDepartureInfo(where).size();
        int offset = page * size;
        where = where + " limit " + offset + "," + size;

        List<DepartureInfo> departureInfoList = laiHuiDB.getPCHDepartureInfo(where);
        for (DepartureInfo departure : departureInfoList) {
            JSONObject jsonObject = new JSONObject();
            boolean is_editor = false;
            jsonObject.put("id", departure.getR_id());
            jsonObject.put("start_time", departure.getStart_time());
            jsonObject.put("end_time", departure.getEnd_time());
            long current = Utils.getCurrenTimeStamp();
            long end_date = Utils.date2TimeStamp(departure.getEnd_time());
            if (end_date > current) {
                is_editor = true;
            }
            jsonObject.put("is_editor", is_editor);
            jsonObject.put("departure_city", departure.getDeparture_city());
            jsonObject.put("destination_city", departure.getDestination_city());
            jsonObject.put("inits_seats", departure.getInit_seats());
            jsonObject.put("current_seats", departure.getCurrent_seats());
            jsonObject.put("mobile", departure.getMobile());
            jsonObject.put("points", departure.getPoints());
            jsonObject.put("description", departure.getDescription());
            jsonObject.put("car_brand", departure.getCar_brand());
            jsonObject.put("departure", departure.getDeparture_county());
            jsonObject.put("destination", departure.getDestination());
            jsonObject.put("driving_name", departure.getDriving_name());
            jsonObject.put("tag_yes_content", departure.getTag_yes_content());
            jsonObject.put("tag_no_content", departure.getTag_no_content());
            jsonObject.put("info_status", departure.getStatus());//-1,1,2
            jsonObject.put("create_time", departure.getCreate_time());
            jsonObject.put("price", departure.getPrice());

            where=" where route_id="+departure.getR_id();
            List<RoutePoint> points=laiHuiDB.getRoutePoint(where);
            if(points.size()>0){
                if(points.size()>=2){

                    jsonObject.put("boarding_point", points.get(0).getPoint_name());
                    jsonObject.put("breakout_point", points.get(1).getPoint_name());
                }
            }else {
                jsonObject.put("boarding_point", "");
                jsonObject.put("breakout_point", "");
            }
            dataArray.add(jsonObject);
        }
        result_json.put("data", dataArray);
        result_json.put("total", count);
        result_json.put("page", page);
        result_json.put("size", size);

        return result_json;
    }

    public static JSONObject getUserInfo(LaiHuiDB laiHuiDB, int id) {
        JSONObject jsonObject = new JSONObject();
        String where = " where user_id=" + id;
        List<User> userList = laiHuiDB.getWxUser(where);
        for (int i = 0; i < userList.size(); i++) {
            User user = userList.get(0);
            jsonObject.put("id", user.getUser_id());
            jsonObject.put("mobile", user.getUser_mobile());
            jsonObject.put("create_time", user.getUser_created());
            jsonObject.put("last_logined_time", user.getUser_last_login());
            jsonObject.put("user_name", user.getUser_nickname());
            jsonObject.put("user_avatar", user.getUser_avatar());
            jsonObject.put("user_sex", user.getSex());
        }
        return jsonObject;
    }

    public static JSONObject getOrderInfo(LaiHuiDB laiHuiDB, int user_id, int page, int size, int now_order_id) {
        JSONObject result = new JSONObject();
        JSONArray dataArray = new JSONArray();
        String where = " where user_id=" + user_id;
        String user_mobile=laiHuiDB.getWxUser(where).get(0).getUser_mobile();
        where=" where mobile like '%"+user_mobile+"%'";
        if (now_order_id != 0) {
            where = where + " and _id=" + now_order_id;
        }
        int count=laiHuiDB.getCount("pc_wx_passenger_orders",where);
        int offset = page * size;
        where=where+"  ORDER BY create_time DESC ";
        where = where + " limit " + offset + "," + size;
        List<PassengerOrder> passengerOrderList = laiHuiDB.getPassengerOrder(where);
        for (PassengerOrder passengerOrder : passengerOrderList) {
            JSONObject jsonObject = new JSONObject();
            JSONObject orderObject = new JSONObject();
            int order_id = passengerOrder.getDriver_order_id();
            orderObject.put("order_id", passengerOrder.get_id());
            orderObject.put("booking_seats", passengerOrder.getSeats());
            orderObject.put("boarding_point", passengerOrder.getBoarding_point());
            orderObject.put("breakout_point", passengerOrder.getBreakout_ponit());
            orderObject.put("description", passengerOrder.getDescription());
            orderObject.put("create_time", passengerOrder.getCreate_time());
            jsonObject.put("order",orderObject);
            where = "where is_enable=1 and _id=" + order_id;
            List<DepartureInfo> departureInfoList = laiHuiDB.getPCHDepartureInfo(where);
            if(departureInfoList.size()>0){
                for (DepartureInfo departure : departureInfoList) {

                    jsonObject.put("driver_order_id", departure.getR_id());
                    boolean is_editor=false;
                    jsonObject.put("start_time", departure.getStart_time());
                    jsonObject.put("end_time", departure.getEnd_time());
                    long current = Utils.getCurrenTimeStamp();
                    long end_date = Utils.date2TimeStamp(departure.getEnd_time());
                    if (end_date > current) {
                        is_editor = true;
                    }
                    jsonObject.put("is_editor", is_editor);
                    jsonObject.put("departure_city", departure.getDeparture_city());
                    jsonObject.put("destination_city", departure.getDestination_city());
                    jsonObject.put("init_seats", departure.getInit_seats());
                    jsonObject.put("mobile", departure.getMobile());
                    jsonObject.put("points", departure.getPoints());
                    jsonObject.put("description", departure.getDescription());
                    jsonObject.put("car_brand", departure.getCar_brand());
                    jsonObject.put("departure", departure.getDeparture_county());
                    jsonObject.put("destination", departure.getDestination());
                    jsonObject.put("driving_name", departure.getDriving_name());
                    jsonObject.put("tag_yes_content", departure.getTag_yes_content());
                    jsonObject.put("tag_no_content", departure.getTag_no_content());
                    jsonObject.put("info_status", departure.getStatus());//-1,1,2
                    jsonObject.put("create_time", departure.getCreate_time());

                    where=" where route_id="+departure.getR_id();
                    List<RoutePoint> points=laiHuiDB.getRoutePoint(where);
                    if(points.size()>0){
                        if(points.size()>=2){

                            jsonObject.put("boarding_point", points.get(0).getPoint_name());
                            jsonObject.put("breakout_point", points.get(1).getPoint_name());
                        }
                    }else {
                        jsonObject.put("boarding_point", "");
                        jsonObject.put("breakout_point", "");
                    }

                }
            }else {
                jsonObject.put("driver_order_id", 0);
            }

            dataArray.add(jsonObject);
        }
        result.put("data", dataArray);
        result.put("total", count);
        result.put("page", page);
        result.put("size", size);
        return result;
    }

    public static JSONObject getPassengerPublishInfo(LaiHuiDB laiHuiDB, int user_id, int page, int size, int now_order_id, String date, String departure_city, String destination_city,String keywrod) {
        JSONObject result = new JSONObject();
        JSONArray dataArray = new JSONArray();
        String where = " where user_id > 0";
        /*if (user_id != 0) {
            String now_where = " where user_id=" + user_id;
            String user_mobile=laiHuiDB.getWxUser(now_where).get(0).getUser_mobile();
            where = " where user_mobile like '%" + user_mobile+"%'";
        } else {*/
        if (now_order_id != 0) {
            where = where + " and _id=" + now_order_id;
        }else {

            if (date != null && !date.trim().equals("")) {
                where = where + " and start_time >'" + date + " 00:00:00' and start_time < '" + date + " 24:00:00'";
            } else {
                where = where + " and end_time >'" + Utils.getCurrentTime() + "'";
            }
        }
       /* }*/
        if (departure_city != null && !departure_city.trim().equals("")) {
            where = where + " and departure_city ='" + departure_city + "'";
        }
        if (destination_city != null && !destination_city.trim().equals("")) {
            where = where + " and destination_city ='" + destination_city + "'";
        }
        if(keywrod!=null && !keywrod.trim().equals("")){
            where=where+" and departure like '%"+keywrod+"%' and destination like '%"+keywrod+"%'";
        }

        where = where + " order by end_time ASC";
        int offset = page * size;
        int count = laiHuiDB.getCount("pch_passenger_publish_info", where);
        where = where + " limit " + offset + "," + size;

        List<PassengerOrder> passengerOrderList = laiHuiDB.getPassengerPublishInfo(where);
        for (PassengerOrder passengerOrder : passengerOrderList) {
            JSONObject jsonObject = new JSONObject();
            boolean is_editor = false;
            jsonObject.put("order_id", passengerOrder.get_id());
            jsonObject.put("start_time", passengerOrder.getStart_time());
            jsonObject.put("end_time", passengerOrder.getEnd_time());
            long current = Utils.getCurrenTimeStamp();
            long end_date = Utils.date2TimeStamp(passengerOrder.getEnd_time());
            if (end_date > current) {
                is_editor = true;
            }
            jsonObject.put("is_editor", is_editor);
            jsonObject.put("departure_city", passengerOrder.getDeparture_city());
            jsonObject.put("destination_city", passengerOrder.getDestination_city());
            jsonObject.put("booking_seats", passengerOrder.getSeats());
            jsonObject.put("boarding_point", passengerOrder.getBoarding_point());
            jsonObject.put("breakout_point", passengerOrder.getBreakout_ponit());
            jsonObject.put("mobile", passengerOrder.getMobile());
            jsonObject.put("name", passengerOrder.getName());
            jsonObject.put("description", passengerOrder.getDescription());
            jsonObject.put("create_time", passengerOrder.getCreate_time());

            dataArray.add(jsonObject);
        }
        result.put("count", count);
        result.put("page", page);
        result.put("size", size);
        result.put("data", dataArray);

        return result;
    }
    public static JSONObject getMinePassengerPublishInfo(LaiHuiDB laiHuiDB, int user_id, int page, int size, int now_order_id, String date, String departure_city, String destination_city) {
        JSONObject result = new JSONObject();
        JSONArray dataArray = new JSONArray();
        String where = " where user_id > 0";
        if (user_id != 0) {
            String now_where = " where user_id=" + user_id;
            String user_mobile=laiHuiDB.getWxUser(now_where).get(0).getUser_mobile();
            where = " where user_mobile like '%" + user_mobile+"%'";
        } else {
            if (date != null && !date.trim().equals("")) {
                where = where + " and start_time >'" + date + " 00:00:00' and start_time < '" + date + " 24:00:00'";
            } else {
                where = where + " and end_time >'" + Utils.getCurrentTime() + "'";
            }
        }
        if (departure_city != null && !departure_city.trim().equals("")) {
            where = where + " and departure_city ='" + departure_city + "'";
        }
        if (destination_city != null && !destination_city.trim().equals("")) {
            where = where + " and destination_city ='" + destination_city + "'";
        }
        if (now_order_id != 0) {
            where = where + " and _id=" + now_order_id;
        }
        where = where + " order by end_time ASC";
        int offset = page * size;
        int count = laiHuiDB.getCount("pch_passenger_publish_info", where);
        where = where + " limit " + offset + "," + size;

        List<PassengerOrder> passengerOrderList = laiHuiDB.getPassengerPublishInfo(where);
        for (PassengerOrder passengerOrder : passengerOrderList) {
            JSONObject jsonObject = new JSONObject();
            boolean is_editor = false;
            jsonObject.put("order_id", passengerOrder.get_id());
            jsonObject.put("start_time", passengerOrder.getStart_time());
            jsonObject.put("end_time", passengerOrder.getEnd_time());
            long current = Utils.getCurrenTimeStamp();
            long end_date = Utils.date2TimeStamp(passengerOrder.getEnd_time());
            if (end_date > current) {
                is_editor = true;
            }
            jsonObject.put("is_editor", is_editor);
            jsonObject.put("departure_city", passengerOrder.getDeparture_city());
            jsonObject.put("destination_city", passengerOrder.getDestination_city());
            jsonObject.put("booking_seats", passengerOrder.getSeats());
            jsonObject.put("boarding_point", passengerOrder.getBoarding_point());
            jsonObject.put("breakout_point", passengerOrder.getBreakout_ponit());
            jsonObject.put("mobile", passengerOrder.getMobile());
            jsonObject.put("name", passengerOrder.getName());
            jsonObject.put("description", passengerOrder.getDescription());
            jsonObject.put("create_time", passengerOrder.getCreate_time());

            dataArray.add(jsonObject);
        }
        result.put("count", count);
        result.put("page", page);
        result.put("size", size);
        result.put("data", dataArray);

        return result;
    }
    public static JSONObject getTags(LaiHuiDB laiHuiDB, int type) {
        JSONObject result_json = new JSONObject();
        JSONArray dataArray = new JSONArray();
        String where = " where is_enable=1 and tag_type=" + type;

        List<Tag> tags = laiHuiDB.getTags(where);
        for (Tag tag : tags) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", tag.get_id());
            jsonObject.put("type", tag.getType());
            jsonObject.put("content", tag.getContent());
            dataArray.add(jsonObject);
        }
        result_json.put("data", dataArray);
        return result_json;
    }

    public static JSONObject getMyPassengerOrders(LaiHuiDB laiHuiDB,int page,int size, String mobile ) {
        JSONObject result_json = new JSONObject();
        JSONArray dataArray = new JSONArray();
        String where = " where is_enable=1 and mobile like '%" +mobile+ "%' order by end_time DESC";

        //int count = laiHuiDB.getPCHDepartureInfo(where).size();
        int count =0;
        int offset = page * size;
        where = where + " limit " + offset + "," + size;
        List<DepartureInfo> departureInfoList = laiHuiDB.getPCHDepartureInfo(where);
        for (DepartureInfo departure : departureInfoList) {
            JSONObject jsonObject = new JSONObject();
            boolean is_editor = false;
            jsonObject.put("id", departure.getR_id());
            jsonObject.put("driver_id", departure.getUser_id());
            jsonObject.put("start_time", departure.getStart_time());
            jsonObject.put("end_time", departure.getEnd_time());
            long current = Utils.getCurrenTimeStamp();
            long end_date = Utils.date2TimeStamp(departure.getEnd_time());
            if (end_date > current) {
                is_editor = true;
            }
            jsonObject.put("is_editor", is_editor);
            jsonObject.put("departure_city", departure.getDeparture_city());
            jsonObject.put("destination_city", departure.getDestination_city());
            jsonObject.put("inits_seats", departure.getCurrent_seats());
            jsonObject.put("mobile", departure.getMobile());
            jsonObject.put("points", departure.getPoints());
            jsonObject.put("description", departure.getDescription());
            jsonObject.put("car_brand", departure.getCar_brand());
            jsonObject.put("departure", departure.getDeparture_county());
            jsonObject.put("destination", departure.getDestination());
            jsonObject.put("driving_name", departure.getDriving_name());
            jsonObject.put("tag_yes_content", departure.getTag_yes_content());
            jsonObject.put("tag_no_content", departure.getTag_no_content());
            jsonObject.put("info_status", departure.getStatus());//-1,1,2
            jsonObject.put("create_time", departure.getCreate_time());
            jsonObject.put("price", departure.getPrice());

            where=" where route_id="+departure.getR_id();
            List<RoutePoint> points=laiHuiDB.getRoutePoint(where);
            if(points.size()>0){
                if(points.size()>=2){
                    jsonObject.put("boarding_point", points.get(0).getPoint_name());
                    jsonObject.put("breakout_point", points.get(1).getPoint_name());
                }else {
                    jsonObject.put("boarding_point", points.get(0).getPoint_name());
                    jsonObject.put("breakout_point", "");
                }
            }else {
                jsonObject.put("boarding_point", "");
                jsonObject.put("breakout_point", "");
            }

            String order_where=" where order_id="+departure.getR_id()+" order by create_time DESC";
            List<PassengerOrder> passengerOrderList = laiHuiDB.getPassengerOrder(order_where);
            if(passengerOrderList.size()>0){
                JSONArray orderArray=new JSONArray();
                for (PassengerOrder passengerOrder : passengerOrderList) {
                    JSONObject orderObject = new JSONObject();

                    orderObject.put("order_id", passengerOrder.get_id());
                    orderObject.put("booking_seats", passengerOrder.getSeats());
                    orderObject.put("boarding_point", passengerOrder.getBoarding_point());
                    orderObject.put("breakout_point", passengerOrder.getBreakout_ponit());
                    orderObject.put("description", passengerOrder.getDescription());
                    orderObject.put("mobile", passengerOrder.getMobile());
                    orderObject.put("create_time", passengerOrder.getCreate_time());

                    orderArray.add(orderObject);

                }
                jsonObject.put("orders",orderArray);
                dataArray.add(jsonObject);
                count++;
            }
        }
        result_json.put("data", dataArray);
        result_json.put("total", count);
        result_json.put("page", page);
        result_json.put("size", size);

        return result_json;
    }

    public static JSONObject getAllPayLog(List<PayLog> payLogList) {
        JSONObject result_json = new JSONObject();
        JSONArray dataArray = new JSONArray();
        for(PayLog payLog:payLogList){
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("type",payLog.getAction_type());
            jsonObject.put("id",payLog.get_id());
            jsonObject.put("create_time",payLog.getCreate_time());
            jsonObject.put("departure_time",payLog.getDeparture_time());
            jsonObject.put("mobile",payLog.getUser_mobile());
            jsonObject.put("total",new BigDecimal(payLog.getTotal_cash()).setScale(2,BigDecimal.ROUND_HALF_UP).toString());
            jsonObject.put("cash",new BigDecimal(payLog.getCash()).setScale(2,BigDecimal.ROUND_HALF_UP).toString());

            dataArray.add(jsonObject);
        }

        result_json.put("data", dataArray);

        return result_json;
    }

    public static JSONObject getPayInfo(LaiHuiDB laiHuiDB,String type,String id) {
        JSONObject result_json = new JSONObject();
        String where=" a left join  pc_passenger_publish_info b on a.order_id=b._id where a._id="+id;
        List<PayLog> payLogList;
        if(type.equals("3")){
            where=" where _id="+id;
            payLogList=laiHuiDB.getPayLog(where);
        }else {
            payLogList=laiHuiDB.getPayInfo(where);
        }
        PayLog payLog=new PayLog();
        if(payLogList.size()>0){
            payLog=payLogList.get(0);
        }
        if(type!=null&&!type.isEmpty())
        {
            switch (type){
                case "1":
                    result_json.put("type","1");
                    result_json.put("cash",new BigDecimal(payLog.getCash()*PercentageConfig.getCampaign_percentage()).setScale(2,BigDecimal.ROUND_HALF_UP).toString());
                    result_json.put("create_time",payLog.getCreate_time());
                    result_json.put("trade_no",payLog.getTrade_no());
                    break;
                case "2":
                    result_json.put("type","2");
                    result_json.put("cash",new BigDecimal(payLog.getCash()*PercentageConfig.getPc_percentage()).setScale(2,BigDecimal.ROUND_HALF_UP).toString());
                    result_json.put("create_time",payLog.getCreate_time());
                    result_json.put("trade_no",payLog.getTrade_no());
                    break;
                case "3":
                    result_json.put("type","3");
                    result_json.put("pay_type",payLog.getPay_type());
                    result_json.put("cash",new BigDecimal(-payLog.getCash()).setScale(2,BigDecimal.ROUND_HALF_UP).toString());
                    result_json.put("create_time",payLog.getCreate_time());
                    result_json.put("pay_account",payLog.getPay_account());
                    result_json.put("pay_status",payLog.getOrder_status());
                    break;
                case "4":
                    result_json.put("type","4");
                    result_json.put("cash",new BigDecimal(-payLog.getCash()).setScale(2,BigDecimal.ROUND_HALF_UP).toString());
                    result_json.put("create_time",payLog.getCreate_time());
                    result_json.put("trade_no",payLog.getTrade_no());
                    break;
            }
        }
        return result_json;
    }

    public static JSONObject getCampaign76Json(LaiHuiDB laiHuiDB,String mobile,int id,int type){
        String where=" where _id >0  and buyer_mobile like '%"+mobile+"%'";
        if(type==1){
            where=where+" and pay_status=1";
        }else if(type==0){
            where=where+" and pay_status=0";
        }else if(type==2){
            where=where+" and pay_status=2";
        }
        JSONObject result_json=new JSONObject();
        JSONArray dataArray=new JSONArray();
        int count=1;
        if(id==0){
            count=laiHuiDB.getOrderOf76(where).size();
            where=where+" order by create_time DESC  ";
        }else {
            where=" where _id="+id;
        }
        List<OrderOf76> orderList=laiHuiDB.getOrderOf76(where);
        for(OrderOf76 order:orderList){
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("id",order.getId());

            jsonObject.put("data",order.getData());
            jsonObject.put("total_price",order.getGoods_price());
            jsonObject.put("buyer_location",order.getBuyer_location());
            jsonObject.put("buyer_name",order.getBuyer_name());
            jsonObject.put("buyer_mobile",order.getBuyer_mobile());
            jsonObject.put("buyer_description",order.getBuyer_description());
            jsonObject.put("deliver_name",order.getDeliver_name());
            jsonObject.put("deliver_number",order.getDeliver_number());
            jsonObject.put("create_time",order.getCreate_time());
            dataArray.add(jsonObject);
        }
        result_json.put("total",count);
        result_json.put("orders",dataArray);
        return result_json;
    }
}
