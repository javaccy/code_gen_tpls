package ${functions.packageName('model')};
<#if functions.properties('jsonField')=='true'>
import com.alibaba.fastjson.annotation.JSONField;
</#if>
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
<#if functions.properties('tableField')=='true'>
import com.baomidou.mybatisplus.annotations.TableField;
</#if>
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
<#if functions.properties('jsonFormat')=='true'>
import com.fasterxml.jackson.annotation.JsonFormat;
</#if>

import java.io.Serializable;
<#list fields as f>
    <#if f.type.simpleName == "BigDecimal">import java.math.BigDecimal;<#break/></#if>
</#list>
import java.util.Date;
/**
 * <p>
 * ${tableComment}
 * </p>
 *
 * @author ${author}
 * @since ${datetime}
 */
@TableName("${tableName}")
public class ${name} extends Model<${name}> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    <#if idType.name == 'java.lang.String'>
    @TableId(value = "id", type = IdType.INPUT)
    <#else>
    @TableId(value = "${idName}", type = IdType.AUTO)
    </#if>
    private ${idType.simpleName} ${idName?lower_case};
    <#list fields as f>
    <#if (functions.properties('comment')=='doc')??>
    /**
     * ${f.comment}
     */
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
    <#if functions.properties('tableField')=='true' && f.columnName?contains("_")>
    @TableField("${f.columnName}")
    </#if>
    private ${f.type.simpleName} ${f.name};
    </#list>

    /**
     * 默认构造方法
     */
    public ${name}(){}


    public ${idType.simpleName} get${idName?cap_first}() {
        return ${idName?lower_case};
    }

    public ${name} set${idName?cap_first}(${idType.simpleName} ${idName?lower_case}){
        this.${idName?lower_case} = ${idName?lower_case};return this;
    }

    <#list fields as f>
    <#if funs.prop("getter") == 'true'>
    public ${f.type.simpleName} get${f.name?cap_first}() {
        return ${f.name};
    }
    </#if>

    <#if funs.prop("setter") == 'true'>
    public ${name} set${f.name?cap_first}( ${f.type.simpleName} ${f.name}) {
        this.${f.name} = ${f.name};return this;
    }
    </#if>

    </#list>
    @Override
    protected Serializable pkVal() {
        return this.${idName?lower_case};
    }

    @Override
    public String toString() {
        return "${name}{" +
        "${idName?lower_case}=" + ${idName?lower_case} +
        <#list fields as f>
        ", ${f.name}=" + ${f.name} +
        </#list>
        "}";
    }
}
