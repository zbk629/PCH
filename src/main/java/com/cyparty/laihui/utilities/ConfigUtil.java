package com.cyparty.laihui.utilities;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by zhu on 2016/7/22.
 */
public class ConfigUtil {
    private static boolean is_debug=true;
    private static boolean stateChecked=false;
    /***程序初始化时根据配置文件，对id_debug进行重设**/
    public static boolean getDebugState()
    {
        if(stateChecked)
        {
            return is_debug;
        }
        else
        {
            ApplicationContext context = new ClassPathXmlApplicationContext("DebugStatusConfig-context.xml");
            DebugStatusConfig statusConfig=(DebugStatusConfig)context.getBean("is_debug");
            is_debug= statusConfig.getStatus();
            stateChecked=true;
            return is_debug;
        }
    }

    public static void main(String[] args) {
        getDebugState();
    }
}
