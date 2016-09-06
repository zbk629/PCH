package com.cyparty.laihui.utilities;

import com.alibaba.fastjson.JSONObject;
import net.spy.memcached.AddrUtil;
import net.spy.memcached.BinaryConnectionFactory;
import net.spy.memcached.MemcachedClient;
import net.spy.memcached.internal.OperationFuture;

public class Memcache {
    private static MemcachedClient cache=null;
    public static MemcachedClient getCache()
    {
        final String host = "bf94915901174fa4.m.cnbjalinu16pub001.ocs.aliyuncs.com"; //控制台上的“内网地址”
        final String port = "11211"; //默认端口 11211，不用改
        if(cache==null)
        {
            try {
                cache = new MemcachedClient(new BinaryConnectionFactory(), AddrUtil.getAddresses(host + ":" + port));
            }
            catch (Exception e)
            {
                cache=null;
                System.out.println("getCache Error:"+e.getMessage());
            }
        }
        return cache;
    }
    public static JSONObject getMemcache(String where){
        JSONObject result=new JSONObject();
        try {
            MemcachedClient cacheClient=getCache();
            if (cacheClient.get(where)==null){
                result.put("status","0");
                return result;
            }else {
                return (JSONObject)cacheClient.get(where);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        result.put("status","0");
        return result;
    }

    public static void setMemcache(String where,JSONObject resultObject) {

        MemcachedClient cacheClient = null;
        try {

            cacheClient = getCache();


            //向OCS中存一个key为"ocs"的数据，便于后面验证读取数据
            String key = where;
            JSONObject value =resultObject;
            int expireTime = 60*60*24*10; // 过期时间10day，单位s; 从写入时刻开始计时，超过expireTime s后，该数据过期失效，无法再读出；
            OperationFuture future = cacheClient.set(key, expireTime, value);
            System.out.println("Set操作完成token为"+key);

            future.get(); //  确保之前(mc.set())操作已经结束
            //执行get操作，从缓存中读数据,读取key为"ocs"的数据
            System.out.println("Get操作:" + cache.get(key));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void setMemcache(String token,int id,int expireTime) {
        MemcachedClient cacheClient = null;
        try {
            cacheClient = getCache();
            //向OCS中存一个key为"ocs"的数据，便于后面验证读取数据
            String key = token;
            int value =id;
            if(expireTime<=0) {
                expireTime = 60 * 60 * 2; // 过期时间，单位s; 从写入时刻开始计时，超过expireTime s后，该数据过期失效，无法再读出；
            }
            OperationFuture future = cacheClient.set(key, expireTime, value);
            System.out.println("Set操作完成!链接为"+key);

            future.get(); //  确保之前(mc.set())操作已经结束

            //执行get操作，从缓存中读数据,读取key为"ocs"的数据
            System.out.println("Get操作:" + cache.get(key));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }//eof
}