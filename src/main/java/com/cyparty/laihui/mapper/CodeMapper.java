package com.cyparty.laihui.mapper;

import com.cyparty.laihui.domain.Code;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class CodeMapper implements RowMapper<Code> {

    public Code mapRow(ResultSet resultSet, int i) throws SQLException {
        Code code=new Code();

        code.setCode(resultSet.getString("code"));
        code.setMobile(resultSet.getString("mobile"));
        code.setCreate_time(resultSet.getString("create_time"));

        return code;
    }
}
