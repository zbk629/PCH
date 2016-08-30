package com.cyparty.laihui.domain;

/**
 * Created by zhu on 2016/8/30.
 */
public class ErrorCodeMessage {
    private static final int loginError_code=402;//登陆状态失效，跳转登陆页面

    public static int getLoginError_code() {
        return loginError_code;
    }
}
