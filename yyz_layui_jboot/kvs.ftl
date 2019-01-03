<#list fields as f>
    <#list f.kvs?keys as key>
        //${f.kvs["${key}"]}
        <#if f.isString>
            public static ${f.type.simpleName} ${f.columnName}_${key} = "${key}";
            <#else>
            public static ${f.type.simpleName} ${f.columnName}_${key} = ${key};
        </#if>
    </#list>
</#list>


<#list fields as f>
    <#assign kvs=f.kvs?keys/>
    <#if f.kvs??&&(f.kvs?size>0)>
        <#if f.isString>
            public static Kv ${f.name}Kvs = Kv.create()
            <#list kvs as key>
                <#if key_index+1 == kvs?size>
                    .set("${key}","${f.kvs["${key}"]}");
                <#else>
                    .set("${key}","${f.kvs["${key}"]}")
                </#if>
            </#list>
        <#else>
            public static Kv ${f.name}Kvs = Kv.create()
            <#list kvs as key>
                <#if key_index+1 == kvs?size>
                    .set(${key},"${f.kvs["${key}"]}");
                <#else>
                    .set(${key},"${f.kvs["${key}"]}")
                </#if>
            </#list>
        </#if>
    </#if>
</#list>

<#list fields as f>
    <#assign kvs=f.kvs?keys/>
    <#if f.kvs??&&(f.kvs?size>0)>
        setAttr("${f.name}Kvs", ${name}.${f.name}Kvs);
    </#if>
</#list>


<#list fields as f>
    <#assign kvs=f.kvs?keys/>
    <#if f.kvs??&&(f.kvs?size>0)>
        <select name="${f.name}Kvs">
            <option value ="${f.columnName}">全部</option>
            ${r"<#list "}${f.name}Kvs${r" as s>"}
                <option value ="${r"${s.key}"}" ${r"${(s.key == o."}${f.columnName}${r")?string('selected','')}"}>${r"${s.value}"}</option>
            ${r"</#list>"}
        </select>
    </#if>
</#list>

