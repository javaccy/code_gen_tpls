package com.yun.yun_gov.busi.controller;

import com.google.common.collect.Lists;
import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.Page;
import com.yun.yun_gov.common.base.BaseController;
import org.apache.commons.lang3.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * ${tableComment}
 */
public class ${name}Controller extends BaseController {

    private void resolvers(){
        //todo 这只是一个例子请删除
        Kv kv = Kv.by("0", "否").set("1", "是");
        setAttr("resolvers", kv);
    }


    /**
     * 跳转到列表页面
     */
    public void page(){
        render("${tableName}_list.html");
    }

    /**
     * 列表页面数据
     */
    public void pageJson(){
        String param = getPara("param");
        List<Object> params = Lists.newArrayList();
        String sql = "from " + ${name}.getTableName() + " ${tableAlias} where true ";
        if (StringUtils.isNotBlank(param)) {
        sql += " and ac.name like '%" + param + "%'";
        }

        Page<${name}> page = ${name}.dao.paginate(getPageNumber(), getPageSize(), "select * ", sql, params.toArray());
        renderPage(page);
    }

    /**
     * 添加${tableComment}
     */
    public void add(){
        if ("get".equalsIgnoreCase(getRequest().getMethod())) {
            render("${tableName}_edit.html");
        } else {
            ${name} ${tableAlias} = getModel(${name}.class, "", true);
            ${tableAlias}.setCreateTime(new Date());
            ${tableAlias}.save();
            renderSuccess();
        }
    }

    /**
     * 修改${tableComment}
     */
    public void edit() {
        if ("get".equalsIgnoreCase(getRequest().getMethod())) {
            String id = requirePara("id");
            ${name} ${tableAlias} = ${name}.dao.findById(id);
            setAttr("o", ${tableAlias});
            render("${tableName}_edit.html");
        } else {
            ${name} ${tableAlias} = getModel(${name}.class, "", true);
            ac.update();
            renderSuccess();
        }
    }

    /**
     * 删除${tableComment}
     */
    public void del(){
        String id = requirePara("id");
        ${name} ${tableAlias} = ${name}.dao.findById(id);
        ac.delete();
        renderSuccess();
    }

}
