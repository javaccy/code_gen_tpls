package com.yyz.store.controller;

import com.google.common.collect.Lists;
import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.yyz.commons.web.base.BaseController;
import com.yyz.company.service.entity.sys.SysUser;
import com.yyz.store.support.auth.AuthUtils;
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
        List<Object> params = Lists.newArrayList();
        String where =  "";
        where = append(where, params, "${tableAlias}.user_name ", getPara("param"), "like");
        Page<Record> page = ${name?uncap_first}Service.findPage(getPager(), params, where," ${tableAlias}.id desc ");
        renderPage(page);
    }



    public void pageExport(){
        SysUser user = AuthUtils.getLoginUser();
        List<Object> params = Lists.newArrayList();
        String where =  " from ${tableAlias} where ture";
        where = append(where, params, "${tableAlias}.user_name ",getPara("param"), "like");
        String s = "select ${tableAlias}.* ";
        JExcelExorter.DefaultDatasource ds = new JExcelExorter.DefaultDatasource(DB.useBusi(), getPageNumber(),getPageSize(), s, where, params.toArray()) {
            @Override
            public void format(Page<Record> page) {
                replaceUrl(page.getList(), "image");
            }
        };
        Boolean excel = getParaToBoolean("excel", false);
        if (excel) {
            String[] headers = {"${titles?join('","')}"};
            String[] columns = {"${columns?join('","')}"};
            XPoiRender render = XPoiRender.csv(ds, Charset.forName("utf-8")).fileName("${name}列表.csv").headers(headers).columns(columns);
            render(render);
        } else {
            Page<Record> page = DB.useBusi().paginate(getPageNumber(), getPageSize(), s, where, params.toArray());
            ds.format(page);
            renderPage(page);
        }
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
        <#if functions.containsColumn("company_id")>
        ${name} old = ${name?uncap_first}Service.findById(id, user);
        <#else>
        ${name} old = ${name?uncap_first}Service.findById(id);
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
        SysUser user = AuthUtils.getLoginUser();
        String id = requirePara("id");
        <#if functions.containsColumn("company_id")>
        ${name} ${tableAlias} = ${name}.dao.findById(id,user);
        <#else>
        ${name} ${tableAlias} = ${name}.dao.findById(id);
        </#if>
        ${tableAlias}.delete();
        renderSuccess();
    }

}
