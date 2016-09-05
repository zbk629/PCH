package com.cyparty.laihui.mapper;

import com.cyparty.laihui.domain.PassengerOrder;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class PassengerPublishInfoMapper implements RowMapper<PassengerOrder> {

    public PassengerOrder mapRow(ResultSet resultSet, int i) throws SQLException {
        PassengerOrder order=new PassengerOrder();

        order.set_id(resultSet.getInt("_id"));
        order.setUser_id(resultSet.getInt("user_id"));
        order.setDeparture_city(resultSet.getString("departure_city"));
        order.setDestination_city(resultSet.getString("destination_city"));
        order.setStart_time(resultSet.getString("start_time"));
        order.setEnd_time(resultSet.getString("end_time"));
        order.setName(resultSet.getString("user_name"));
        order.setMobile(resultSet.getString("user_mobile"));
        order.setSeats(resultSet.getInt("booking_seats"));
        order.setBoarding_point(resultSet.getString("boarding_point"));
        order.setBreakout_ponit(resultSet.getString("breakout_point"));
        order.setDescription(resultSet.getString("description"));
        order.setCreate_time(resultSet.getString("create_time"));


        return order;
    }
}
