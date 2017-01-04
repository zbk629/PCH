package com.cyparty.laihui.mapper;

import com.cyparty.laihui.domain.UserToken;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class UserIDMapper implements RowMapper<UserToken> {

    public UserToken mapRow(ResultSet resultSet, int i) throws SQLException {
        UserToken userToken=new UserToken();
        userToken.setUser_id(resultSet.getInt("user_id"));
        return userToken;
    }
}
