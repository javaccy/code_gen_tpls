<#import "../macro/macros.ftl" as m>
package ${functions.packageName('entity')};

<#if functions.properties('jsonField')=='true'>
    import com.alibaba.fastjson.annotation.JSONField;
</#if>
<#if functions.properties('jsonFormat')=='true'>
    import com.fasterxml.jackson.annotation.JsonFormat;
</#if>

<#if funs.prop("lombok") == "true">
    import lombok.Data;
    import lombok.experimental.Accessors;
    import lombok.EqualsAndHashCode;
</#if>
<#if funs.prop("swagger") == "true">
    import io.swagger.annotations.ApiModel;
    import io.swagger.annotations.ApiModelProperty;
</#if>
import java.io.Serializable;
<#list fieldTypes as t>
    <#if !(t.name?starts_with("java.lang"))>
        import ${t.name?replace("class","")};
    </#if>
</#list>

/**
 * <p>
 * ${tableComment!'实体类'}
 * </p>
 *
 * @author ${funs.prop('author')!default(author)}
 * @since ${tpl.date}
 */
<#if funs.prop("lombok") == "true">
    @Data
    @Accessors(chain = true)
    @EqualsAndHashCode(callSuper = false)
</#if>
<#if funs.prop("swagger") == "true">
    @ApiModel(value = "${name}对象", description = "${tableComment}")
</#if>
public class ${tpl.filePrefix}${name}${tpl.fileSuffixPrefix}Resource extends Model<${tpl.filePrefix}${name}${tpl.fileSuffixPrefix}> {

${funs.prop("tabLine")?replace("|","")}private static final long serialVersionUID = 1L;

<@m.java_fields tpl.name/>
<#if funs.prop("constructor") == 'true'>
    ${funs.prop("tabLine")}/**
    ${funs.prop("tabLine")} * 默认构造方法
    ${funs.prop("tabLine")} */
    ${funs.prop("tabLine")?replace("|","")}public ${tpl.filePrefix}${name}${tpl.fileSuffixPrefix}() {
    ${funs.prop("tabLine")?replace("|","")}}
</#if>
<#if funs.prop("getter") == 'true'>
    ${funs.prop("tabLine")?replace("|","")}public ${idType.simpleName} get${idName?cap_first}() {
    ${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}return ${idName};
    ${funs.prop("tabLine")?replace("|","")}}
</#if>

<#if funs.prop("setter") == 'true'>
    <#if funs.prop("fluentSetter") == "false">
        ${funs.prop("tabLine")?replace("|","")}public void set${idName?cap_first}(${idType.simpleName} ${idName}) {
        ${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}this.${idName} = ${idName};
        ${funs.prop("tabLine")?replace("|","")}}
    <#else>
        ${funs.prop("tabLine")?replace("|","")}public ${tpl.filePrefix}${name}${tpl.fileSuffixPrefix} set${idName?cap_first}(${idType.simpleName} ${idName}) {
        ${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}this.${idName} = ${idName};return this;
        ${funs.prop("tabLine")?replace("|","")}}
    </#if>
</#if>

<#if funs.prop("getter") == 'true' || funs.prop("setter") == 'true'>
    <#include '../fragment/fields_getter_setter.ftl'/>
</#if>

${funs.prop("tabLine")?replace("|","")}@Override
${funs.prop("tabLine")?replace("|","")}protected Serializable pkVal() {
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}return this.${idName};
${funs.prop("tabLine")?replace("|","")}}

<#if funs.prop("toString") == 'true'>
    ${funs.prop("tabLine")?replace("|","")}@Override
    ${funs.prop("tabLine")?replace("|","")}public String toString() {
    ${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}return "${tpl.filePrefix}${name}${tpl.fileSuffixPrefix}{" +
    ${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}"${idName}=" + ${idName} +
    <#list fields as f>
        ${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}", ${f.name}=" + ${f.name} +
    </#list>
    ${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}"}";
    ${funs.prop("tabLine")?replace("|","")}}
</#if>
}