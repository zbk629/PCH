package com.cyparty.laihui.controller;

import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.utilities.OssUtil;
import com.cyparty.laihui.utilities.ReturnJsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

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
            String departure = request.getParameter("departure");
            switch (action) {
                case "show":
                    json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getPCHRoute(laiHuiDB, page, size), "线路信息获取成功");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "departure":
                    json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getPCHRoutePlace(laiHuiDB, departure), "出发市信息获取成功");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "destination":
                    json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getPCHRoutePlace(laiHuiDB, departure), "目的地市获取成功");
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
            switch (action) {

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
                    json = ReturnJsonUtil.returnSuccessJsonString(ReturnJsonUtil.getPCHDepartureInfo(laiHuiDB, page, size, departure_city, destination_city, status, start_time, end_time, keyword,id), "出车信息获取成功");
                    return new ResponseEntity<String>(json, responseHeaders, HttpStatus.OK);
                case "update":
                    String info_status= request.getParameter("info_status");
                    String update_sql=" set info_status="+info_status+" where _id="+id;
                    laiHuiDB.update("pch_publish_info",update_sql);
                    json = ReturnJsonUtil.returnSuccessJsonString(result, "更新状态！");
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
