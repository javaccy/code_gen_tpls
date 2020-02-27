package ${functions.packageName('controller')};

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hlsa.common.model.dto.Del;
import com.hlsa.common.model.dto.Add;
import com.hlsa.common.model.dto.Edit;
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
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
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
@RestController
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
   *
   * @param param
   * @return
   */
  @GetMapping("/list")
  <#if funs.prop("mode") == "api">
  @Override
  public TableDataInfo list(${name}${funs.fileSuffix("DTOList")} param) {
  <#else>
  public TableDataInfo list(${name} param) {
  </#if>
    startPage();
    //条件构造器
    QueryWrapper<${name}> queryWrapper = new QueryWrapper<>();
    <#include '../fragment/select_conditon_java.ftl'/>
    List<${name}> list = ${name?uncap_first}${funs.fileSuffix("service")}.list(queryWrapper);
    return getDataTable(list);
  }

  /**
   * 添加
   *
   * @param param ${comment}信息
   * @return AjaxResult 添加结果
   */
  @PostMapping("/add")
  <#if funs.prop("mode") == "api">
  @Override
  public AjaxResult add(@RequestBody @Validated(value = Add.class) ${name}${funs.fileSuffix("DTOEdit")} param) {
  <#else>
  public AjaxResult add(${name} param ) {
  </#if>
    ${name} o = new ${name}();
    BeanUtils.copyProperties(param, o);
    o.setCreateBy("");
    o.setCreateTime(new Date());
    ${name?uncap_first}${funs.fileSuffix("service")}.save(o);
    return AjaxResult.success();
  }

  /**
   * 修改
   *
   * @param param ${comment}信息
   * @return AjaxResult 修改结果
   */
  @PostMapping("/update")
  <#if funs.prop("mode") == "api">
  @Override
  public AjaxResult update(@RequestBody @Validated(value = Edit.class) ${name}${funs.fileSuffix("DTOEdit")} param) {
  <#else>
  public AjaxResult update(${name} param ) {
  </#if>
    //根据id修改
    ${name} o = ${name?uncap_first}${funs.fileSuffix("service")}.getById(param.get${funs.camelcase(idName?lower_case)?cap_first}());
    BeanUtils.copyProperties(param, o);
    o.setUpdateBy("");
    o.setUpdateTime(new Date());
    ${name?uncap_first}${funs.fileSuffix("service")}.updateById(o);
    return AjaxResult.success();
  }

  <#if funs.prop("delMode") == "requestBody">
  /**
   * 删除
   *
   * @param param param.id ${comment}ID
   * @return AjaxResult 修改结果
   */
   @PostMapping("/del")
   <#if funs.prop("mode") == "api">
   @Override
   </#if>
   public AjaxResult del(@RequestBody @Validated(value = Del.class) ${name}${funs.fileSuffix("DTOEdit")} param) {
   <#if funs.containsColumn("is_delete")>
     ${name?uncap_first}${funs.fileSuffix("service")}.updateById(new ${name}().set${funs.camelcase(idName?lower_case)?cap_first}(param.get${funs.camelcase(idName?lower_case)?cap_first}()).setIsDelete(Boolean.TRUE));
   <#else>
     ${name?uncap_first}${funs.fileSuffix("service")}.removeById(param.get${funs.camelcase(idName?lower_case)?cap_first}());
   </#if>
     return AjaxResult.success();
   }
  <#else>
  /**
   * 删除
   *
   * @param ${funs.camelcase(idName?lower_case)} ${comment}ID
   * @return AjaxResult 修改结果
   */
  @PostMapping("/del")
  <#if funs.prop("mode") == "api">
  @Override
  </#if>
  public AjaxResult del(${idType.simpleName} ${funs.camelcase(idName?lower_case)}) {
    <#if funs.containsColumn("is_delete")>
    ${name?uncap_first}${funs.fileSuffix("service")}.updateById(new ${name}().set${funs.camelcase(idName?lower_case)?cap_first}(${funs.camelcase(idName?lower_case)}).setIsDelete(Boolean.TRUE));
    <#else>
    ${name?uncap_first}${funs.fileSuffix("service")}.removeById(${funs.camelcase(idName?lower_case)});
    </#if>
    return AjaxResult.success();
  }
  </#if>


 /**
  * 根据id查询 ${tableComment}
  * @param ${funs.camelcase(idName?lower_case)}
  * @return
  */
  @GetMapping(value = "/one")
  @Override
  public AjaxResult one(@RequestParam(value = "${funs.camelcase(idName?lower_case)}") ${idType.simpleName} ${funs.camelcase(idName?lower_case)}) {
    ${name} o = ${name?uncap_first}${funs.fileSuffix("service")}.getById(${funs.camelcase(idName?lower_case)});
    return AjaxResult.success(o);
  }

}
