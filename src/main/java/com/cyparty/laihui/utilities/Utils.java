package com.cyparty.laihui.utilities;


import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
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
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by zhu on 2015/12/30.
 */
@Component
public class Utils {

    public static void main(String[] args) {
        //System.out.println(Memcache.getMemcache("3d2d8b6b8fdfcbadedb20072010ea842"));
        //System.out.println(getOrderNumber(5));
        //System.out.println(date2TimeStamp("2016-8-27 05:06:40"));
        //getTimeSubOrAdd("2016-8-27 05:06:40",2);
        //getTimeDate("2016-8-27 05:06:40");
        getRed(10,100f,1d);
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

    public static String getTimeSubOrAdd(String time,int hour){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date=null;
        try {
            date = sdf.parse(time);
        } catch (Exception e) {
        // TODO 自动生成 catch 块
            e.printStackTrace();
        }
        Calendar ca=Calendar.getInstance();
        ca.setTime(date);
        ca.add(Calendar.HOUR, hour);

        System.out.println(sdf.format(ca.getTime()));
        return sdf.format(ca.getTime());
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
            messageDigest.update(str.getBytes("utf-8"));
            return getFormattedText(messageDigest.digest());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static String getFormattedText(byte[] bytes) {
        int len = bytes.length;
        StringBuilder buff = new StringBuilder(len * 2);
        char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5',
                '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        for (int j = 0; j < len; j++) {
            buff.append(HEX_DIGITS[(bytes[j] >> 4) & 0x0f]);
            buff.append(HEX_DIGITS[bytes[j] & 0x0f]);
        }
        return buff.toString();
    }

    public static String checkNull(String input){
        String result="";
        if(input==null||input.trim().equals("")||input.trim().equals("null")){
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

    public static String checkCash(Double input){
        String cash=input+"";
        String result="";
        if(cash!=null&&!cash.trim().equals("")){
            if(!cash.contains(".")){
                result=cash+".00";
            }else {
                result=cash;
            }
        }else {
            result=cash;
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
    public static boolean sendNotifyMessage(String d_mobile,String p_mobile){
        String typ_val="#mobile#="+p_mobile;
        boolean send_isSuccess= SendSMSUtil.sendSMS(d_mobile, 19361, typ_val);
        return send_isSuccess;
    }
    public static boolean sendPublishNotifyMessage(String d_mobile){
        String typ_val="#mobile#="+d_mobile;
        boolean send_isSuccess= SendSMSUtil.sendSMS(d_mobile, 19139, typ_val);
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
    public static boolean isLogin(HttpServletRequest request){
        boolean is_logined=false;
        if(request.getSession().getAttribute("user")!=null){
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
    public static boolean sendAllNotifyMessage(String d_mobile,String title,String content){
        String typ_val="#title#="+title+"&#orderstatus#="+content;
        boolean send_isSuccess= SendSMSUtil.sendSMS(d_mobile, 15292, typ_val);
        return send_isSuccess;
    }
    public static String getTimeDate(String time){
        String cur_time=time.split(" ")[0];
        int year=Integer.parseInt(cur_time.split("-")[0]);
        int month=Integer.parseInt(cur_time.split("-")[1]);
        int day=Integer.parseInt(cur_time.split("-")[2]);
        String now_time=year+"年"+month+"月"+day+"日";
        return now_time;
    }
    public static List getRed(int number,float total,double min){
        //红包数
        //int number = 300;
        //红包总额
        // float total = 500;
        float money;
        //最小红包
        //double min = 0.48;
        double max;
        int i = 1;
        List math = new ArrayList();
        DecimalFormat df = new DecimalFormat("###.##");
        while (i < number) {
            //保证即使一个红包是最大的了,后面剩下的红包,每个红包也不会小于最小值
            max = total - min * (number - i);
            int k = (int)(number - i) / 2;
            //保证最后两个人拿的红包不超出剩余红包
            if (number - i <= 2) {
                k = number - i;
            }
            //最大的红包限定的平均线上下
            max = max / k;
            //保证每个红包大于最小值,又不会大于最大值
            money = (int) (min * 100 + Math.random() * (max * 100 - min * 100 + 1));
            money = (float)money / 100;
            //保留两位小数
            money = Float.parseFloat(df.format(money));
            total=(int)(total*100 - money*100);
            total = total/100;
            math.add(money);
            System.out.println("第" + i + "个人拿到" + money + "剩下" + total);
            i++;
            //最后一个人拿走剩下的红包
            if (i == number) {
                math.add(total);
                System.out.println("第" + i + "个人拿到" + total + "剩下0");
            }
        }
        //取数组中最大的一个值的索引
        System.out.println("本轮发红包中第" + (math.indexOf(Collections.max(math)) + 1) + "个人手气最佳");
        return math;
    }
}
