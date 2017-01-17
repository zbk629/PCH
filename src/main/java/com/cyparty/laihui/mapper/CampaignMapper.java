package com.cyparty.laihui.mapper;

import com.cyparty.laihui.domain.Campaign;
import com.cyparty.laihui.utilities.Utils;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class CampaignMapper implements RowMapper<Campaign> {

    public Campaign mapRow(ResultSet resultSet, int i) throws SQLException {
        Campaign campaign=new Campaign();

        campaign.setUser_id(resultSet.getInt("user_id"));
        String mobile=resultSet.getString("be_popularized_mobile");
        String now_mobile=mobile;
        if(mobile.length()==11){
            mobile=mobile.substring(0,3)+"****"+now_mobile.substring(now_mobile.length()-4);
        }
        campaign.setBe_popularized_mobile(mobile);
        campaign.setCreate_time(Utils.checkTime(resultSet.getString("create_time")));

        return campaign;
    }
}
