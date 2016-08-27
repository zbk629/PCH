package com.cyparty.laihui.domain;

/**
 * Created by zhu on 2016/3/4.
 */
public class User {
    private int user_id=0;

    private String user_mobile;
    private String user_token;
    private int user_privilege;
    private String user_unionid;
    private String user_created;
    private String user_last_login;
    private String user_credential_updated;
    private int user_enabled;
    private String user_nickname;
    private String user_avatar;
    private int sex;

    public int getUser_privilege() {
        return user_privilege;
    }

    public void setUser_privilege(int user_privilege) {
        this.user_privilege = user_privilege;
    }

    public String getUser_last_login() {
        return user_last_login;
    }

    public void setUser_last_login(String user_last_login) {
        this.user_last_login = user_last_login;
    }

    public String getUser_mobile() {
        return user_mobile;
    }

    public void setUser_mobile(String user_mobile) {
        this.user_mobile = user_mobile;
    }


    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getUser_nickname() {
        return user_nickname;
    }

    public void setUser_nickname(String user_nickname) {
        this.user_nickname = user_nickname;
    }

    public String getUser_avatar() {
        return user_avatar;
    }

    public void setUser_avatar(String user_avatar) {
        this.user_avatar = user_avatar;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_created() {
        return user_created;
    }

    public void setUser_created(String user_created) {
        this.user_created = user_created;
    }

    public String getUser_credential_updated() {
        return user_credential_updated;
    }

    public void setUser_credential_updated(String user_credential_updated) {
        this.user_credential_updated = user_credential_updated;
    }

    public String getUser_token() {
        return user_token;
    }

    public void setUser_token(String user_token) {
        this.user_token = user_token;
    }

    public String getUser_unionid() {
        return user_unionid;
    }

    public void setUser_unionid(String user_unionid) {
        this.user_unionid = user_unionid;
    }

    public int getUser_enabled() {
        return user_enabled;
    }

    public void setUser_enabled(int user_enabled) {
        this.user_enabled = user_enabled;
    }
}
