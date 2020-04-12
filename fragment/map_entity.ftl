
import com.jiaxun.tsf.common.tools.Kv;
import java.io.Serializable;

public class ${name} extends Kv${r'<String,Object>'} implements Serializable {

    public ${idType.simpleName} get${idName?cap_first}() {
        <#if idType.simpleName == "Integer">
        return getInt("${idName}");
        <#elseif idType.simpleName == "Date">
        return getDate("${idName}");s
        <#elseif idType.simpleName == "BigInteger">
        return getBigInteger("${idName}");
        <#elseif idType.simpleName == "BigDecimal">
        return getBigDecimal("${idName}");
        <#elseif idType.simpleName == "Byte">
        return getByte("${idName}");
        <#elseif idType.simpleName == "Long">
        return getLong("${idName}");
        <#elseif idType.simpleName == "Short">
        return getShort("${idName}");
        <#elseif idType.simpleName == "Double">
        return getDouble("${idName}");
        <#elseif idType.simpleName == "Float">
        return getFloat("${idName}");
        <#elseif idType.simpleName == "Boolean">
        return getBoolean("${idName}");
        <#elseif idType.simpleName == "String">
        return getStr("${idName}");
        <#else>
        return get("${idName}");
        </#if>
    }

    public ${name} set${idName?cap_first}(${idType.simpleName} ${idName}) {
        set("${idName}", ${idName});
        return this;
    }


    <#list fields as f>
    //${f.comment}
    public ${f.type.simpleName} get${f.name?cap_first}() {
        <#if f.type.simpleName == "Integer">
        return getInt("${f.columnName}");
        <#elseif f.type.simpleName == "Date">
        return getDate("${f.columnName}");
        <#elseif f.type.simpleName == "BigInteger">
        return getBigInteger("${f.columnName}");
        <#elseif f.type.simpleName == "BigDecimal">
        return getBigDecimal("${f.columnName}");
        <#elseif f.type.simpleName == "Byte">
        return getByte("${f.columnName}");
        <#elseif f.type.simpleName == "Long">
        return getLong("${f.columnName}");
        <#elseif f.type.simpleName == "Short">
        return getShort("${f.columnName}");
        <#elseif f.type.simpleName == "Double">
        return getDouble("${f.columnName}");
        <#elseif f.type.simpleName == "Float">
        return getFloat("${f.columnName}");
        <#elseif f.type.simpleName == "Boolean">
        return getBoolean("${f.columnName}");
        <#elseif f.type.simpleName == "String">
        return getStr("${f.columnName}");
        <#else>
        return get("${f.columnName}");
        </#if>
    }

    public ${name} set${f.name?cap_first}(${f.type.simpleName} ${f.name}) {
        set("${f.columnName}", ${f.name});
        return this;
    }
    </#list>

}
