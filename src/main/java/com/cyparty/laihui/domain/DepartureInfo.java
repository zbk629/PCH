package com.cyparty.laihui.domain;

/**
 * Created by zhu on 2016/8/3.
 */
public class DepartureInfo {
    private int r_id;
    private int user_id;
    private int is_enable;
    private int status;
    private double price;
    private String start_time;
    private String end_time;
    private String departure_province;
    private String departure_city;
    private String destination_province;
    private String destination_city;
    private int init_seats;
    private int current_seats;
    private int is_must_departure;
    private String create_time;
    private String points;
    private String description;
    private String mobile;
    private String date;

    private double origin_price;
    String departure_county;
    String destination;
    String tag_yes_content;
    String tag_no_content;
    String driving_name;
    String car_brand;
    String openid;

    public double getOrigin_price() {
        return origin_price;
    }

    public void setOrigin_price(double origin_price) {
        this.origin_price = origin_price;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDeparture_county() {
        return departure_county;
    }

    public void setDeparture_county(String departure_county) {
        this.departure_county = departure_county;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getTag_yes_content() {
        return tag_yes_content;
    }

    public void setTag_yes_content(String tag_yes_content) {
        this.tag_yes_content = tag_yes_content;
    }

    public String getTag_no_content() {
        return tag_no_content;
    }

    public void setTag_no_content(String tag_no_content) {
        this.tag_no_content = tag_no_content;
    }

    public String getDriving_name() {
        return driving_name;
    }

    public void setDriving_name(String driving_name) {
        this.driving_name = driving_name;
    }

    public String getCar_brand() {
        return car_brand;
    }

    public void setCar_brand(String car_brand) {
        this.car_brand = car_brand;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPoints() {
        return points;
    }

    public void setPoints(String points) {
        this.points = points;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getIs_enable() {
        return is_enable;
    }

    public void setIs_enable(int is_enable) {
        this.is_enable = is_enable;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public String getDeparture_province() {
        return departure_province;
    }

    public void setDeparture_province(String departure_province) {
        this.departure_province = departure_province;
    }

    public String getDeparture_city() {
        return departure_city;
    }

    public void setDeparture_city(String departure_city) {
        this.departure_city = departure_city;
    }

    public String getDestination_province() {
        return destination_province;
    }

    public void setDestination_province(String destination_province) {
        this.destination_province = destination_province;
    }

    public String getDestination_city() {
        return destination_city;
    }

    public void setDestination_city(String destination_city) {
        this.destination_city = destination_city;
    }

    public int getInit_seats() {
        return init_seats;
    }

    public void setInit_seats(int init_seats) {
        this.init_seats = init_seats;
    }

    public int getCurrent_seats() {
        return current_seats;
    }

    public void setCurrent_seats(int current_seats) {
        this.current_seats = current_seats;
    }

    public int getIs_must_departure() {
        return is_must_departure;
    }

    public void setIs_must_departure(int is_must_departure) {
        this.is_must_departure = is_must_departure;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }
}
