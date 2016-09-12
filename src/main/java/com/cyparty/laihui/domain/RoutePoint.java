package com.cyparty.laihui.domain;

/**
 * Created by zhu on 2016/8/3.
 */
public class RoutePoint {
    private int route_id;
    private int point_seq;
    private String point_name;
    private String point_lat;
    private String point_lng;
    private String point_uid;
    private String point_city;
    private String point_district;
    private String point_create_time;

    public int getPoint_seq() {
        return point_seq;
    }

    public void setPoint_seq(int point_seq) {
        this.point_seq = point_seq;
    }

    public int getRoute_id() {
        return route_id;
    }

    public void setRoute_id(int route_id) {
        this.route_id = route_id;
    }

    public String getPoint_name() {
        return point_name;
    }

    public void setPoint_name(String point_name) {
        this.point_name = point_name;
    }

    public String getPoint_lat() {
        return point_lat;
    }

    public void setPoint_lat(String point_lat) {
        this.point_lat = point_lat;
    }

    public String getPoint_lng() {
        return point_lng;
    }

    public void setPoint_lng(String point_lng) {
        this.point_lng = point_lng;
    }

    public String getPoint_uid() {
        return point_uid;
    }

    public void setPoint_uid(String point_uid) {
        this.point_uid = point_uid;
    }

    public String getPoint_city() {
        return point_city;
    }

    public void setPoint_city(String point_city) {
        this.point_city = point_city;
    }

    public String getPoint_district() {
        return point_district;
    }

    public void setPoint_district(String point_district) {
        this.point_district = point_district;
    }

    public String getPoint_create_time() {
        return point_create_time;
    }

    public void setPoint_create_time(String point_create_time) {
        this.point_create_time = point_create_time;
    }
}
