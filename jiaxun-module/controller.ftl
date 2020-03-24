package com.jiaxun.tsf.${tableName}.provider.controller;

import com.jiaxun.tsf.common.provider.base.BaseController;
import com.jiaxun.tsf.${tableName}.provider.api.${name}Api;
import com.jiaxun.tsf.${tableName}.provider.vo.${name}VO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ${author} E-mail:${funs.prop("email")}
 * @version 创建时间：${tpl.date}
 */
@RestController
@RequestMapping(value = "/${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}")
public class ${name}Controller extends BaseController implements ${name}Api {

    @Override
    public ${name}VO get${name}ById(@RequestParam(value = "id")String id) {
        return new ${name}VO();
    }

}
