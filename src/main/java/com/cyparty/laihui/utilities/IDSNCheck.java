package com.cyparty.laihui.utilities;

/**
 * Created by zhu on 2016/6/30.
 */
public class IDSNCheck {
    private static int[] weight={7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};    //十七位数字本体码权重
    private static char[] validate={ '1','0','X','9','8','7','6','5','4','3','2'};    //mod11,对应校验码字符值

    public static boolean getValidateCode(String idsn){
        boolean is_success=true;
        String id17="";
        String check_code="";
        if(idsn.length()!=18){
            is_success=false;
            return is_success;
        }else {
            id17=idsn.substring(0, 17);
            check_code=idsn.substring(17,18);
        }
        int sum = 0;
        int mode = 0;
        for(int i = 0; i < id17.length(); i++){
            sum=sum+Integer.parseInt(String.valueOf(id17.charAt(i)))*weight[i];
        }

        mode = sum % 11;
        String result_code= validate[mode]+"";
        if(!check_code.equals(result_code)){
            is_success=false;
        }
        return is_success;
    }

    public static void main(String[] args){
        System.out.println("该身份证验证码："+ IDSNCheck.getValidateCode("4113021993111457"));
    }
}

