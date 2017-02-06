package com.cyparty.laihui.db;


import com.cyparty.laihui.domain.*;
import com.cyparty.laihui.mapper.*;
import com.cyparty.laihui.utilities.Utils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
    public List<AppDepartureInfo> getAppDriverDpartureInfo(String where) {
        String SQL = "select * from laihui_pc.pc_driver_publish_info a  left join laihui_pc.pc_user b on a.mobile=b.user_mobile "+ where ;
        List<AppDepartureInfo> appDriverDepartureInfoMapperList = jdbcTemplateObject.query(SQL, new APPDriverDepartureInfoMapper());
        return appDriverDepartureInfoMapperList;
    }
    public int getCount(String table,String where) {
        String sql = "SELECT count(*)total FROM  "+table +" "+ where;
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
    public boolean delete(String table_name, String where) {
        boolean is_success = true;
        String SQL = "DELETE  FROM " + table_name + where;
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
    //微信用户注册
    public int createWxUser(final User user){
        KeyHolder keyHolder = new GeneratedKeyHolder();
        int autoIncId = 0;

        jdbcTemplateObject.update(new PreparedStatementCreator() {

            public PreparedStatement createPreparedStatement(Connection con)
                    throws SQLException {
                String sql="insert into pc_wx_user(user_name,user_avatar,user_wx_token,user_wx_unionid,user_sex,user_enabled,user_create_time,user_last_login,user_wx_openid,is_driver,is_passenger) values(?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
                ps.setString(1,user.getUser_nickname());
                ps.setString(2,user.getUser_avatar());
                ps.setString(3, user.getUser_token());
                ps.setString(4, user.getUser_unionid());
                ps.setInt(5, user.getSex());
                ps.setInt(6,1);
                ps.setString(7,Utils.getCurrentTime());
                ps.setString(8,Utils.getCurrentTime());
                ps.setString(9,user.getOpenid());
                ps.setInt(10,0);
                ps.setInt(11,0);
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
                String sql = "insert into pch_publish_info(mobile,start_time,end_time,departure_city,destination_city,init_seats,create_time,is_enable,points,description,departure,destination,tag_yes_content,driving_name,car_brand,info_status,tag_no_content,user_id,info_source,current_seats,price,origin_price) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
                ps.setInt(19,1);//来源微信
                ps.setInt(20,departureInfo.getInit_seats());
                ps.setDouble(21,departureInfo.getPrice());
                ps.setDouble(22,departureInfo.getOrigin_price());
                return ps;
            }
        }, keyHolder);

        autoIncId = keyHolder.getKey().intValue();
        return autoIncId;
    }
    public void deleteUserAction(int order_id,  String mobile,int now_status) {
        String SQL = "call delete_user_role_action";
        String where = "("+order_id+",'"+mobile+"',"+now_status+")";
        SQL = SQL + where;
        jdbcTemplateObject.execute(SQL);
    }
    //创建乘客订单
    public boolean createPassengerOrder(PassengerOrder passengerOrder) {
        boolean is_success = true;
        String SQL = "insert into pc_wx_passenger_orders(user_id,order_id,booking_seats,boarding_point,breakout_point,description,order_type,create_time,order_source,departure_city,destination_city,departure_time,mobile) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int count = jdbcTemplateObject.update(SQL, new Object[]{passengerOrder.getUser_id(), passengerOrder.getDriver_order_id(),passengerOrder.getSeats(), passengerOrder.getBoarding_point(), passengerOrder.getBreakout_ponit(),passengerOrder.getDescription(),0,Utils.getCurrentTime(),0,passengerOrder.getDeparture_city(),passengerOrder.getDestination_city(),passengerOrder.getDeparture_time(),passengerOrder.getMobile()});
        if (count < 1) {
            is_success = false;
        }
        return is_success;
    }
    public int getMaxPassengerPublishInfo() {
        String sql = "SELECT Max(_id)id FROM  pch_passenger_publish_info" ;
        //int count=jdbcTemplateObject.queryForInt(sql);
        Map<String, Object> now = jdbcTemplateObject.queryForMap(sql);
        int id = Integer.parseInt(String.valueOf((long) now.get("id")));
        return id;
    }
    public List<RoutePoint> getRoutePoint(String where) {
        String SQL = "SELECT * FROM pc_route_points " + where;
        List<RoutePoint> routeInfoList = jdbcTemplateObject.query(SQL, new RoutePointMapper());
        return routeInfoList;
    }
    //创建乘客发车单
    public boolean createPassengerPublishInfo(PassengerOrder passengerOrder) {
        boolean is_success = true;
        String SQL = "insert into pch_passenger_publish_info(user_id,departure_city,destination_city,booking_seats,boarding_point,breakout_point,description,start_time,end_time,user_name,user_mobile,create_time) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        int count = jdbcTemplateObject.update(SQL, new Object[]{passengerOrder.getUser_id(), passengerOrder.getDeparture_city(),passengerOrder.getDestination_city(),passengerOrder.getSeats(), passengerOrder.getBoarding_point(), passengerOrder.getBreakout_ponit(),passengerOrder.getDescription(),passengerOrder.getStart_time(),passengerOrder.getEnd_time(),passengerOrder.getName(),passengerOrder.getMobile(),Utils.getCurrentTime()});
        if (count < 1) {
            is_success = false;
        }
        return is_success;
    }
    public List<PassengerOrder> getPassengerPublishInfo(String where) {
        String SQL = "SELECT * FROM pch_passenger_publish_info " + where ;
        List<PassengerOrder> passengerOrders = jdbcTemplateObject.query(SQL, new PassengerPublishInfoMapper());
        return passengerOrders;
    }
    public List<PassengerOrder> getPassengerOrder(String where) {
        String SQL = "SELECT * FROM pc_wx_passenger_orders " + where ;
        List<PassengerOrder> passengerOrders = jdbcTemplateObject.query(SQL, new PassengerOrdersMapper());
        return passengerOrders;
    }
    public List<Tag> getTags(String where) {
        String SQL = "SELECT * FROM pc_departure_tags " + where;
        List<Tag> tags = jdbcTemplateObject.query(SQL, new TagMapper());
        return tags;
    }
    public boolean createUserAction(UserRoleAction user) {
        boolean is_success = true;

        String SQL = "insert into pc_user_role_action(driver_order_id,passenger_order_id,order_type,user_mobile,create_time,order_source,booking_order_id) VALUES (?,?,?,?,?,?,?)";
        int count = jdbcTemplateObject.update(SQL, new Object[]{user.getDriver_order_id(), user.getPassenger_order_id(), user.getOrder_type(), user.getUser_mobile(), Utils.getCurrentTime(), user.getOrder_source(),user.getBooking_order_id()});
        if(count<1){
            is_success=false;
        }
        return is_success;
    }

    public boolean createRoutePoint(List<RoutePoint> pointList) {
        boolean is_success = true;
        for (RoutePoint point : pointList) {
            String SQL = "insert into pc_route_points(route_id,point_name,point_location,point_uid,point_address,point_district,point_create_time,point_seq) VALUES (?,?,?,?,?,?,?,?)";
            int count = jdbcTemplateObject.update(SQL, new Object[]{point.getRoute_id(), point.getPoint_name(), point.getPoint_location(), point.getPoint_uid(), point.getPoint_address(), point.getPoint_district(), Utils.getCurrentTime(), point.getPoint_seq()});
            if (count < 1) {
                is_success = false;
            }
        }
        return is_success;
    }
    public int getMaxID(String parameter,String table) {
        String sql = "SELECT Max("+parameter+")id FROM  "+table ;
        Integer id=jdbcTemplateObject.queryForObject(sql, Integer.class);
        return id.intValue();
    }
    public boolean createPayLog(PayLog pay) {
        boolean is_success = true;
        String SQL = "insert into pay_cash_log(user_id,cash,create_time,action_type,pay_type,order_status,pay_account) VALUES (?,?,?,?,?,?,?)";
        int count = jdbcTemplateObject.update(SQL, new Object[]{pay.getUser_id(),pay.getCash(), Utils.getCurrentTime(),1,pay.getPay_type(),0,pay.getPay_account()});
        if (count < 1) {
            is_success = false;
        }
        return is_success;
    }
    //得到支付信息
    public List<PayLog> getPayLog(String where) {
        String SQL = "SELECT * FROM pay_cash_log " + where ;
        List<PayLog> payLogList = jdbcTemplateObject.query(SQL, new PayLogMapper());
        return payLogList;
    }
    //得到支付信息
    public List<PayLog> getPayLogInfo(String where) {
        String SQL = "SELECT departure_time,cash,user_mobile from  pay_cash_log " + where ;
        List<PayLog> payLogList = jdbcTemplateObject.query(SQL, new RowMapper<PayLog>() {
            @Override
            public PayLog mapRow(ResultSet resultSet, int i) throws SQLException {
                PayLog pay=new PayLog();
                pay.setTotal_cash(resultSet.getDouble("cash"));
                String time=Utils.checkTime(resultSet.getString("departure_time"));
                pay.setDeparture_time(Utils.getTimeDate(time));
                String mobile=resultSet.getString("be_popularized_mobile");
                String now_mobile=mobile;
                if(mobile.length()==11){
                    mobile=mobile.substring(0,3)+"****"+now_mobile.substring(now_mobile.length()-4);
                }
                pay.setUser_mobile(mobile);
                return pay;
            }
        });
        return payLogList;
    }
    //得到token对应的id
    public int getIDByToken(String token) {
        String SQL = "SELECT user_id from pc_user_token where token=?";
        List<UserToken> userTokenList =jdbcTemplateObject.query(SQL,new Object[]{token}, new UserIDMapper());
        int id=0;
        if(userTokenList.size()>0){
            id=userTokenList.get(0).getUser_id();
        }
        return id;
    }

    public boolean createCampaign(Campaign campaign) {
        boolean is_success = true;

        String SQL = "insert into pc_campaign(user_id,be_popularized_mobile,create_time,is_reg) VALUES (?,?,?,?)";
        int count = jdbcTemplateObject.update(SQL, new Object[]{campaign.getUser_id(), campaign.getBe_popularized_mobile(), Utils.getCurrentTime(), 0});
        if (count < 1) {
            is_success = false;
        }

        return is_success;
    }

    public List<Campaign> getCampaign(String where) {
        String SQL = "SELECT * FROM pc_campaign " + where;
        List<Campaign> campaignList = jdbcTemplateObject.query(SQL, new CampaignMapper());
        return campaignList;
    }


    //得到支付信息
    public List<PayLog> getPayInfo(String where) {
        String SQL = "SELECT * FROM pay_cash_log " + where ;
        List<PayLog> payLogList = jdbcTemplateObject.query(SQL, new RowMapper<PayLog>() {
            @Override
            public PayLog mapRow(ResultSet resultSet, int i) throws SQLException {
                PayLog payLog=new PayLog();
                payLog.setCash(resultSet.getDouble("cash"));
                payLog.setCreate_time(Utils.checkTime(resultSet.getString("create_time")));
                payLog.setTrade_no(resultSet.getString("trade_no"));
                return payLog;
            }
        });
        return payLogList;
    }
    public boolean createPayBack(PayBack pay) {
        boolean is_success = true;
        String SQL = "insert into pc_application_pay_back(order_id,user_id,pay_type,pay_account,pay_reason,create_time,pay_status,pay_cash) VALUES (?,?,?,?,?,?,?,?)";
        int count = jdbcTemplateObject.update(SQL, new Object[]{pay.getOrder_id(), pay.getUser_id(), pay.getPay_type(), pay.getPay_account(),pay.getPay_reason(), Utils.getCurrentTime(),0,pay.getPay_cash()});
        if (count < 1) {
            is_success = false;
        }
        return is_success;
    }
    //创建用户
    public List<AppUser> getUserList(String where) {
        String SQL = "SELECT * FROM pc_user "+where ;
        List<AppUser> userList = jdbcTemplateObject.query(SQL, new AppUserMapper());
        return userList;
    }
    public List<Order> getOrderReview(String where,int type) {
        String SQL = "SELECT * FROM pc_orders " + where;
        List<Order> orders =new ArrayList<>();
        switch (type){
            case 0: //不关联表
                orders=jdbcTemplateObject.query(SQL, new OrderMapper());
                break;
            case 1:
                orders=jdbcTemplateObject.query(SQL, new RowMapper<Order>() {
                    @Override
                    public Order mapRow(ResultSet resultSet, int i) throws SQLException {
                        Order order=new Order();

                        order.set_id(resultSet.getInt("a._id"));
                        order.setOrder_id(resultSet.getInt("order_id"));
                        order.setUser_id(resultSet.getInt("user_id"));
                        order.setOrder_status(resultSet.getInt("order_status"));
                        order.setUpdate_time(Utils.checkTime(resultSet.getString("update_time")));
                        order.setCreate_time(Utils.checkTime(resultSet.getString("create_time")));
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
                        order.setUser_name(name);
                        order.setUser_mobile(Utils.checkNull(resultSet.getString("user_mobile")));
                        order.setUser_avatar(Utils.checkNull(resultSet.getString("user_avatar")));
                        return order;
                    }
                });
                break;
            default:
                break;
        }

        return orders;
    }
    public List<PassengerOrder> getPassengerDepartureInfo(String where) {
        String SQL = "SELECT * FROM pc_passenger_publish_info a left join pc_user b on a.user_id=b._id " + where;
        List<PassengerOrder> passengerPublishInfoList = jdbcTemplateObject.query(SQL, new PassengerPublishInfoMapper());
        return passengerPublishInfoList;
    }
}

