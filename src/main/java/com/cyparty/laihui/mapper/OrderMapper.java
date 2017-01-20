package com.cyparty.laihui.mapper;

import com.cyparty.laihui.domain.Order;
import com.cyparty.laihui.utilities.Utils;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class OrderMapper implements RowMapper<Order> {

    public Order mapRow(ResultSet resultSet, int i) throws SQLException {
        Order order=new Order();

        order.set_id(resultSet.getInt("_id"));
        order.setOrder_id(resultSet.getInt("order_id"));
        order.setUser_id(resultSet.getInt("user_id"));
        order.setOrder_status(resultSet.getInt("order_status"));
        order.setUpdate_time(Utils.checkTime(resultSet.getString("update_time")));
        order.setCreate_time(Utils.checkTime(resultSet.getString("create_time")));


        return order;
    }
}
