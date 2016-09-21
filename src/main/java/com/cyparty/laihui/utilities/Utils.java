package com.cyparty.laihui.utilities;


import com.cyparty.laihui.domain.User;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by zhu on 2015/12/30.
 */
@Component
public class Utils {

    public static void main(String[] args) {
        //System.out.println(Memcache.getMemcache("3d2d8b6b8fdfcbadedb20072010ea842"));
        //System.out.println(getOrderNumber(5));
        System.out.println(date2TimeStamp("2016-8-27 05:06:40"));
    }



    public static void getRefID(HttpServletRequest request) {
        String ref = request.getParameter("ref");
        if (request.getSession().getAttribute("ref") == null) {
            if (ref == null) {
                request.getSession().setAttribute("ref", 0);
            } else {
                int id = Integer.parseInt(ref);
                request.getSession().setAttribute("ref", id);
            }
        }
    }

    public static int toInt(String input) {
        int result = 0;
        if (input != null && !input.trim().equals("")) {
            try {
                result = Integer.parseInt(input);
            } catch (Exception e) {
                result = 0;
                System.out.println("Utils.toInt" + e.getMessage());
            }
        }
        return result;
    }

    public static String getCurrentTime() {
        Date inputDate = new Date();
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datetime = outputFormat.format(inputDate);
        return datetime;
    }

