package com.cyparty.laihui.mapper;

import com.cyparty.laihui.domain.PassengerOrder;
import com.cyparty.laihui.utilities.Utils;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class PassengerPublishInfoMapper implements RowMapper<PassengerOrder> {

    public PassengerOrder mapRow(ResultSet resultSet, int i) throws SQLException {
        PassengerOrder passenger=new PassengerOrder();

        passenger.set_id(resultSet.getInt("_id"));
        passenger.setUser_id(resultSet.getInt("user_id"));

        passenger.setDeparture_time(Utils.checkTime(resultSet.getString("departure_time")));

        passenger.setBoarding_point(Utils.checkNull(resultSet.getString("boarding_point")));
        passenger.setBreakout_ponit(Utils.checkNull(resultSet.getString("breakout_point")));
        passenger.setSeats(resultSet.getInt("booking_seats"));
        passenger.setDescription(Utils.checkNull(resultSet.getString("description")));
        passenger.setCreate_time(resultSet.getString("create_time").split("\\.")[0]);

        passenger.setPrice(resultSet.getInt("price"));

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
        passenger.setName(name);
        passenger.setAvatar(Utils.checkNull(resultSet.getString("user_avatar")));
        passenger.setMobile(Utils.checkNull(resultSet.getString("user_mobile")));
        return passenger;
    }
}
