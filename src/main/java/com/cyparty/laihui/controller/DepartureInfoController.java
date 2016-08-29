package com.cyparty.laihui.controller;

import com.cyparty.laihui.utilities.WXUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zhu on 2016/5/11.
 */
@Controller
public class DepartureInfoController {
    @RequestMapping("/laihui/car/list")
    public String car_departure(Model model, HttpServletRequest request) {
        //微信分享模块
        String title = "来回拼车，你值得拥有！";
        WXUtils.wx_intro(request, model, title, "eat.gif");
        return "car_driver_departure_list";
    }

    @RequestMapping("/laihui/car/detail")
    public String car_departure_info(Model model, HttpServletRequest request,HttpServletResponse response) {
        //微信分享模块
        String token = request.getParameter("token");
        String title = "来回拼车，你值得拥有！";
        WXUtils.wx_intro(request, model, title, "eat.gif");
        if (token != null && !token.trim().equals("")) {
            String id = token.substring(21);
            //model.addAttribute("role", "1");
            request.getSession().setAttribute("role", "1");
            request.getSession().setAttribute("own_id", id);
            model.asMap().clear();
            return "redirect:/laihui/car/detail?id="+id;
        } else {
            String now_id = request.getParameter("id");
            //|| request.getSession().getAttribute("role").equals("0")
            if (request.getSession().getAttribute("role") == null ) {
                request.getSession().setAttribute("role", "0");
            } else {
                if(request.getSession().getAttribute("own_id")!=null){
                    if (!request.getSession().getAttribute("own_id").equals(now_id)) {
                        request.getSession().setAttribute("role", "0");
                    } else {
                        request.getSession().setAttribute("role", "1");
                    }
                }
            }
            //model.addAttribute("role","0");
            return "car_driver_departure_info";
        }
    }

    @RequestMapping("/")
    public String index(Model model, HttpServletRequest request) {
        model.asMap().clear();
        return "redirect:/laihui/car/list";
    }

}
