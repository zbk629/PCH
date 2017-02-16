package com.cyparty.laihui.domain;

/**
 * Created by zhu on 2017/2/13.
 */
public class OrderOf76 {
    private int id;
    private int pay_type;
    private int pay_status;

    private String  pay_number;
    private String data;
    private double goods_price;
    private String buyer_location;
    private String buyer_name;
    private String buyer_mobile;
    private String buyer_description;
    private String create_time;
    private String deliver_name;
    private String deliver_number;

    public String getDeliver_name() {
        return deliver_name;
    }

    public void setDeliver_name(String deliver_name) {
        this.deliver_name = deliver_name;
    }

    public String getDeliver_number() {
        return deliver_number;
    }

    public void setDeliver_number(String deliver_number) {
        this.deliver_number = deliver_number;
    }

    public String getPay_number() {
        return pay_number;
    }

    public void setPay_number(String pay_number) {
        this.pay_number = pay_number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public double getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(double goods_price) {
        this.goods_price = goods_price;
    }

    public String getBuyer_location() {
        return buyer_location;
    }

    public void setBuyer_location(String buyer_location) {
        this.buyer_location = buyer_location;
    }

    public String getBuyer_name() {
        return buyer_name;
    }

    public void setBuyer_name(String buyer_name) {
        this.buyer_name = buyer_name;
    }

    public String getBuyer_mobile() {
        return buyer_mobile;
    }

    public void setBuyer_mobile(String buyer_mobile) {
        this.buyer_mobile = buyer_mobile;
    }

    public String getBuyer_description() {
        return buyer_description;
    }

    public void setBuyer_description(String buyer_description) {
        this.buyer_description = buyer_description;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }
}
