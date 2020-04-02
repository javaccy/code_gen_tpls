package ${functions.packageName('controller')};

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jiaxun.tsf.common.model.vo.DataVO;
import com.jiaxun.tsf.common.model.vo.ListVO;
import com.jiaxun.tsf.common.provider.tools.BeanMapUtils;
import com.jiaxun.tsf.common.tools.Add;
import com.jiaxun.tsf.common.tools.Edit;
<#if funs.prop("mode") == 'api'>
import ${functions.packageName('feign')}.${name}${funs.fileSuffixPrefix("feign")};
import ${functions.packageName('queryDto')}.${name}${funs.fileSuffixPrefix("queryDto")};
import ${functions.packageName('editDto')}.${name}${funs.fileSuffixPrefix("editDto")};
import ${functions.packageName('vo')}.${name}${funs.fileSuffixPrefix("vo")};
</#if>
import com.jiaxun.tsf.common.model.vo.BaseVO;
import com.jiaxun.tsf.common.provider.base.BaseController;
import ${functions.packageName('entity')}.${name};
import ${functions.packageName('service')}.I${name}Service;
import com.jiaxun.tsf.user.provider.vo.RoomVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import java.util.Date;
import java.util.List;

/**
 * <p>
 * ${tableComment} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${tpl.date}
 */
@RestController
<#if funs.prop("mode") == "api">
@RequestMapping(value = "/${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}")
public class ${tpl.filePrefix}${name}Controller extends BaseController implements ${name}Api {
<#else>
@RequestMapping("/${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}")
public class ${tpl.filePrefix}${name}Controller extends BaseController {
</#if>

  @Autowired
  private ${funs.filePrefix("service")}${name}${funs.fileSuffixPrefix("service")} ${name?uncap_first}Service;

  /**
   * 根据条件分页查询，前端分页传pageNum,pageSize
   *
   * @param param
   * @return
   */
  @GetMapping("/list")
  <#if funs.prop("mode") == "api">
  @Override
  public ListVO<${name}${funs.fileSuffixPrefix("vo")}> list(${name}${funs.fileSuffixPrefix("queryDto")} param) throws Exception {
  <#else>
  public ListVO<${name}${funs.fileSuffixPrefix("vo")}> list(${name} param) {
  </#if>
    //条件构造器
    QueryWrapper<${name}> queryWrapper = new QueryWrapper<>();
    <#include '../fragment/select_conditon_java.ftl'/>
    List<${name}> list = ${name?uncap_first}${funs.fileSuffixPrefix("service")}.list(queryWrapper);
    List<${name}${funs.fileSuffixPrefix("vo")}> vos = BeanMapUtils.copyPropertiesList(list, RoomVO.class);
    return ListVO.success(vos);
  }

  /**
   * 添加
   *
   * @param param ${comment!''}信息
   * @return AjaxResult 添加结果
   */
  @PostMapping("/add")
  <#if funs.prop("mode") == "api">
  @Override
  public BaseVO add(@RequestBody @Validated(value = Add.class) ${name}${funs.fileSuffixPrefix("editDto")} param) {
  <#else>
  public BaseVO add(${name} param ) {
  </#if>
    ${name} o = new ${name}();
    BeanUtils.copyProperties(param, o);
    o.setCreateBy(0L);
    o.setCreateTime(new Date());
    ${name?uncap_first}${funs.fileSuffixPrefix("service")}.save(o);
    return BaseVO.success();
  }

  /**
   * 修改
   *
   * @param param ${comment!''}信息
   * @return AjaxResult 修改结果
   */
  @PostMapping("/edit")
  <#if funs.prop("mode") == "api">
  @Override
  public BaseVO update(@RequestBody @Validated(value = Edit.class) ${name}${funs.fileSuffixPrefix("editDto")} param) {
  <#else>
  public BaseVO update(${name} param ) {
  </#if>
    //根据id修改
    ${name} o = ${name?uncap_first}${funs.fileSuffixPrefix("service")}.getById(param.get${funs.camelcase(idName?lower_case)?cap_first}());
    BeanUtils.copyProperties(param, o);
    o.setUpdateBy(0L);
    o.setUpdateTime(new Date());
    ${name?uncap_first}${funs.fileSuffixPrefix("service")}.updateById(o);
    return BaseVO.success();
  }

  <#if funs.prop("delMode") == "requestBody">
  /**
   * 删除
   *
   * @param param param.id ${comment!''}ID
   * @return AjaxResult 修改结果
   */
   @PostMapping("/del")
   <#if funs.prop("mode") == "api">
   @Override
   </#if>
   public BaseVO del(@RequestBody @Validated(value = Del.class) ${name}${funs.fileSuffix("editDto")} param) {
   <#if funs.containsColumn("is_delete")>
     ${name?uncap_first}${funs.fileSuffixPrefix("service")}.updateById(new ${name}().set${funs.camelcase(idName?lower_case)?cap_first}(param.get${funs.camelcase(idName?lower_case)?cap_first}()).setIsDelete(Boolean.TRUE));
   <#else>
     ${name?uncap_first}${funs.fileSuffixPrefix("service")}.removeById(param.get${funs.camelcase(idName?lower_case)?cap_first}());
   </#if>
     return BaseVO.success();
   }
  <#else>
  /**
   * 删除
   *
   * @param ${funs.camelcase(idName?lower_case)} ${comment!''}ID
   * @return AjaxResult 修改结果
   */
  @PostMapping("/del")
  <#if funs.prop("mode") == "api">
  @Override
  </#if>
  public BaseVO del(${idType.simpleName} ${funs.camelcase(idName?lower_case)}) {
    <#if funs.containsColumn("is_delete")>
    ${name?uncap_first}${funs.fileSuffixPrefix("service")}.updateById(new ${name}().set${funs.camelcase(idName?lower_case)?cap_first}(${funs.camelcase(idName?lower_case)}).setIsDelete(Boolean.TRUE));
    <#else>
    ${name?uncap_first}${funs.fileSuffixPrefix("service")}.removeById(${funs.camelcase(idName?lower_case)});
    </#if>
    return BaseVO.success();
  }
  </#if>


 /**
  * 根据id查询 ${tableComment}
  * @param ${funs.camelcase(idName?lower_case)}
  * @return
  */
  @GetMapping(value = "/one")
  @Override
  public DataVO<${name}${funs.fileSuffixPrefix("vo")}> one(@RequestParam(value = "${funs.camelcase(idName?lower_case)}") ${idType.simpleName} ${funs.camelcase(idName?lower_case)}) throws Exception {
    ${name} o = ${name?uncap_first}${funs.fileSuffixPrefix("service")}.getById(${funs.camelcase(idName?lower_case)});
    ${name}${funs.fileSuffixPrefix("vo")} vo = BeanMapUtils.copyProperties(o, ${name}${funs.fileSuffixPrefix("vo")}.class);
    return DataVO.success(vo);
  }

}
