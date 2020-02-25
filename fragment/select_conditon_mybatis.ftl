<#list fields as f>
    <#if f.type.name == 'java.lang.String'>
        <#if ((f.jdbcType == 'VARCHAR' || f.jdbcType == 'varchar') && f.columnLength < 200) || f.jdbcType == 'CHAR' || f.jdbcType == 'char'>
            <if test="params.${f.name} != null and params.${f.name} != ''">
                and ${tableAlias}.${f.columnName} = ${r"#{params."}${f.name}${r"}"}
            </if>
        </#if>
    <#else>
        <if test="params.${f.name} != null">
            and ${tableAlias}.${f.columnName} = ${r"#{params."}${f.name}${r"}"}
        </if>
    </#if>
</#list>
<#list fields as f>
    <#if f.type.name == 'java.lang.String'>
        <#if f.columnLength gt 200 || f.jdbcType == 'TEXT' || f.jdbcType == 'LONGTEXT' || f.jdbcType == 'text' || f.jdbcType == 'longtext'>
            <if test="params.${f.name} != null and params.${f.name} != ''">
                and ${tableAlias}.${f.columnName} like CONCAT('%',${r"#{params."}${f.name},${f.jdbcType?upper_case}${r"}"},'%')
            </if>
        </#if>
    </#if>
</#list>
