<#import "../macro/macros.ftl" as m>
package ${functions.packageName('editDto')};

<#if functions.properties('jsonField')=='true'>
import com.alibaba.fastjson.annotation.JSONField;
</#if>
<#if functions.properties('jsonFormat')=='true'>
import com.fasterxml.jackson.annotation.JsonFormat;
</#if>

import com.hlsa.common.model.dto.Del;
import com.hlsa.common.model.dto.Edit;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
<#list fields as f>
<#if f.type.simpleName == "BigDecimal">
import java.math.BigDecimal;
<#break/>
</#if>
</#list>
import java.util.Date;

/**
 * <p>
 * ${tableComment!''} EditDTO
 * </p>
 *
 * @author ${author}
 * @since ${tpl.date}
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode
@ApiModel(value = "${name}添加和修改对象", description = "${tableComment}")
public class ${tpl.filePrefix}${name}${tpl.fileSuffixPrefix} implements Serializable {

  private static final long serialVersionUID = 1L;

  /**
   * 主键id
   */
  <#if idType.name == 'java.lang.String'>
  @NotBlank(groups = {Del.class, Edit.class}, message = "${idComment}不能为空")
  <#else>
  @NotNull(groups = {Del.class, Edit.class}, message = "${idComment}不能为空")
  </#if>
  private ${idType.simpleName} ${funs.camelcase(idName?lower_case)};
<@m.java_fields tpl.name/>

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
