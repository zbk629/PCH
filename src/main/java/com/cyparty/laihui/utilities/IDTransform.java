package com.cyparty.laihui.utilities;

/**
 * Created by zhu on 2016/7/18.
 */
public class IDTransform {
    public static String  transformID(int id){
        String now_id=id+"";
        int ascValue=0;
        char charInt[]=now_id.toCharArray();
        for(char num:charInt){
            int asc=(int)num;
            ascValue=ascValue+asc;
        }
        String now_value=ascValue+random8()+Utils.getTimestamp();
        String md5=Utils.encode("MD5",now_value);
        return md5;
    }

    public static void main(String[] args) {
        transformID(25);
    }
    //产生8位随机数
    public static String random8(){
        int[] i=new int[8];
        int count=0;
        String randomNum="";
        while(count<8){
            int t=(int)(Math.random()*122);//抽取的数值小于char类型的“z”（122）
            if((t>=0&t<=9)|(t>=65&t<=90)|(t>=97&t<=122)){
                i[count]=t;
                count++;
            }
        }for(int k=0;k<8;k++){
            if(i[k]>=0&i[k]<=9)
                randomNum=randomNum+i[k];
            else
                randomNum=randomNum+(char)i[k];
        }
        return randomNum;
    }
}
