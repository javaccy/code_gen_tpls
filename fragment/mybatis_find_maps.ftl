<#if (functions.properties('select_map')=='true')??>
    <sql id="${tableName}_alias_columns">
        <#list fields as f><#if f_index+1 ==fields?size>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}<#else>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}, </#if></#list>
    </sql>
    <select id="findMaps" resultType="java.util.Map">
        select
        id,
        <include refid="${tableName}_alias_columns"/>
        from ${tableName} ${tableAlias} where true
        <if test="map.id != null and map.id != ''">
            and ${tableAlias}.id = ${r"#{map.id}"}
        </if>
        <#list fields as f>
            <#if f.type.name == 'java.lang.String'>
                <if test="map.${f.name} != null and map.${f.name} != ''">
                    and ${tableAlias}.${f.columnName} = ${r"#{map."}${f.name}${r"}"}
                </if>
            <#else>
                <if test="map.${f.name} != null">
                    and ${tableAlias}.${f.columnName} = ${r"#{map."}${f.name}${r"}"}
                </if>
            </#if>
        </#list>
    </select>
</#if>