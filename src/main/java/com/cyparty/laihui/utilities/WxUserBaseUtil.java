package com.cyparty.laihui.utilities;

import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.domain.User;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

/**
 * Created by zhu on 2016/3/30.
 */
public class WxUserBaseUtil {
    public static String sendGet(String url) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url;
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(),"UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
    public static User getUserWXIntro(String code){
        //1.得到access_token
        String jsonUrl="https://api.weixin.qq.com/sns/oauth2/access_token?appid=wxc0d2e309454d7e18&secret=9ae79e7280fdf5b38a1d0106cbf496ef&code="+code+"&grant_type=authorization_code";
        String jsonResponse=sendGet(jsonUrl);
        System.out.println("返回JSON数据："+jsonResponse);
        //2.对json数据进行解析
        JSONObject jsonObject=JSONObject.parseObject(jsonResponse);
        String access_token=jsonObject.getString("access_token");
        String openid=jsonObject.getString("openid");
        String userJson="https://api.weixin.qq.com/sns/userinfo?access_token="+access_token+"&openid="+openid;
        String userResponse=sendGet(userJson);
        System.out.println("返回JSON数据："+userResponse);
        //对UserResponse解析
        JSONObject userJsonObject=JSONObject.parseObject(userResponse);
        //https://api.weixin.qq.com/sns/userinfo?access_token=OezXcEiiBSKSxW0eoylIeL3jZIQj6Cfx04JBB1CyyaP7OHDG5vOUo8KkhQoXUzbC0NXGka-oYx5mglmZNnQRS68HPaxlVxIwhboAJoYAyG_MVSejqbNRxIIL-7Pt6ztUbFRb8oCX1UFtixb2NNo-Qw&openid=oNCQdt2r8XgaWQNIUWY2iqRqoVNQ
        String unionid=userJsonObject.getString("unionid");
        String nickname=userJsonObject.getString("nickname");
        String headimgurl=userJsonObject.getString("headimgurl");
        int sex=userJsonObject.getIntValue("sex");
        User user=new User();

        user.setUser_unionid(unionid);
        user.setUser_token(access_token);
        user.setUser_nickname(nickname);
        user.setUser_avatar(headimgurl);
        user.setSex(sex);

        return user;
    }
}
