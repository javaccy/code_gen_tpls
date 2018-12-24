package com.yyz.store.controller;

import com.google.common.collect.Lists;
import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.yyz.commons.web.base.BaseController;
import io.jboot.web.controller.annotation.RequestMapping;
import com.yyz.company.service.api.${name}Service;
import com.yyz.company.service.entity.valid.${name};

import javax.inject.Inject;
import java.util.Date;
import java.util.List;

/**
 * ${tableComment}
 */
@RequestMapping(value = "${tableName?replace('_','/')}")
public class ${name}Controller extends BaseController {

    @Inject
    private ${name}Service ${name?uncap_first}Service;

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
        SysUser user = AuthUtils.getLoginUser();
        String param = getPara("param");
        List<Object> params = Lists.newArrayList();
        String where =  "";
        where = append(where, params, "qpw.user_name ", param, "like");
        Page<Record> page = ${name?uncap_first}Service.findPage(getPager(), params, where);
        renderPage(page);
    }


    /**
     * 添加${tableComment}
     */
    public void add(){
        SysUser user = AuthUtils.getLoginUser();
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
        SysUser user = AuthUtils.getLoginUser();
        String id = requirePara("id");
        ${name} old = ${name?uncap_first}.findById(id, user);
        if ("get".equalsIgnoreCase(getRequest().getMethod())) {
            String id = requirePara("id");
            ${name} ${tableAlias} = ${name?uncap_first}Service.findById(id);
            setAttr("o",old);
            render("${tableName}_edit.html");
        } else {
            ${name} ${tableAlias} = getModel(${name}.class, "", true);
            old.setOpTime(${tableAlias}.getOpTime());
            old.update();
            renderSuccess();
        }
    }

    /**
     * 删除${tableComment}
     */
    public void del(){
        SysUser user = AuthUtils.getLoginUser();
        String id = requirePara("id");
        ${name} ${tableAlias} = ${name}.dao.findById(id);
        ${tableAlias}.delete();
        renderSuccess();
    }

}
