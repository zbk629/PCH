package com.cyparty.laihui.mapper;

import com.cyparty.laihui.domain.User;
import com.cyparty.laihui.utilities.Utils;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class UserMapper implements RowMapper<User> {

    public User mapRow(ResultSet resultSet, int i) throws SQLException {
        User user =new User();

        user.setUser_id(resultSet.getInt("user_id"));
        user.setUser_mobile(Utils.checkNull(resultSet.getString("user_mobile")));
        user.setOpenid(Utils.checkNull(resultSet.getString("user_map_openid")));
        user.setUser_nickname(Utils.checkNull(resultSet.getString("user_name")));
        user.setUser_created(Utils.checkNull(resultSet.getString("user_create_time")));
        user.setUser_token(Utils.checkNull(resultSet.getString("user_wx_token")));
        user.setUser_avatar(Utils.checkNull(resultSet.getString("user_avatar")));
        user.setSex(resultSet.getInt("user_sex"));
        return user;
    }
}
