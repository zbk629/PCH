package com.cyparty.laihui.mapper;


import com.cyparty.laihui.domain.AppDepartureInfo;
import com.cyparty.laihui.domain.DepartureInfo;
import com.cyparty.laihui.utilities.Utils;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class APPDriverDepartureInfoMapper implements RowMapper<AppDepartureInfo> {

    public AppDepartureInfo mapRow(ResultSet resultSet, int i) throws SQLException {
        AppDepartureInfo departure=new AppDepartureInfo();

        departure.setR_id(resultSet.getInt("_id"));
        departure.setUser_id(resultSet.getInt("user_id"));
        departure.setStart_time(Utils.checkTime(resultSet.getString("start_time")));

        departure.setInit_seats(resultSet.getInt("init_seats"));
        departure.setCurrent_seats(resultSet.getInt("current_seats"));
        departure.setMobile(Utils.checkNull(resultSet.getString("mobile")));
        departure.setPoints(Utils.checkNull(resultSet.getString("points")));
        departure.setDescription(Utils.checkNull(resultSet.getString("description")));
        departure.setCreate_time(Utils.checkTime(resultSet.getString("create_time")));
        departure.setIs_enable(resultSet.getInt("is_enable"));
        String name= Utils.checkNull(resultSet.getString("user_name"));
        String idsn= Utils.checkNull(resultSet.getString("user_idsn"));

        if(!name.isEmpty()) {
            String endName = "";
            if (!idsn.isEmpty()) {
                String sexNum = idsn.substring(16, 17);
                if (!sexNum.isEmpty()) {
                    if (Integer.parseInt(sexNum) % 2 == 1) {
                        endName = "先生";
                    } else {
                        endName = "女士";
                    }
                }
            }
            if (name.length() <= 3) {
                name = name.substring(0, 1) + endName;
            } else {
                name = name.substring(0, 2) + endName;
            }
        }
        departure.setUser_name(name);

        departure.setUser_avatar(Utils.checkNull(resultSet.getString("user_avatar")));

        departure.setStatus(resultSet.getInt("info_status"));
        departure.setPrice(resultSet.getInt("price"));
        departure.setBoarding_point(resultSet.getString("boarding_point"));
        departure.setBreakout_point(resultSet.getString("breakout_point"));
        return departure;
    }
}
