package com.cyparty.laihui.domain;

import com.cyparty.laihui.utilities.Utils;

/**
 * Created by zhu on 2016/12/29.
 */
public class PayLog implements Comparable<PayLog> {
    private int _id;
    private int order_id;
    private int user_id;
    private int is_complete;
    private int p_id;
    private int driver_id;
    private double cash;
    private double total_cash;
    private int action_type;
    private int pay_type;
    private int order_status;
    private String create_time;
    private String departure_time;
    private String user_mobile;
    private String pay_account;
    private String trade_no;

    public double getTotal_cash() {
        return total_cash;
    }

    public void setTotal_cash(double total_cash) {
        this.total_cash = total_cash;
    }

    public String getUser_mobile() {
        return user_mobile;
    }

    public void setUser_mobile(String user_mobile) {
        this.user_mobile = user_mobile;
    }

    public int getIs_complete() {
        return is_complete;
    }

    public void setIs_complete(int is_complete) {
        this.is_complete = is_complete;
    }

    public String getTrade_no() {
        return trade_no;
    }

    public void setTrade_no(String trade_no) {
        this.trade_no = trade_no;
    }

    public int getOrder_status() {
        return order_status;
    }

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
    }

    public String getPay_account() {
        return pay_account;
    }

    public void setPay_account(String pay_account) {
        this.pay_account = pay_account;
    }

    public String getDeparture_time() {
        return departure_time;
    }

    public void setDeparture_time(String departure_time) {
        this.departure_time = departure_time;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public int get_id() {
        return _id;
    }

    public void set_id(int _id) {
        this._id = _id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public int getDriver_id() {
        return driver_id;
    }

    public void setDriver_id(int driver_id) {
        this.driver_id = driver_id;
    }

    public double getCash() {
        return cash;
    }

    public void setCash(double cash) {
        this.cash = cash;
    }

    public int getAction_type() {
        return action_type;
    }

    public void setAction_type(int action_type) {
        this.action_type = action_type;
    }

    public int getPay_type() {
        return pay_type;
    }

    public void setPay_type(int pay_type) {
        this.pay_type = pay_type;
    }

    @Override
    public int compareTo(PayLog o) {
        long thisTime= Utils.date2TimeStamp(this.create_time);
        long inputTime=Utils.date2TimeStamp(o.getCreate_time());
        if (thisTime>inputTime){
            return -1;
        }else if (thisTime==inputTime){
            return 0;
        }else {
            return 1;
        }
    }
}
