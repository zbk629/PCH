package com.cyparty.laihui.domain;

/**
 * Created by zhu on 2016/8/29.
 */
public class PassengerOrder {
    private int _id;
    private int driver_order_id;
    private int user_id;
    private int seats;
    private String boarding_point;
    private String breakout_ponit;
    private String description;

    public int get_id() {
        return _id;
    }

    public void set_id(int _id) {
        this._id = _id;
    }

    public int getDriver_order_id() {
        return driver_order_id;
    }

    public void setDriver_order_id(int driver_order_id) {
        this.driver_order_id = driver_order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    public String getBoarding_point() {
        return boarding_point;
    }

    public void setBoarding_point(String boarding_point) {
        this.boarding_point = boarding_point;
    }

    public String getBreakout_ponit() {
        return breakout_ponit;
    }

    public void setBreakout_ponit(String breakout_ponit) {
        this.breakout_ponit = breakout_ponit;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
