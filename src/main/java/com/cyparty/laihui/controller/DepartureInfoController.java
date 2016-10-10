package com.cyparty.laihui.controller;

import com.cyparty.laihui.db.LaiHuiDB;
import com.cyparty.laihui.domain.User;
import com.cyparty.laihui.utilities.WXUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhu on 2016/5/11.
 */
@Controller
public class DepartureInfoController {
    @Autowired
    LaiHuiDB laiHuiDB;
    @RequestMapping("/laihui/car/list")
    public String car_departure(Model model, HttpServletRequest request) {
       /* //微信分享模块
        String title = "来回拼车，你值得拥有！";
        WXUtils.wx_intro(request, model, title, "eat.gif");*/
        /*try {
            WXUtils.pinCheNotify(request);
        } catch (IOException e) {
            e.printStackTrace();
        }*/
        return "car_driver_departure_list";
    }

    @RequestMapping("/laihui/car/detail")
    public String car_departure_info(Model model, HttpServletRequest request,HttpServletResponse response) {
        //微信分享模块
        String token = request.getParameter("token");
        String open = request.getParameter("open");
       /* String title = "来回拼车，你值得拥有！";
        WXUtils.wx_intro(request, model, title, "eat.gif");*/
        if(open!=null&&!open.trim().equals("")){
            String where =" where user_map_openid='"+open+"'";
            if(laiHuiDB.getWxUser(where).size()>0){
                User now_user=laiHuiDB.getWxUser(where).get(0);
                request.getSession().setAttribute("user",now_user);
                request.getSession().setAttribute("user_id", now_user.getUser_id());
            }
        }
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
