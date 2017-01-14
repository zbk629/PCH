package com.cyparty.laihui.domain;

/**
 * Created by zhu on 2017/1/12.
 */
public class PayBack {
    private int user_id;
    private int order_id;
    private int pay_type;
    private int pay_status;
    private double pay_cash;
    private String pay_account;
    private String pay_reason;
    private String create_time;

    public double getPay_cash() {
        return pay_cash;
    }

    public void setPay_cash(double pay_cash) {
        this.pay_cash = pay_cash;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getPay_type() {
        return pay_type;
    }

    public void setPay_type(int pay_type) {
        this.pay_type = pay_type;
    }

    public int getPay_status() {
        return pay_status;
    }

    public void setPay_status(int pay_status) {
        this.pay_status = pay_status;
    }

    public String getPay_account() {
        return pay_account;
    }

    public void setPay_account(String pay_account) {
        this.pay_account = pay_account;
    }

    public String getPay_reason() {
        return pay_reason;
    }

    public void setPay_reason(String pay_reason) {
        this.pay_reason = pay_reason;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }
}
