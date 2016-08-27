package com.cyparty.laihui.mapper;


import com.cyparty.laihui.domain.RouteInfo;
import com.cyparty.laihui.utilities.Utils;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class PCHRouteInfoMapper implements RowMapper<RouteInfo> {

    public RouteInfo mapRow(ResultSet resultSet, int i) throws SQLException {
        RouteInfo routeInfo=new RouteInfo();

        routeInfo.setR_id(resultSet.getInt("_id"));
        routeInfo.setDeparture(resultSet.getString("departure_city"));
        routeInfo.setDestination(resultSet.getString("destination_city"));

        routeInfo.setDriving_length(resultSet.getFloat("driving_length"));
        routeInfo.setIs_enable(resultSet.getInt("is_enable"));
        routeInfo.setCreate_time(Utils.checkTime(resultSet.getString("create_time")));

        return routeInfo;
    }
}
