package com.yun.controller;

import com.google.common.collect.Lists;
import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.yun.model.${name};
import com.zcurd.common.Pager;
import com.zcurd.controller.BaseController;
import com.zcurd.model.SysUser;

import java.util.Date;
import java.util.List;

/**
 * ${tableComment!'没有注释'}
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
        SysUser user = getSessionUser();
        String param = getPara("param");
        List<Object> params = Lists.newArrayList();
        String where =  " from ${tableName} ${tableAlias} where true ";
        where = append(where, params, "${tableAlias}.user_name ", param, "like");
        Pager p = getPager();
        int pageNumber =p.getStartRow();
        int pageSize = p.getRows();
        Page<Record> page = Db.use("zcurd_busi").paginate(pageNumber, pageSize, "select * ", where + " ${tableAlias}.id desc ", params.toArray());
        renderPage(page);
    }


    /**
     * 添加${tableComment}
     */
    public void add(){
        SysUser user = getSessionUser();
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
        SysUser user = getSessionUser();
        String id = getPara("id");
        <#if functions.containsColumn("company_id")>
        ${name} old = ${name}.dao.findByIdAndUser(id, user);
        <#else>
        ${name} old = ${name}.dao.findById(id);
        </#if>
        if ("get".equalsIgnoreCase(getRequest().getMethod())) {
            setAttr("o",old);
            render("${tableName}_edit.html");
        } else {
            ${name} ${tableAlias} = getModel(${name}.class, "", true);
            <#list fields as f>
            old.set${f.name?cap_first}(${tableAlias}.get${f.name?cap_first}());
            </#list>
            old.update();
            renderSuccess();
        }
    }

    /**
     * 删除${tableComment}
     */
    public void del(){
        SysUser user = getSessionUser();
        String id = getPara("id");
        <#if functions.containsColumn("company_id")>
        ${name} ${tableAlias} = ${name}.dao.findByIdAndUser(id,user);
        <#else>
        ${name} ${tableAlias} = ${name}.dao.findById(id);
        </#if>
        ${tableAlias}.delete();
        renderSuccess();
    }

}
