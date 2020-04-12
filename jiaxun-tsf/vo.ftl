package ${functions.packageName('vo')};

<#if functions.properties('jsonField')=='true'>
import com.alibaba.fastjson.annotation.JSONField;
</#if>
<#if functions.properties('jsonFormat')=='true'>
import com.fasterxml.jackson.annotation.JsonFormat;
</#if>

import com.jiaxun.tsf.common.model.vo.BaseVO;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModelProperty;

<#list fields as f>
<#if f.type.simpleName == "BigDecimal">
import java.math.BigDecimal;
<#break/>
</#if>
</#list>
import java.util.Date;

import java.io.Serializable;

/**
 * <p>
 * ${tableComment!''}实体类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@ApiModel(value = "${name}对象", description = "${tableComment}")
public class ${tpl.filePrefix}${name}${tpl.fileSuffixPrefix} implements Serializable {

  private static final long serialVersionUID = 1L;

  <#list fields as f>
     <#if f.columnName?lower_case == "create_time" || f.columnName?lower_case == "update_time" || f.columnName?lower_case == "create_by" || f.columnName?lower_case == "update_by">
         <#continue >
     </#if>
  <#if functions.properties('comment') == 'doc'>
  /**
   * ${f.comment!''}
   */
  <#elseif functions.properties('comment') == 'swagger'>
  @ApiModelProperty(value = "${f.comment}")
  <#else>
  //${f.comment}
  </#if>
  <#if functions.properties('jsonField')=='true'>
      <#if f.columnName?contains("_") && f.type.name = 'java.util.Date'>
  @JSONField(name = "${f.columnName}", format = "yyyy-MM-dd HH:mm:ss")
      </#if>
      <#if f.columnName?contains("_") && f.type.name != 'java.util.Date'>
  @JSONField(name = "${f.columnName}")
      </#if>
  </#if>
  <#if functions.properties('jsonFormat')=='true'>
      <#if f.type.name = 'java.util.Date'>
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
      </#if>
  </#if>
   <#if functions.properties('jsonProperty')=='true'>
      <#if f.columnName?contains("_")>
  @JsonProperty(value = "${f.name}")
      </#if>
   </#if>
  <#if funs.prop('tableField')=='true' && f.columnName?contains("_")>
  @TableField("${f.columnName}")
  </#if>
  private ${f.type.simpleName} ${f.name};
  </#list>

  /**
   * 默认构造方法
   */
  public ${tpl.filePrefix}${name}${tpl.fileSuffixPrefix}() {
  }
  <#if funs.prop("getter") == 'true'>
  public ${idType.simpleName} get${idName?cap_first}() {
    return ${idName?lower_case};
  }
  </#if>
  <#if funs.prop("setter") == 'true'>
  public ${tpl.filePrefix}${name}${tpl.fileSuffixPrefix} set${idName?cap_first}(${idType.simpleName} ${idName?lower_case}){
    this.${idName?lower_case} = ${idName?lower_case};return this;
  }
  </#if>
  <#if funs.prop("getter") == 'true' || funs.prop("setter") == 'true'>
      <#list fields as f>
  <#if funs.prop("getter") == 'true'>
  public ${f.type.simpleName} get${f.name?cap_first}() {
    return ${f.name};
  }
  </#if>
  <#if funs.prop("setter") == 'true'>
  public ${tpl.filePrefix}${name}${tpl.fileSuffixPrefix} set${f.name?cap_first}( ${f.type.simpleName} ${f.name}) {
    this.${f.name} = ${f.name};return this;
  }
  </#if>
      </#list>
  </#if>
  <#--
  @Override
  protected Serializable pkVal() {
      return this.${funs.camelcase(idName?lower_case)};
  }
  -->
  <#if funs.prop("toString") == 'true'>
  @Override
  public String toString() {
    return "${tpl.filePrefix}${name}${tpl.fileSuffixPrefix}{" +
    "${idName?lower_case}=" + ${idName?lower_case} +
    <#list fields as f>
        ", ${f.name}=" + ${f.name} +
    </#list>
    "}";
  }
  </#if>

}