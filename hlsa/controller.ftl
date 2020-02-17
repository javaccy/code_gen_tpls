package ${functions.packageName('controller')};

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hlsa.common.utils.bean.BeanUtils;
import com.hlsa.common.utils.other.AjaxResult;
import com.hlsa.common.utils.other.StringUtils;
import com.hlsa.common.utils.other.TableDataInfo;
<#if funs.prop("mode") == 'api'>
import ${functions.packageName('feign')}.${name}${funs.fileSuffix("feign")};
import ${functions.packageName('DTOList')}.${name}${funs.fileSuffix("DTOList")};
import ${functions.packageName('DTOEdit')}.${name}${funs.fileSuffix("DTOEdit")};
</#if>
import ${functions.packageName('entity')}.${name};
import ${functions.packageName('service')}.I${name}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.hlsa.common.utils.other.BaseController;


import java.util.Date;
import java.util.List;

/**
 * <p>
 * ${tableComment} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Controller
<#if funs.prop("mode") == "api">
@RequestMapping(value = ${name}${funs.fileSuffix("feign")}${r".BASE_URL"})
public class ${tpl.filePrefix}${name}Controller extends BaseController implements ${name}Api {
<#else>
@RequestMapping("/${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}")
public class ${tpl.filePrefix}${name}Controller extends BaseController {
</#if>

    @Autowired
    private ${funs.filePrefix("service")}${name}${funs.fileSuffix("service")} ${name?uncap_first}Service;

    /**
     * 根据条件分页查询，前端分页传pageNum,pageSize
     * @param param
     * @return
     */
    @GetMapping("/list")
    <#if funs.prop("mode") == "api">
    @Override
    public TableDataInfo list(${name}${funs.fileSuffix("DTOList")} param ) {
    <#else>
    public TableDataInfo list(${name} param ) {
    </#if>
        startPage();
        //条件构造器
        QueryWrapper<${name}> queryWrapper = new QueryWrapper<>();

        <#list fields as f>
        <#if f.type.simpleName == 'BigDecimal' || f.type.simpleName == 'Long' || f.type.simpleName == 'Integer' || f.type.simpleName == "Boolean">
        //根据${f.comment}搜索
        if(param.get${f.name?cap_first}() != null ){
            queryWrapper.eq("${f.columnName?lower_case}", param.get${f.name?cap_first}());
        }
        <#elseif f.type.simpleName == 'Date'>
            <#continue/>
        <#else>
        //根据${f.comment}搜索
        if(StringUtils.isNotEmpty(param.get${f.name?cap_first}()) ){
            queryWrapper.eq("${f.columnName?lower_case}", param.get${f.name?cap_first}());
        }
        </#if>
        </#list>

        List<${name}> list = ${name?uncap_first}${funs.fileSuffix("service")}.list(queryWrapper);
        return getDataTable(list);
   }

    /**
     * 添加
     * @param param ${comment}信息
     * @return AjaxResult 添加结果
     */
    @PostMapping("/add")
    <#if funs.prop("mode") == "api">
    @Override
    public  AjaxResult add(@Validated ${name}${funs.fileSuffix("DTOEdit")} param) {
    <#else>
    public AjaxResult add(${name} param ) {
    </#if>
        FireKeyUnit o = new FireKeyUnit();
        BeanUtils.copyProperties(param, o);
        //o.setCreatedBy("");
        o.setCreatedTime(new Date());
        ${name?uncap_first}${funs.fileSuffix("service")}.save(o);
        return AjaxResult.success();
    }

    /**
    * 修改
    * @param param ${comment}信息
    * @return AjaxResult 修改结果
    */
    @PostMapping("/update")
    <#if funs.prop("mode") == "api">
    @Override
    public AjaxResult update(@Validated ${name}${funs.fileSuffix("DTOEdit")} param) {
    <#else>
    public AjaxResult update(${name} param ) {
    </#if>
        //根据id修改
        ${name} o = ${name?uncap_first}${funs.fileSuffix("service")}.getById(param.get${funs.camelcase(idName?lower_case)?cap_first}());
        BeanUtils.copyProperties(o, param);
        //o.setCreatedBy();
        o.setUpdatedTime(new Date());
        ${name?uncap_first}${funs.fileSuffix("service")}.updateById(o);
        return AjaxResult.success();
    }

    /**
    * 删除
    * @param id ${comment}ID
    * @return AjaxResult 修改结果
    */
    @DeleteMapping("/del")
    <#if funs.prop("mode") == "api">
    @Override
    </#if>
    public AjaxResult del(${idType.simpleName} id){
        <#if funs.containsColumn("is_delete")>
        ${name?uncap_first}${funs.fileSuffix("service")}.updateById(new ${name}().set${funs.camelcase(idName?lower_case)?cap_first}(id).setIsDelete(Boolean.TRUE));
        <#else>
        ${name?uncap_first}${funs.fileSuffix("service")}.removeById(id);
        </#if>
        return AjaxResult.success();
    }


}
