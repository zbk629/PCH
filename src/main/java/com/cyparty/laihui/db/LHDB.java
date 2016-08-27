package com.cyparty.laihui.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by zhu on 2015/12/29.
 */
public class LHDB {
    public static Connection connection = null;
    public static int times = 0;
    //驱动程序名//不固定，根据驱动
    public static String driver = "com.mysql.jdbc.Driver";
    // URL指向要访问的数据库名******
    public static String url = "jdbc:mysql://rdska466r2fvvzh5vr7gb.mysql.rds.aliyuncs.com:3306/cyparty_pc";
    // MySQL配置时的用户名
    public static String user = "cyparty_pc";
    // Java连接MySQL配置时的密码******
    public static String password = "Cyparty2016";

    public static Connection getBizDB() {
        if (connection == null) {
            try {
                // 加载驱动程序
                Class.forName(driver);
                // 连续数据库
                connection = DriverManager.getConnection(url, user, password);

                if (!connection.isClosed()) {
//                    System.out.println("成功连接至数据库");
                }

            } catch (Exception e) {
                System.out.println("获取数据库链接发生错误：" + e.getMessage());
            }
        }
        return connection;
    }

    public static void closeBizConnection() {
        if (connection != null) {
            try {
                if (!connection.isClosed()) {
                    connection.close();
                }

            } catch (Exception e) {
                System.out.println("关闭数据库发生错误：" + e.getMessage());
            } finally {
                connection = null;
//                System.out.println("成功关闭数据库");
            }
        }
    }

    //
    public static synchronized void transactionDemo(String order_id) {
        Connection conn=getBizDB();
        if(conn!=null){
            try {
                //调用存储过程
               /* CallableStatement call=conn.prepareCall("{call update_is_must_departure}");
                call.execute();*/

                boolean is_success=true;
                conn.setAutoCommit(false);
                //操作1
                //String update_sql="UPDATE now_new set new_name=? where id=?";
                String update_order_sql="update pc_pay_order set order_status=1 where pay_order_id=?";
                PreparedStatement ps=conn.prepareStatement(update_order_sql);
                ps.setString(1,update_order_sql);

                int count=ps.executeUpdate();
                if(count<1){
                    is_success=false;
                }

                //操作2
                String update_sql="update pc_driver_publish_info set is_must_departure=1 where _id=?";
                conn.prepareStatement(update_sql);
                int id=Integer.parseInt(order_id.substring(17));
                ps.setInt(1,id);
                count=ps.executeUpdate();
                if(count<1){
                    is_success=false;
                }

                //得到最终执行结果
                if(is_success){
                    conn.commit();
                }else {
                    conn.rollback();
                }
            } catch (SQLException e) {
                try {
                    conn.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
                e.printStackTrace();
            } finally {
                closeBizConnection();

            }
        }
    }
    public static void main(String[] args) {

        //transactionDemo();
    }
}
