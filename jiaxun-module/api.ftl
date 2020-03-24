package com.jiaxun.tsf.${tableName}.provider.api;

import com.jiaxun.tsf.${tableName}.provider.vo.${name}VO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author ${author} E-mail:${funs.prop("email")}
 * @version 创建时间：${tpl.date}
 */
@FeignClient(name = "${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}-provider",path = "/${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}")
public interface ${name}Api {

    @GetMapping(value = "/getById")
    ${name}VO get${name}ById(@RequestParam(value = "id")String id);

}
