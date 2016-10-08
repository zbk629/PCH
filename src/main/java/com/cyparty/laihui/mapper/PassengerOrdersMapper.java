package com.cyparty.laihui.mapper;

import com.cyparty.laihui.domain.Code;
import com.cyparty.laihui.domain.PassengerOrder;
import com.cyparty.laihui.utilities.Utils;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class PassengerOrdersMapper implements RowMapper<PassengerOrder> {

    public PassengerOrder mapRow(ResultSet resultSet, int i) throws SQLException {
        PassengerOrder order=new PassengerOrder();

        order.set_id(resultSet.getInt("_id"));
        order.setDriver_order_id(resultSet.getInt("order_id"));
        order.setUser_id(resultSet.getInt("user_id"));
        order.setSeats(resultSet.getInt("booking_seats"));
        order.setBoarding_point(resultSet.getString("boarding_point"));
        order.setBreakout_ponit(resultSet.getString("breakout_point"));
        order.setDescription(resultSet.getString("description"));
        order.setCreate_time(resultSet.getString("create_time").split("\\.")[0]);
        order.setMobile(Utils.checkNull(resultSet.getString("mobile")));
        //order.setPay_status(resultSet.getInt("pay_status"));

        return order;
    }
}
