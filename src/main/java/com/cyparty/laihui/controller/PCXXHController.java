package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.*;
import com.cyparty.laihui.utilities.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhu on 2016/5/11.
 */
@Controller
public class PCXXHController {
    @Autowired
    LaiHuiDB laiHuiDB;
    @Autowired
    OssUtil ossUtil;

    @ResponseBody
    @RequestMapping(value = "/db/pch/route", method = RequestMethod.POST)
    public ResponseEntity<String> route(HttpServletRequest request) {
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
            int id = 0;
            boolean is_success = true;
            String departure_city = request.getParameter("departure");
            String destination_city = request.getParameter("destination_city");

            String mobile = request.getParameter("mobile");
            String start_time = request.getParameter("start_time");
            String end_time = request.getParameter("end_time");
            String where="";
            switch (action) {
                case "show":
                    json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getPCHRoute(laiHuiDB, page, size), "线路信息获取成功");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "departure":
                    json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getPCHRoutePlace(laiHuiDB, departure_city), "出发市信息获取成功");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "show_all":
                    json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getPCHAllRoutePlace(laiHuiDB), "出发市信息获取成功");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "destination":
                    json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getPCHRoutePlace(laiHuiDB, departure_city), "目的地市获取成功");
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

    @ResponseBody
    @RequestMapping(value = "/api/db/departure", method = RequestMethod.POST)
    public ResponseEntity<String> departure(HttpServletRequest request) {
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Content-Type", "application/json;charset=UTF-8");
        JSONObject result = new JSONObject();
        String json = "";
        try {
            String mobile = request.getParameter("mobile");
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
            int id = 0;
            String where = "";
            boolean is_success = true;
            String departure_city = request.getParameter("departure_city");
            String destination_city = request.getParameter("destination_city");

            String start_time = request.getParameter("start_time");
            String end_time = request.getParameter("end_time");
            String keyword=request.getParameter("keyword");
            String status=request.getParameter("status");
            if(request.getParameter("id")!=null){
                id=Integer.parseInt(request.getParameter("id"));
            }
            int user_id=86;

            //todo:user_id改为从session中获取
            if (request.getSession().getAttribute("user_id") != null) {
                try {
                    user_id = (Integer) request.getSession().getAttribute("user_id");
                } catch (Exception e) {
                    id = 0;
                    e.printStackTrace();
                }
            }
            switch (action) {
                case "add":
                    if(user_id>0){
                        DepartureInfo departure = new DepartureInfo();
                        int init_seats = Integer.parseInt(request.getParameter("init_seats"));
                        String points=request.getParameter("points");
                        String description=request.getParameter("description");

                        String departure_county=request.getParameter("departure_county");
                        String destination=request.getParameter("destination");
                        String tag_yes_content=request.getParameter("tag_yes_content");
                        String tag_no_content=request.getParameter("tag_no_content");
                        String driving_name=request.getParameter("driving_name");
                        String car_brand=request.getParameter("car_brand");

                        String date=start_time.split(" ")[0].split("-")[0]+"年"+start_time.split(" ")[0].split("-")[1]+"月"+start_time.split(" ")[0].split("-")[2]+"日";
                        departure.setUser_id(user_id);
                        departure.setMobile(mobile);
                        departure.setStart_time(start_time);
                        departure.setEnd_time(end_time);
                        departure.setDeparture_city(departure_city);
                        departure.setDestination_city(destination_city);
                        departure.setInit_seats(init_seats);
                        departure.setPoints(points);
                        departure.setDescription(description);
                        departure.setDeparture_county(departure_county);
                        departure.setDestination(destination);
                        departure.setTag_yes_content(tag_yes_content);
                        departure.setTag_no_content(tag_no_content);
                        departure.setDriving_name(driving_name);
                        departure.setCar_brand(car_brand);
                        departure.setDate(date);
                        //创建出车信息
                        if(id>0){
                            //更新
                            where=" set start_time='"+start_time+"', end_time='"+end_time+"',departure_city='"+departure_city+"',destination_city='"+destination_city+"',init_seats="+init_seats+",mobile='"+mobile+"',points='"+points+"',description='"+description+"',car_brand='"+car_brand+"',departure='"+departure_county+"',destination='"+destination+"',driving_name='"+driving_name+"',tag_yes_content='"+tag_yes_content+"',tag_no_content='"+tag_no_content+"' where _id="+id;
                            is_success=laiHuiDB.update("pch_publish_info",where);
                            String delete_where=" where route_id="+id;
                            laiHuiDB.delete("pc_route_points",delete_where);
                            //添加出发地，目的地坐标
                            String route_json = request.getParameter("route_json");
                            JSONObject data_json = JSONObject.parseObject(route_json);
                            JSONArray data_array = data_json.getJSONArray("result");
                            List<RoutePoint> routePointList = new ArrayList<>();
                            for (int i = 0; i < data_array.size(); i++) {
                                JSONObject jsonObject = data_array.getJSONObject(i);
                                RoutePoint point = new RoutePoint();
                                point.setPoint_seq(i + 1);
                                point.setRoute_id(id);
                                point.setPoint_name(jsonObject.getString("name"));
                                point.setPoint_lat(jsonObject.getJSONObject("location").getString("lat"));
                                point.setPoint_lng(jsonObject.getJSONObject("location").getString("lng"));
                                point.setPoint_uid(jsonObject.getString("uid"));
                                point.setPoint_city(jsonObject.getString("city"));
                                point.setPoint_district(jsonObject.getString("district"));

                                routePointList.add(point);
                            }
                            is_success = laiHuiDB.createRoutePoint(routePointList);
                            if(is_success){
                                json = ReturnJsonUtil.returnSuccessJsonString(result, "修改成功！");
                                return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                            }else {
                                json = ReturnJsonUtil.returnFailJsonString(result, "修改失败！");
                                return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                            }
                        }else {
                            //添加
                            id=laiHuiDB.createPCHDeparture(departure);
                            departure.setR_id(id);
                            //更新用户角色
                            String update_sql=" set is_driver=1 where user_id="+user_id ;
                            laiHuiDB.update("pc_wx_user",update_sql);
                            //添加出发地，目的地坐标
                            String route_json = request.getParameter("route_json");
                            JSONObject data_json = JSONObject.parseObject(route_json);
                            JSONArray data_array = data_json.getJSONArray("result");
                            List<RoutePoint> routePointList = new ArrayList<>();
                            for (int i = 0; i < data_array.size(); i++) {
                                JSONObject jsonObject = data_array.getJSONObject(i);
                                RoutePoint point = new RoutePoint();
                                point.setPoint_seq(i + 1);
                                point.setRoute_id(id);
                                point.setPoint_name(jsonObject.getString("name"));
                                point.setPoint_lat(jsonObject.getJSONObject("location").getString("lat"));
                                point.setPoint_lng(jsonObject.getJSONObject("location").getString("lng"));
                                point.setPoint_uid(jsonObject.getString("uid"));
                                point.setPoint_city(jsonObject.getString("city"));
                                point.setPoint_district(jsonObject.getString("district"));

                                routePointList.add(point);
                            }
                            is_success = laiHuiDB.createRoutePoint(routePointList);
                            //保存用户操作记录
                            UserRoleAction userRoleAction=new UserRoleAction();
                            userRoleAction.setDriver_order_id(id);
                            userRoleAction.setOrder_type(1);
                            userRoleAction.setOrder_source(0);
                            userRoleAction.setUser_mobile(mobile);

                            laiHuiDB.createUserAction(userRoleAction);
                            //发送通知
                            WXUtils.pinCheNotify(request,departure,1);
                            //发送短信通知司机
                            Utils.sendPublishNotifyMessage(departure.getMobile());
                            result.put("id",id);
                            json = ReturnJsonUtil.returnSuccessJsonString(result, "创建成功！");
                            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                        }
                    }else {
                        result.put("error_code", ErrorCodeMessage.getLoginError_code());
                        json = ReturnJsonUtil.returnFailJsonString(result, "请登陆！");
                        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                    }
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    where = " set is_enable=0 where _id=" + id;
                    is_success = laiHuiDB.update("pch_publish_info ", where);
                    if (is_success) {
                        json = ReturnJsonUtil.returnSuccessJsonString(result, "删除成功！");
                    } else {
                        json = ReturnJsonUtil.returnFailJsonString(result, "删除失败！");
                    }
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "show":

                   /* String key=page+size+departure_city+destination_city+status+start_time+end_time+keyword+id+"show";
                    result= Memcache.getMemcache(key);
                    if(result.getString("cache_status")!=null){*/
                        //说明之前没有有缓存
                        result=ReturnJsonUtil.getPCHDepartureInfo(laiHuiDB, page, size, departure_city, destination_city, status, start_time, end_time, keyword,id);
                      /*  Memcache.setMemcache(key,result);
                    }*/
                    json = ReturnJsonUtil.returnSuccessJsonString(result, "全部出车信息获取成功");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "show_myself":
                    String key2=page+size+departure_city+destination_city+status+start_time+end_time+keyword+id+"show_myself";
                    result= Memcache.getMemcache(key2);
                    if(result.getString("cache_status")!=null){
                        //说明之前没有有缓存
                        result=ReturnJsonUtil.getPCHDepartureInfo(laiHuiDB, page, size, departure_city, destination_city, status, start_time, end_time, keyword,id);
                        Memcache.setMemcache(key2,result);
                    }
                    json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getMySelfDepartureInfo(laiHuiDB, page, size, departure_city, destination_city, status, start_time, end_time, keyword,id,user_id), "出车信息获取成功");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "update":
                    String info_status= request.getParameter("info_status");
                    String update_sql=" set info_status="+info_status+" where _id="+id;
                    laiHuiDB.update("pch_publish_info",update_sql);
                    json = ReturnJsonUtil.returnSuccessJsonString(result, "更新状态！");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
            }
            //
            json = ReturnJsonUtil.returnFailJsonString(result, "获取参数错误");
            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            e.printStackTrace();
            json = ReturnJsonUtil.returnFailJsonString(result, "获取参数错误");
            return new ResponseEntity<String>(json, responseHeaders, HttpStatus.BAD_REQUEST);
        }
    }
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    @RequestMapping(value = "/place_suggestion", produces = "application/json; charset=utf-8")
    public String getAPPJson(HttpServletRequest request) {
        String key = request.getParameter("key");
        String city = request.getParameter("city");
        String result = "";
        URL file_url = null;

        try {
            key = URLEncoder.encode(key, "utf-8");
            city = URLEncoder.encode(city, "utf-8");
            String json_url = "http://api.map.baidu.com/place/v2/suggestion?query=" + key + "&region=" + city + "&output=json&ak=154d93b0ed8e18c429725a9e8589bd6b";
            file_url = new URL(json_url);
            InputStream content = (InputStream) file_url.getContent();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "utf-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result = result + line;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
    @ResponseBody
    @RequestMapping(value = "/api/db/tag", method = RequestMethod.POST)
    public ResponseEntity<String> tags(HttpServletRequest request) {
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
            int id = 0;
            boolean is_success = true;
            Tag tag=new Tag();
            int type = 0;
            if(request.getParameter("type")!=null){
                type=Integer.parseInt(request.getParameter("type"));
            }
            String content = request.getParameter("content");
            String where ="";
            switch (action) {

                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    where = " set is_enable=0 where _id=" + id;
                    is_success = laiHuiDB.update("pc_departure_tags",where);
                    if (is_success) {
                        json = ReturnJsonUtil.returnSuccessJsonString(result, "删除成功！");
                    } else {
                        json = ReturnJsonUtil.returnFailJsonString(result, "删除失败！");
                    }
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "update":
                    id = Integer.parseInt(request.getParameter("id"));

                    where = " set is_enable=1 ";

                    where = where + ",tag_content='"+content+"' where _id=" + id;
                    is_success = laiHuiDB.update("pc_departure_tags",where);
                    if (is_success) {
                        json = ReturnJsonUtil.returnSuccessJsonString(result, "更新成功！");
                    } else {
                        json = ReturnJsonUtil.returnFailJsonString(result, "更新失败！");
                    }
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "show":
                    json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getTags(laiHuiDB,type), "标签信息获取成功");
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
