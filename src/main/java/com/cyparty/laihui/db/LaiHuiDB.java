package com.cyparty.laihui.db;


import com.cyparty.laihui.domain.*;
import com.cyparty.laihui.mapper.*;
import com.cyparty.laihui.utilities.Utils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * Created by zhu on 2015/12/29.
 */
public class LaiHuiDB {
    private DataSource dataSource;
    private JdbcTemplate jdbcTemplateObject;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplateObject = new JdbcTemplate(dataSource);
    }

    public void procedureUpdateDriverPublishInfo(int now_status, int id,int seats,String order_id) {
        String SQL = "call update_is_must_departure";
        String where = "(" + now_status + "," + id + "," + seats +  ",'" +order_id+"')";
        SQL = SQL + where;
        jdbcTemplateObject.execute(SQL);
    }
    public List<DepartureInfo> getPCHDepartureInfo(String where) {
        String SQL = "SELECT * FROM pch_publish_info " + where;
        List<DepartureInfo> routeInfoList = jdbcTemplateObject.query(SQL, new PCHDepartureInfoMapper());
        return routeInfoList;
    }

    public int getPCHDepartureCount(String where) {
        String sql = "SELECT count(*)total FROM pch_publish_info " + where;
        //int count=jdbcTemplateObject.queryForInt(sql);
        Map<String, Object> now = jdbcTemplateObject.queryForMap(sql);
        int total = Integer.parseInt(String.valueOf((long) now.get("total")));
        return total;
    }
    public List<RouteInfo> getRoute(String where) {
        String SQL = "SELECT * FROM pc_route_manage " + where;
        List<RouteInfo> routeInfoList = jdbcTemplateObject.query(SQL, new RouteInfoMapper());
        return routeInfoList;
    }

    public boolean update(String table_name, String where) {
        boolean is_success = true;
        String SQL = "update  " + table_name + where;
        int count = jdbcTemplateObject.update(SQL);
        if (count < 1) {
            is_success = false;
        }
        return is_success;
    }

    public List<RouteInfo> getPCHRoute(String where) {
        String SQL = "SELECT * FROM pch_route_manage " + where;
        List<RouteInfo> routeInfoList = jdbcTemplateObject.query(SQL, new PCHRouteInfoMapper());
        return routeInfoList;
    }

    //创建司机缴纳诚信保障金订单
    public boolean createMustDepartureOrder(int current_id, String order_number) {
        boolean is_success = true;
        String SQL = "insert into pc_pay_order(departure_info_id,pay_order_id,order_create_time,order_type,order_status) VALUES (?,?,?,?,?)";
        int count = jdbcTemplateObject.update(SQL, new Object[]{current_id, order_number, Utils.getCurrentTime(), 2, 0});
        if (count < 1) {
            is_success = false;
        }
        return is_success;
    }
    //创建司机缴纳诚信保障金订单
    public boolean createAlipayNotify(AlipayNotify alipayNotify,int parameter_num) {
        boolean is_success = true;
        String SQL = "insert into pc_alipay_log(buyer_email,buyer_id,seller_id,seller_email,price,trade_status,gmt_create,sign,out_trade_no,discount,payment_type,trade_no,notify_type,quantity,notify_time,body,total_fee,gmt_payment,notify_id,use_coupon,sign_type,is_total_fee_adjust,subject,parameter_num) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int count = jdbcTemplateObject.update(SQL, new Object[]{alipayNotify.getBuyer_email(), alipayNotify.getBuyer_id(),alipayNotify.getSeller_id(), alipayNotify.getSeller_email(), alipayNotify.getPrice(),alipayNotify.getTrade_status(),alipayNotify.getGmt_create(),alipayNotify.getSign(),alipayNotify.getOut_trade_no(),alipayNotify.getDiscount(),alipayNotify.getPayment_type(),alipayNotify.getTrade_no(),alipayNotify.getNotify_type(),alipayNotify.getQuantity(),alipayNotify.getNotify_time(),alipayNotify.getBody(),alipayNotify.getTotal_fee(),alipayNotify.getGmt_payment(),alipayNotify.getNotify_id(),alipayNotify.getUse_coupon(),alipayNotify.getSign_type(),alipayNotify.getIs_total_fee_adjust(),alipayNotify.getSubject(),parameter_num});
        if (count < 1) {
            is_success = false;
        }
        return is_success;
    }
    //微信用户注册
    public int createWxUser(final User user){
        KeyHolder keyHolder = new GeneratedKeyHolder();
        int autoIncId = 0;

        jdbcTemplateObject.update(new PreparedStatementCreator() {

            public PreparedStatement createPreparedStatement(Connection con)
                    throws SQLException {
                String sql="insert into pc_wx_user(user_name,user_avatar,user_wx_token,user_wx_unionid,user_sex,user_enabled,user_create_time,user_last_login) values(?,?,?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
                ps.setString(1,user.getUser_nickname());
                ps.setString(2,user.getUser_avatar());
                ps.setString(3, user.getUser_token());
                ps.setString(4, user.getUser_unionid());
                ps.setInt(5, user.getSex());
                ps.setInt(6,1);
                ps.setString(7,Utils.getCurrentTime());
                ps.setString(8,Utils.getCurrentTime());
                return ps;
            }
        }, keyHolder);

        autoIncId = keyHolder.getKey().intValue();
        return autoIncId;
    }
    //查询所有用户
    public List<User> getWxUser(String where ){
        String SQL="select * from pc_wx_user " +where;
        List<User> userList=jdbcTemplateObject.query(SQL,new UserMapper());
        return userList;
    }
    //得到同一手机号2个小时之内发送验证码次数
    public int getSendCodeTimes(String mobile) {
        String sql = "SELECT count(*)total FROM pc_sms_code where mobile=? and create_time>'" + Utils.getCurrentTimeSubOrAdd(-120) + "'";
        //int count=jdbcTemplateObject.queryForInt(sql);
        Map<String, Object> now = jdbcTemplateObject.queryForMap(sql, new Object[]{mobile});
        int total = Integer.parseInt(String.valueOf((long) now.get("total")));
        return total;
    }
    public void createSMS(String mobile, String code) {
        String SQL = "insert into pc_sms_code(mobile,code,create_time) VALUES (?,?,?)";
        jdbcTemplateObject.update(SQL, new Object[]{mobile, code, Utils.getCurrentTime()});
    }
    public List<Code> getSMS(String where) {
        String SQL = "SELECT * FROM pc_sms_code " + where + " ORDER BY create_time DESC ";
        List<Code> codeList = jdbcTemplateObject.query(SQL, new CodeMapper());
        return codeList;
    }
    public int createPCHDeparture(final DepartureInfo departureInfo) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        int autoIncId = 0;

        jdbcTemplateObject.update(new PreparedStatementCreator() {

            public PreparedStatement createPreparedStatement(Connection con)
                    throws SQLException {
                String sql = "insert into pch_publish_info(mobile,start_time,end_time,departure_city,destination_city,init_seats,create_time,is_enable,points,description,departure,destination,tag_yes_content,driving_name,car_brand,info_status,tag_no_content,user_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
                ps.setString(1, departureInfo.getMobile());
                ps.setString(2, departureInfo.getStart_time());
                ps.setString(3, departureInfo.getEnd_time());
                ps.setString(4, departureInfo.getDeparture_city());
                ps.setString(5, departureInfo.getDestination_city());
                ps.setInt(6, departureInfo.getInit_seats());
                ps.setString(7, Utils.getCurrentTime());
                ps.setInt(8, 1);
                ps.setString(9, departureInfo.getPoints());
                ps.setString(10, departureInfo.getDescription());
                ps.setString(11, departureInfo.getDeparture_county());
                ps.setString(12, departureInfo.getDestination());
                ps.setString(13, departureInfo.getTag_yes_content());
                ps.setString(14, departureInfo.getDriving_name());
                ps.setString(15, departureInfo.getCar_brand());
                ps.setInt(16, 1);
                ps.setString(17, departureInfo.getTag_no_content());
                ps.setInt(18,departureInfo.getUser_id());
                return ps;
            }
        }, keyHolder);

        autoIncId = keyHolder.getKey().intValue();
        return autoIncId;
    }
    //创建乘客订单
    public boolean createPassengerOrder(PassengerOrder passengerOrder) {
        boolean is_success = true;
        String SQL = "insert into pc_wx_passenger_orders(user_id,order_id,booking_seats,boarding_point,breakout_point,description,status,create_time) VALUES (?,?,?,?,?,?,?,?)";
        int count = jdbcTemplateObject.update(SQL, new Object[]{passengerOrder.getUser_id(), passengerOrder.getDriver_order_id(),passengerOrder.getSeats(), passengerOrder.getBoarding_point(), passengerOrder.getBreakout_ponit(),passengerOrder.getDescription(),1,Utils.getCurrentTime()});
        if (count < 1) {
            is_success = false;
        }
        return is_success;
    }
}

