package com.cyparty.laihui.utilities;

public class OssConfigure {
    private String endpoint;
    private String accessKeyId;
    private String accessKeySecret;
    private String bucketName;
    private String accessUrl;
    public void setEndpoint(String endpoint) {
        this.endpoint = endpoint;
    }

    public void setAccessKeyId(String accessKeyId) {
        this.accessKeyId = accessKeyId;
    }

    public void setAccessKeySecret(String accessKeySecret) {
        this.accessKeySecret = accessKeySecret;
    }

    public void setBucketName(String bucketName) {
        this.bucketName = bucketName;
    }

    public void setAccessUrl(String accessUrl) {
        this.accessUrl = accessUrl;
    }

    public String getEndpoint() {
        return endpoint;
    }

    public String getAccessKeyId() {
        return accessKeyId;
    }

    public String getAccessKeySecret() {
        return accessKeySecret;
    }
    public String getBucketName() {
        return bucketName;
    }
    public String getAccessUrl() {
        return accessUrl;
    }
}
