package com.cyparty.laihui.utilities;

import com.alibaba.fastjson.JSONObject;
import com.cyparty.laihui.domain.DepartureInfo;
import com.cyparty.laihui.domain.User;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.util.Date;

/**
 * Created by zhu on 2016/8/15.
 */
public class WXUtils {
    public static String getWxTimestamp()
    {
        Date date=new Date();
        return Long.toString(date.getTime()/1000);
    }
    //产生16位随机数
    public static String random16(){
        int[] i=new int[16];
        int count=0;
        String randomNum="";
        while(count<16){
            int t=(int)(Math.random()*122);//抽取的数值小于char类型的“z”（122）
            if((t>=0&t<=9)|(t>=65&t<=90)|(t>=97&t<=122)){
                i[count]=t;
                count++;
            }
        }for(int k=0;k<16;k++){
            if(i[k]>=0&i[k]<=9)
                randomNum=randomNum+i[k];
            else
                randomNum=randomNum+(char)i[k];
        }
        return randomNum;
    }
    //获取微信jsapi_token
    public static String getRemoteWXJsapiTicket()
    {
        String ticket="";
        String access_token=getRemoteWXAccessToken();
        String ticket_url="";
        String json_string="";
        if(access_token!=null)
        {
            ticket_url="https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+access_token+"&type=jsapi";
            json_string=loadJson(ticket_url);
            JSONObject jsonObject=JSONObject.parseObject(json_string);
            ticket=jsonObject.getString("ticket");
        }
        return ticket;
    }
    public static String getRemoteWXAccessToken()
    {
        String access_token="";
        String wx_app_id="wxc0d2e309454d7e18";
        String wx_app_secret="9ae79e7280fdf5b38a1d0106cbf496ef";
        String token_url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+wx_app_id+"&secret="+wx_app_secret;
        String json_string=loadJson(token_url);
        JSONObject jsonObject=JSONObject.parseObject(json_string);
        access_token=jsonObject.getString("access_token");
        //System.out.println("Access_token:"+access_token);
        return access_token;
    }
    public static String loadJson (String url) {
        StringBuilder json = new StringBuilder();
        try {
            URL urlObject = new URL(url);
            URLConnection uc = urlObject.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream()));
            String inputLine = null;
            while ( (inputLine = in.readLine()) != null) {
                json.append(inputLine);
            }
            in.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return json.toString();
    }
    //加密
    public static String encode(String algorithm, String str) {
        String ALGORITHM = "MD5";

        char[] HEX_DIGITS = { '0', '1', '2', '3', '4', '5',
                '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
        if (str == null) {
            return null;
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(algorithm);
            messageDigest.update(str.getBytes());
            return getFormattedText(messageDigest.digest());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    private static String getFormattedText(byte[] bytes) {
        int len = bytes.length;
        StringBuilder buf = new StringBuilder(len * 2);
        char[] HEX_DIGITS = { '0', '1', '2', '3', '4', '5',
                '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
        // 把密文转换成十六进制的字符串形式
        for (int j = 0; j<len; j++) {
            buf.append(HEX_DIGITS[(bytes[j] >> 4) & 0x0f]);
            buf.append(HEX_DIGITS[bytes[j] & 0x0f]);
        }
        return buf.toString();
    }
    //微信分享信息
    public static void wx_intro(HttpServletRequest request,Model model,String pagetitle,String image_name){
        long last_time=0;
        if(request.getSession().getServletContext().getAttribute("time")!=null){
            last_time=(Long)request.getSession().getServletContext().getAttribute("time");
        }
        long now_time = Long.parseLong(getWxTimestamp());
        String wx_url_base=request.getScheme()+"://"+ request.getServerName();
        String wx_url=request.getScheme()+"://"+ request.getServerName()+request.getRequestURI();
        String wx_path=request.getRequestURI().trim().toLowerCase();
        String wx_desc ="来回拼车 - 您的出行不二之选";
        //列表页面 path
        String wx_url_parameters=request.getQueryString();
        if(wx_url_parameters!=null)
        {
            wx_url=wx_url+"?"+wx_url_parameters;
        }
        if(wx_url.contains("#"))
        {
            wx_url=wx_url.split("#")[0];
        }
        String wx_jsapi_token=(String)request.getSession().getServletContext().getAttribute("jsapi_token");
        String wx_timestamp=getWxTimestamp();
        String wx_nonceStr=random16();

        //String test2=Util.encode("SHA1","jsapi_ticket=sM4AOVdWfPE4DxkXGEs8VLc2HqHn7AgHGQHWQJQWR37ek932_9P7aPK_DgITrN16mJ07SLhkTbCOpJBBqVCnwQ&noncestr=V4bwcCNfZi9mF2oi&timestamp=1447751448693&url=http://localhost:8080/WEB-INF/jsp/index.jsp");
        if(request.getSession().getServletContext().getAttribute("jsapi_token")==null||now_time-last_time>6000) {
            wx_jsapi_token = getRemoteWXJsapiTicket();
            request.getSession().getServletContext().setAttribute("jsapi_token", wx_jsapi_token);
            request.getSession().getServletContext().setAttribute("time", now_time);
        }
        String wx_encode="jsapi_ticket="+wx_jsapi_token+"&noncestr="+wx_nonceStr+"&timestamp="+wx_timestamp+"&url="+wx_url;
        String wx_encryption=encode("SHA1", wx_encode);
        String wx_title = pagetitle;

        if(pagetitle.contains("|")) {
            wx_title = pagetitle.split("\\|")[0];
        }
        model.addAttribute("wx_title", wx_title);
        model.addAttribute("wx_desc", wx_desc);
        model.addAttribute("wx_url", wx_url);
        model.addAttribute("wx_jsapi_token", wx_jsapi_token);
        model.addAttribute("wx_timestamp", wx_timestamp);
        model.addAttribute("wx_nonceStr", wx_nonceStr);
        model.addAttribute("pageTitle", pagetitle);
        model.addAttribute("wx_encryption", wx_encryption);
        String imageUrl=wx_url_base+"/resource/images/"+image_name;
        model.addAttribute("imageUrl",imageUrl);
    }
    //得到微信公众号的token
    public static String getWXPublishAccessToken()
    {
        String access_token="";
        String wx_app_id="wx79fccf65feb81e80";
        String wx_app_secret="659703bcdaa78b9d1a7ec5954bf6a6ff";
        String token_url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+wx_app_id+"&secret="+wx_app_secret;
        String json_string=loadJson(token_url);
        JSONObject jsonObject=JSONObject.parseObject(json_string);
        access_token=jsonObject.getString("access_token");
        //System.out.println("Access_token:"+access_token);
        return access_token;
    }
    public static JSONObject pinCheNotify(HttpServletRequest request,DepartureInfo departureInfo,int source) throws ClientProtocolException, IOException {
        boolean is_success=true;
        JSONObject result = new JSONObject();
        int i=0;
        while (is_success){

            String token = (String) request.getSession().getServletContext().getAttribute("access_token");
            long last_time = 0;
            if (request.getSession().getServletContext().getAttribute("time") != null) {
                last_time = (Long) request.getSession().getServletContext().getAttribute("time");
            }
            long now_time = Long.parseLong(getWxTimestamp());
            //6000
            if (token == null || now_time - last_time > 6000) {
                token = getWXPublishAccessToken();
                request.getSession().getServletContext().setAttribute("access_token", token);
                request.getSession().getServletContext().setAttribute("time", now_time);
            }

            String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=" + token;

            User user=(User)request.getSession().getAttribute("user");
            String json="";
            if(source==1){
                json="{\n" +
                        "           \"touser\":\""+user.getOpenid()+"\",\n" +
                        "           \"template_id\":\"wKsNLWJCpYrbsBqTRKG_JeeqxrlFxSAhRzC8cwL9CDM\",\n" +
                        "           \"url\":\"http://wx.pinchenet.com/laihui/car/detail?id="+departureInfo.getR_id()+"&open="+user.getOpenid()+"\",            \n" +
                        "           \"data\":{\n" +
                        "                   \"first\": {\n" +
                        "                       \"value\":\"从"+departureInfo.getDeparture_city()+"到"+departureInfo.getDestination_city()+"的拼车发布成功！\",\n" +
                        "                       \"color\":\"#173177\"\n" +
                        "                   },\n" +
                        "                   \"keyword1\":{\n" +
                        "                       \"value\":\""+departureInfo.getDate()+"\",\n" +
                        "                       \"color\":\"#173177\"\n" +
                        "                   },\n" +
                        "                   \"keyword2\": {\n" +
                        "                       \"value\":\""+departureInfo.getDeparture_city()+"\",\n" +
                        "                       \"color\":\"#173177\"\n" +
                        "                   },\n" +
                        "                   \"keyword3\": {\n" +
                        "                       \"value\":\""+departureInfo.getDestination_city()+"\",\n" +
                        "                       \"color\":\"#173177\"\n" +
                        "                   },\n" +
                        "                   \"keyword4\": {\n" +
                        "                       \"value\":\""+user.getUser_mobile()+"\",\n" +
                        "                       \"color\":\"#173177\"\n" +
                        "                   },\n" +
                        "                   \"remark\":{\n" +
                        "                       \"value\":\"感谢您的使用！\",\n" +
                        "                       \"color\":\"#173177\"\n" +
                        "                   }\n" +
                        "           }\n" +
                        "       }";
            }else if(source==2){
                json="{\n" +
                        "           \"touser\":\""+departureInfo.getOpenid()+"\",\n" +
                        "           \"template_id\":\"w5Lz_lcVnHRcXAvkzqofCHIjgaFcjIL-ZOcpPDQtjPg\",\n" +
                        "           \"url\":\"http://wx.pinchenet.com/laihui/my_passenger/booking_list?open="+departureInfo.getOpenid()+"\",            \n" +
                        "           \"data\":{\n" +
                        "                   \"first\": {\n" +
                        "                       \"value\":\"尊敬的 车主先生/女士：  有新的拼友预定了您的座位。\",\n" +
                        "                       \"color\":\"#173177\"\n" +
                        "                   },\n" +
                        "                   \"keyword1\":{\n" +
                        "                       \"value\":\""+departureInfo.getDriving_name()+"\",\n" +
                        "                       \"color\":\"#173177\"\n" +
                        "                   },\n" +
                        "                   \"keyword2\": {\n" +
                        "                       \"value\":\""+departureInfo.getInit_seats()+"\",\n" +
                        "                       \"color\":\"#173177\"\n" +
                        "                   },\n" +
                        "                   \"keyword3\": {\n" +
                        "                       \"value\":\""+departureInfo.getMobile()+"\",\n" +
                        "                       \"color\":\"#173177\"\n" +
                        "                   },\n" +
                        "                   \"keyword4\": {\n" +
                        "                       \"value\":\""+departureInfo.getPoints()+"\",\n" +
                        "                       \"color\":\"#173177\"\n" +
                        "                   },\n" +
                        "                   \"remark\":{\n" +
                        "                       \"value\":\"[来回]提示：主动电话联系他/她。 相聚是缘，多点理解，多点爱心，生活就很美好！\",\n" +
                        "                       \"color\":\"#173177\"\n" +
                        "                   }\n" +
                        "           }\n" +
                        "       }";
            }
            HttpClient httpClient = new DefaultHttpClient();
            HttpPost post = new HttpPost(url);
            StringEntity postingString = new StringEntity(json,"utf-8");// json传递
            post.setEntity(postingString);
            post.setHeader("Content-type", "application/json");
            HttpResponse response = httpClient.execute(post);
            String content = EntityUtils.toString(response.getEntity());
            result=JSONObject.parseObject(content);
            String errcode=result.getString("errcode");
            if(errcode!=null&&errcode.equals("0")){
                is_success=false;
                break;
            }else {
                token = getWXPublishAccessToken();
                request.getSession().getServletContext().setAttribute("access_token", token);
                request.getSession().getServletContext().setAttribute("time", now_time);
                i++;
            }
            if(i>1){
                is_success=false;
                break;
            }
        }
        //System.out.println(result);
        return result;
    }
}
