<#import "../macro/macros.ftl" as m>
package ${functions.packageName('entity')};

<#if functions.properties('jsonField')=='true'>
import com.alibaba.fastjson.annotation.JSONField;
</#if>
import com.baomidou.mybatisplus.annotation.TableId;
<#if functions.properties('tableField')=='true'>
import com.baomidou.mybatisplus.annotation.TableField;
</#if>
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableName;
<#if functions.properties('jsonFormat')=='true'>
import com.fasterxml.jackson.annotation.JsonFormat;
</#if>

import com.jiaxun.tsf.common.provider.base.BaseEntity;
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

/**
 * <p>
 * ${tableComment!''}实体类
 * </p>
 *
 * @author ${author}
 * @since ${tpl.date}
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@TableName(value = "${tableName}")
@ApiModel(value = "${name}对象", description = "${tableComment}")
public class ${tpl.filePrefix}${name}${tpl.fileSuffixPrefix} extends BaseEntity {

  private static final long serialVersionUID = 1L;

  /**
   * 主键id
   */
  <#if idType.name == 'java.lang.String'>
  @TableId(value = "id", type = IdType.INPUT)
  <#else>
  @TableId(value = "${idName}", type = IdType.AUTO)
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
    <#include '../fragment/fields_getter_setter.ftl'/>
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
