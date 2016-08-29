package com.cyparty.laihui.mapper;

import com.cyparty.laihui.domain.Tag;
import com.cyparty.laihui.utilities.Utils;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class TagMapper implements RowMapper<Tag> {

    public Tag mapRow(ResultSet resultSet, int i) throws SQLException {
        Tag tag=new Tag();

        tag.set_id(resultSet.getInt("_id"));
        tag.setType(resultSet.getInt("tag_type"));
        tag.setContent(resultSet.getString("tag_content"));
        tag.setCreate_time(Utils.checkTime(resultSet.getString("tag_create_time")));
        tag.setIs_enable(resultSet.getInt("is_enable"));

        return tag;
    }
}
