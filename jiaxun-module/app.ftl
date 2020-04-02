package com.jiaxun.tsf;

import com.jiaxun.tsf.common.provider.config.BaseConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.annotation.MapperScans;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.tsf.annotation.EnableTsf;


/**
 * @author ${author} E-mail:${funs.prop("email")}
 * @version 创建时间：${tpl.date}
 *
 */
@MapperScans(value = {@MapperScan(value = "com.jiaxun")})
@SpringBootApplication
@EnableFeignClients
@EnableTsf
public class ${name}ProviderApplication extends BaseConfig {

    public static void main(String[] args){
        SpringApplication.run(${name}ProviderApplication.class, args);
    }


}
