package com.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

public class Base${name}<M extends Base${name}> extends Model<M> implements IBean {

    <#if idType??>
    public ${idType.simpleName} get${idName?cap_first}() {
        <#if idType.simpleName == "String">
        return getStr("${idName}");
        <#elseif idType.simpleName == "Integer">
        return getInt("${idName}");
        <#elseif idType.simpleName == "Long">
        return getLong("${idName}");
        <#elseif idType.simpleName == "bigInteger">
        return getBigInteger("${idName}");
        <#else>
            return get("${idName}");
        </#if>
    }

    public M set${idName?cap_first}(String ${idName}) {
        set("${idName}", ${idName});
        return (M) this;
    }
    </#if>

    <#list fields as f >
    public ${f.type.simpleName} get${f.name?cap_first}() {
        <#if f.type.simpleName == "String">
        return getStr("${f.columnName}");
        <#elseif f.type.simpleName == "Integer">
        return getInt("${f.columnName}");
        <#elseif f.type.simpleName == "Long">
        return getLong("${f.columnName}");
        <#elseif f.type.simpleName == "Short">
        return getShort("${f.columnName}");
        <#elseif f.type.simpleName == "byte">
        return getDouble("${f.columnName}");
        <#elseif f.type.simpleName == "Double">
        return getFloat("${f.columnName}");
        <#elseif f.type.simpleName == "Float">
        return getFloat("${f.columnName}");
        <#elseif f.type.simpleName == "Boolean">
        return getBoolean("${f.columnName}");
        <#elseif f.type.simpleName == "Date">
        return getDate("${f.columnName}");
        <#elseif f.type.simpleName == "bigInteger">
        return getBigInteger("${f.columnName}");
        <#elseif f.type.simpleName == "bigDecimal">
        return getDecimal("${f.columnName}");
        <#else>
            return get("${f.columnName}");
        </#if>
    }

    public M set${f.name?cap_first}(${f.type.simpleName} ${f.name}) {
        set("${f.columnName}", ${f.name});
        return (M) this;
    }
    </#list>
}
