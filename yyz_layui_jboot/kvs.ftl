<#list fields as f>
    <#list f.kvs?keys as key>
        //${f.kvs["${key}"]}
        <#if f.isString>
        public static ${f.type.simpleName} ${f.columnName}_${key} = "${key}";
        <#elseif f.isNumber>
            <#if key?starts_with("-")>
                public static ${f.type.simpleName} ${f.columnName}_0${key?substring(1,2)} = ${key};
            <#else>
                public static ${f.type.simpleName} ${f.columnName}_${key} = ${key};
            </#if>
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
                    .set(${f.columnName}_${key},"${f.kvs["${key}"]}");
                <#else>
                    .set(${f.columnName}_${key},"${f.kvs["${key}"]}")
                </#if>
            </#list>
        <#elseif f.isNumber>
            public static Kv ${f.name}Kvs = Kv.create()
            <#list kvs as key>
                <#if key_index+1 == kvs?size>
                    <#if key?starts_with('-')>
                        .set(${f.columnName}_0${key?substring(1,2)},"${f.kvs["${key}"]}");
                    <#else>
                        .set(${f.columnName}${key},"${f.kvs["${key}"]}");
                    </#if>
                <#else>
                    <#if key?starts_with('-')>
                        .set(${f.columnName}_0${key?substring(1,2)},"${f.kvs["${key}"]}")
                    <#else>
                        .set(${f.columnName}${key},"${f.kvs["${key}"]}")
                    </#if>
                </#if>
            </#list>
        <#else>
            public static Kv ${f.name}Kvs = Kv.create()
            <#list kvs as key>
                <#if key_index+1 == kvs?size>
                    .set(${f.columnName}_${key},"${f.kvs["${key}"]}");
                <#else>
                    .set(${f.columnName}_${key},"${f.kvs["${key}"]}")
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

<#if functions.properties('template')=='beetl_yyz'>
    <#list fields as f>
        <#assign kvs=f.kvs?keys/>
        <#if f.kvs??&&(f.kvs?size>0)>
            <select name="${f.name}Kvs">
                <option value ="${f.columnName}">全部</option>
                ${r"@for(s in "}${f.name}Kvs${r" ){ "}
                <option value ="${r"${s.key}"}" ${r"${s.key == o."}${f.columnName}${r" ? 'selected' : ''}"}>${r"${s.value}"}</option>
                ${r"@}"}
            </select>
        </#if>
    </#list>
<#elseif functions.properties('template')=='freemarker'>
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
</#if>