    //
    public static String getCurrentTimeSubOrAdd(int minute) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar nowTime = Calendar.getInstance();
        nowTime.add(Calendar.MINUTE, minute);
        String datetime = sdf.format(nowTime.getTime());
        System.out.println(sdf.format(nowTime.getTime()));
        return datetime;
    }

    public static String getTimestamp() {
        Long timestamp = System.currentTimeMillis();
        return timestamp.toString();
    }
    //文件命名
    public static String setFileName(String rootfilepath) {
        String currenttime = Utils.getCurrentTime();
        String files[] = currenttime.split("-");
        String filelast[] = files[2].split(" ");
        String filepathdirectory = rootfilepath + "\\" + files[0] + "\\" + files[1] + "\\" + filelast[0];
        String filepath = rootfilepath + "\\" + files[0] + "\\" + files[1] + "\\" + filelast[0] + "\\"  + Utils.getTimestamp() + ".png";
        File filedirctory = new File(filepathdirectory);
        File file = new File(filepath);
        if (!filedirctory.exists() && !filedirctory.isDirectory()) {
            Boolean dirSuccess = filedirctory.mkdirs();
            if (dirSuccess) {
                //System.out.println(filepath+"创建成功");
            } else {
                //System.out.println(filepath+"创建失败");
            }
        }
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return filepath;
    }

    //logo上传
    public static String fileImgUpload( String filename, HttpServletRequest request) {
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = multipartHttpServletRequest.getFile(filename);
        String filepath = "";
        try {
            if (file != null && file.getSize() > 0) {
                InputStream inputStream = file.getInputStream();
                filepath = request.getSession().getServletContext().getRealPath("/upload");
                filepath = Utils.setFileName(filepath);
                File newfile = new File(filepath);
                FileOutputStream outputStream = new FileOutputStream(newfile);
                int bytesWritten = 0;
                int byteCount = 0;
                byte[] bytes = new byte[1024 * 1024];
                while ((byteCount = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, bytesWritten, byteCount);
                }
                inputStream.close();
                outputStream.close();
            }
        } catch (Exception e) {
            System.out.println("上传失败！！！" + e.getMessage());
        }

        return filepath;
    }

    //文件上传
    public static List<String> fileUpLoad(String filename, HttpServletRequest request) {
        List<String> filepaths = new ArrayList();
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> fileList = multipartHttpServletRequest.getFiles(filename);
        if (fileList.size() > 0) {
            for (int fileIndex = 0; fileIndex < fileList.size(); fileIndex++) {
                MultipartFile file = fileList.get(fileIndex);
                try {
                    if (file != null&&file.getSize()>0) {
                        InputStream inputStream = file.getInputStream();
                        String filePath = request.getSession().getServletContext().getRealPath("/upload");
                        filePath = Utils.setFileName(filePath);
                        filepaths.add(filePath);
                        File newfile = new File(filePath);
                        FileOutputStream outputStream = new FileOutputStream(newfile);
                        int bytesWritten = 0;
                        int byteCount = 0;
                        byte[] bytes = new byte[1024 * 1024];
                        while ((byteCount = inputStream.read(bytes)) != -1) {
                            outputStream.write(bytes, bytesWritten, byteCount);
                        }
                        inputStream.close();
                        outputStream.close();
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        }
        return filepaths;
    }

    //检查得到的内容是否为空

    public static String startDateConverter(String inputDateString) {
        String result = "1990-01-01 00:00:00";
        if (!inputDateString.trim().equals("")) {
            SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
            try {
                Date inputDate = df.parse(inputDateString);
                SimpleDateFormat newDf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String tmp = newDf.format(inputDate);
                result = tmp;
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return result;
    }

    public static String endDateConverter(String inputDateString) {
        String result = "2100-01-01 00:00:00";
        if (!inputDateString.trim().equals("")) {
            SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
            try {
                Date inputDate = df.parse(inputDateString);
                SimpleDateFormat newDf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String tmp = newDf.format(inputDate);
                result = tmp;
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return result;
    }

    //加密算法
    public static String encode(String algorithm, String str) {
        String ALGORITHM = "MD5";

        char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5',
                '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
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
        char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5',
                '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        // 把密文转换成十六进制的字符串形式
        for (int j = 0; j < len; j++) {
            buf.append(HEX_DIGITS[(bytes[j] >> 4) & 0x0f]);
            buf.append(HEX_DIGITS[bytes[j] & 0x0f]);
        }
        return buf.toString();
    }
    public static String getIP(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if(index != -1){
                return ip.substring(0,index);
            }else{
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
            return ip;
        }
        return request.getRemoteAddr();
    }
    //获取客户端ip

    public static String getClientIp(HttpServletRequest request ){
        String ip = request.getHeader("x-forwarded-for");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
    public static String checkNull(String input){
        String result="";
        if(input==null||input.trim().equals("")){
            result="";
        }else {
            result=input;
        }
        return result;
    }
    public static String checkTime(String input){
        String result="";
        if(input!=null&&!input.trim().equals("")){
            result=input.split("\\.")[0];
        }else {
            result=input;
        }
        return result;
    }
    //产生8位随机数
    public static String random(int n){
        int[] i=new int[n];
        int count=0;
        String randomNum="";
        while(count<n){
            int t=(int)(Math.random()*9);//抽取的数值小于char类型的“z”（122）
            if((t>=0&t<=9)){
                i[count]=t;
                count++;
            }
        }for(int k=0;k<n;k++){
            if(i[k]>=0&i[k]<=9)
                randomNum=randomNum+i[k];
            else
                randomNum=randomNum+(char)i[k];
        }
        return randomNum;
    }
    /**
     * 日期格式字符串转换成时间戳
     * @param date 字符串日期
     * @return
     */
    public static long date2TimeStamp(String date){
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //return String.valueOf(sdf.parse(date).getTime()/1000);
            return sdf.parse(date).getTime();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    /**
     * 取得当前时间戳（精确到毫秒）
     * @return
     */
    public static long getCurrenTimeStamp(){
        long time = System.currentTimeMillis();
        return time;
    }
    public static String getOrderNumber(int current_id){
        String result="";
        result= Utils.getTimestamp()+random(4)+current_id;
        return result;
    }
    public static String sendCodeMessage(String mobile){
        String rand= SendSMSUtil.randomNum();
        String typ_val="#code#="+rand;
        boolean send_isSuccess= SendSMSUtil.sendSMS(mobile, 18365, typ_val);
        if(!send_isSuccess){
            typ_val=null;
        }else {
            typ_val=rand;
        }
        return typ_val;
    }
    public static boolean sendNotifyMessage(String d_mobile,String p_mobile,String date){
        String typ_val="#mobile#="+p_mobile;
        boolean send_isSuccess= SendSMSUtil.sendSMS(d_mobile, 19361, typ_val);
        return send_isSuccess;
    }
    public static boolean sendCancleNotifyMessage(String d_mobile,String p_mobile){
        String typ_val="#mobile#="+p_mobile;
        boolean send_isSuccess= SendSMSUtil.sendSMS(d_mobile, 8193, typ_val);
        return send_isSuccess;
    }
    public static boolean isLogined(HttpServletRequest request){
        boolean is_logined=false;
        if(request.getSession().getAttribute("user_id")!=null){
            is_logined=true;
        }
        return is_logined;
    }
    public static boolean isHasMapOpenid(HttpServletRequest request){
        boolean is_has=false;
        if(request.getSession().getAttribute("user")!=null){
            User user=(User)request.getSession().getAttribute("user");
            if(user.getOpenid()!=null&&!user.getOpenid().trim().equals("")){
                is_has=true;
            }else {
                is_has=false;
            }
        }
        return is_has;
    }
}
