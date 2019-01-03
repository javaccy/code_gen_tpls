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
            public static Kv ${f.columnName}Kvs = Kv.create()
            <#list kvs as key>
                <#if key_index+1 == kvs?size>
                    .set("${key}","${f.kvs["${key}"]}");
                <#else>
                    .set("${key}","${f.kvs["${key}"]}")
                </#if>
            </#list>
        <#else>
            public static Kv ${f.columnName}Kvs = Kv.create()
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