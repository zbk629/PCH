package com.cyparty.laihui.mapper;


import com.cyparty.laihui.domain.DepartureInfo;
import com.cyparty.laihui.utilities.Utils;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class PCHDepartureInfoMapper implements RowMapper<DepartureInfo> {

    public DepartureInfo mapRow(ResultSet resultSet, int i) throws SQLException {
        DepartureInfo departure=new DepartureInfo();

        departure.setR_id(resultSet.getInt("_id"));
        departure.setStart_time(Utils.checkTime(resultSet.getString("start_time")));
        departure.setEnd_time(Utils.checkTime(resultSet.getString("end_time")));
        departure.setDeparture_city(resultSet.getString("departure_city"));
        departure.setDestination_city(resultSet.getString("destination_city"));
        departure.setInit_seats(resultSet.getInt("init_seats"));
        departure.setMobile(Utils.checkNull(resultSet.getString("mobile")));
        departure.setPoints(Utils.checkNull(resultSet.getString("points")));
        departure.setDescription(Utils.checkNull(resultSet.getString("description")));
        departure.setCar_brand(Utils.checkNull(resultSet.getString("car_brand")));
        departure.setDeparture_county(Utils.checkNull(resultSet.getString("departure")));
        departure.setDestination(Utils.checkNull(resultSet.getString("destination")));
        departure.setDriving_name(Utils.checkNull(resultSet.getString("driving_name")));
        departure.setTag_yes_content(Utils.checkNull(resultSet.getString("tag_yes_content")));
        departure.setTag_no_content(Utils.checkNull(resultSet.getString("tag_no_content")));
        departure.setStatus(resultSet.getInt("info_status"));
        departure.setCreate_time(Utils.checkTime(resultSet.getString("create_time")));
        departure.setIs_enable(resultSet.getInt("is_enable"));

        return departure;
    }
}
