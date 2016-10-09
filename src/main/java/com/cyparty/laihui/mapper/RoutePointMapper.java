package com.cyparty.laihui.mapper;


import com.cyparty.laihui.domain.RoutePoint;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class RoutePointMapper implements RowMapper<RoutePoint> {

    public RoutePoint mapRow(ResultSet resultSet, int i) throws SQLException {
        RoutePoint point=new RoutePoint();

        point.setRoute_id(resultSet.getInt("route_id"));
        point.setPoint_seq(resultSet.getInt("point_seq"));
        point.setPoint_name(resultSet.getString("point_name"));
       /* point.setPoint_lat(resultSet.getString("point_lat"));
        point.setPoint_lng(resultSet.getString("point_lng"));
        point.setPoint_uid(resultSet.getString("point_uid"));
        point.setPoint_city(resultSet.getString("point_city"));
        point.setPoint_district(resultSet.getString("point_district"));*/
        point.setPoint_create_time(resultSet.getString("point_create_time"));


        return point;
    }
}
