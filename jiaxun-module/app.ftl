package com.jiaxun.tsf;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.tsf.annotation.EnableTsf;


/**
 * @author ${author} E-mail:${funs.prop("email")}
 * @version 创建时间：${tpl.date}
 *
 */
@SpringBootApplication
@EnableFeignClients
@EnableTsf
public class ${name}ProviderApplication {

    public static void main(String[] args){
        SpringApplication.run(${name}ProviderApplication.class, args);
    }


}
