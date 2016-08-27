package com.cyparty.laihui.utilities;


import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.ObjectMetadata;
import com.aliyun.oss.model.PutObjectResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * Created by BangKui on 2015/9/24.
 */
@Component
public class OssUtil {
    @Autowired
    OssConfigure ossConfigure;

    private  String accessKeyId;
    private  String accessKeySecret;
    private  String endpoint;
    private  String bucketName;
    private OSSClient client ;

    public void setOssConfigure(OssConfigure ossConfigure)
    {
        this.ossConfigure=ossConfigure;
        this.accessKeyId = ossConfigure.getAccessKeyId();
        this.accessKeySecret = ossConfigure.getAccessKeySecret();
        this.endpoint = ossConfigure.getEndpoint();
        this.bucketName = ossConfigure.getBucketName();
        this.client = new OSSClient(endpoint, accessKeyId, accessKeySecret);

    }
    public  void uploadFile(HttpServletRequest request,String key, String filePath) throws FileNotFoundException
    {
        filePath=request.getSession().getServletContext().getRealPath("/resource/uploads")+filePath;
        File file = new File(filePath);
        if(!file.exists())
        {
            return;
        }
        InputStream content = new FileInputStream(file);
        ObjectMetadata meta = new ObjectMetadata();
        meta.setContentLength(file.length());
//        PutObjectResult result = client.putObject(bucketName, key, content, meta);
//        System.out.println(result.getETag());
    }
    public  Boolean uploadFileWithResult(HttpServletRequest request,String key, String filePath) throws FileNotFoundException
    {
        Boolean uploadOK=false;
        filePath=request.getSession().getServletContext().getRealPath("")+filePath;
        filePath=filePath.replace("/","\\").replace("\\\\","\\");
        File file = new File(filePath);
        if(file.exists()&&file.length()>100)
        {
            InputStream content = new FileInputStream(file);
            ObjectMetadata meta = new ObjectMetadata();
            meta.setContentLength(file.length());
            PutObjectResult result = client.putObject(bucketName, key, content, meta);
            if(result!=null&result.getETag().length()>0)
            {
                uploadOK=true;
            }
//            System.out.println(result.getETag());
        }
        return uploadOK;

    }
    public  void deleteFile(String key) {
        client.deleteObject(bucketName, key);
    }
}
