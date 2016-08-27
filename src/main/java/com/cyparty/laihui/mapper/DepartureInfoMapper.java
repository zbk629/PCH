package com.cyparty.laihui.mapper;


import com.cyparty.laihui.domain.DepartureInfo;
import com.cyparty.laihui.utilities.Utils;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class DepartureInfoMapper implements RowMapper<DepartureInfo> {

    public DepartureInfo mapRow(ResultSet resultSet, int i) throws SQLException {
        DepartureInfo departure=new DepartureInfo();

        departure.setR_id(resultSet.getInt("_id"));
        departure.setUser_id(resultSet.getInt("user_id"));
        departure.setStart_time(Utils.checkTime(resultSet.getString("start_time")));
        departure.setEnd_time(Utils.checkTime(resultSet.getString("end_time")));
        departure.setDeparture_province(resultSet.getString("departure_province"));
        departure.setDestination_province(resultSet.getString("destination_province"));
        departure.setDeparture_city(resultSet.getString("departure_city"));
        departure.setDestination_city(resultSet.getString("destination_city"));
        departure.setInit_seats(resultSet.getInt("init_seats"));
        departure.setCurrent_seats(resultSet.getInt("current_seats"));
        departure.setIs_must_departure(resultSet.getInt("is_must_departure"));
        departure.setCreate_time(Utils.checkTime(resultSet.getString("info_create_time")));
        departure.setIs_enable(resultSet.getInt("is_enable"));

        return departure;
    }
}
