package com.cyparty.laihui.utilities;

/**
 * Created by zhu on 2016/12/27.
 */
public class PayConfigUtils {
    private final static String private_key="MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAI0xX2Lm5QIoyFow/5VVa/4vmllpj3zSa0vzWN5XkAWl5VHEoPHx1cIFDSGgkQRgbCWLtTnQGaldftxxz9t8t/xZaA1epFsazeBadC5pdDivH1svpKa+F8SjE+XYG79UzClgC40NZ18CUw133hHFoxHMxDxNra2Nl9KGPT6UFIBlAgMBAAECgYBP4go8s7QH17kbRjOkctMJ2jbytYWoMojgTMsP6OykNWscKyqAGLo+7oqyZt0FY+RsDbI4BmQubaZz5LScUuDovnhl374UTmptn2ZJMlqX7nbxF471dp1ms5bVcoPFe4p44adpFdxT5Oa4OFRqlbzzNqBp2A3ZSyr2k0obushyYQJBAM5AYR0SVhbfhol7zAuYQO/2EI313sLjqeAB+LtSjqtYNXalamwMYcqcia02WwQy7n90Wi78T21o0rWks1Vhzg0CQQCvP8CUwJL5w1Zp6Yd8aWQWMHfQ4uFEbiAEIZy9DtbmB89KhJyzgO+pxAaD1ael8SEFByM63vQcqSLNrzsdo725AkBx7Zv3PA6z2cruHKUMbpDIPCrOz9a53poSc+RaTPMj8LivjhXoEzrdeXSPamwCOMQHQVUjiRmyvOlPjufErR7tAkAKSM1+bUayzZnWoVPII08yVinR4l6h62yJkYdnOOW3niG2F84yYpCt/8j6F6G9BUeQyfhxTgA5ZluagnwPozpRAkBYo3jw7mAbo/mIgmlJWbLo7rhjzH8dR1FlifGx13sdiDz/zG/cPpSs/iqdF4JmZ319ZIq86gRGamfcgFn82fq5";
    private final static String alipay_public_key="MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB";
    private final static String app_id="2016072001643878";
    private final static String wx_app_id="wx6527ab831ef9f8f0";
    private final static String wx_mch_id="1409441702";
    private final static String wx_app_secret_key="eo2MwtDcK6y3HaWzkbTpMvW8tMMxIbo4";

   /* private final static String wx_pay_notify_url="http://laihui.cyparty.com/wx_pay/notify";//运行环境
    private final static String alipay_notify_url="http://laihui.cyparty.com/alipay/notify";*/

    private final static String wx_pay_notify_url="http://laihuiwx.cyparty.com/wx_pay/notify";//测试环境
    private final static String alipay_notify_url="http://laihuiwx.cyparty.com/alipay/notify";

   /* //测试通知地址
    private final static String wx_pay_notify_url="http://laihuiapi.cyparty.com/wx_pay/notify";
    private final static String alipay_notify_url="http://laihuiapi.cyparty.com/alipay/notify";*/

    public static String getWx_app_id() {
        return wx_app_id;
    }

    public static String getAlipay_public_key() {
        return alipay_public_key;
    }

    public static String getWx_mch_id() {
        return wx_mch_id;
    }

    public static String getWx_app_secret_key() {
        return wx_app_secret_key;
    }

    public static String getApp_id() {
        return app_id;
    }

    public static String getPrivate_key() {
        return private_key;
    }

    public static String getWx_pay_notify_url() {
        return wx_pay_notify_url;
    }

    public static String getAlipay_notify_url() {
        return alipay_notify_url;
    }
}
