<#if (functions.prop('select_map')=='true')??>
    <sql id="${tableName}_alias_columns">
        <#list fields as f><#if f_index+1 ==fields?size>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}<#else>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}, </#if></#list>
    </sql>
    <sql id="find${funs.prop('findName')}MapsCondition">
        <#list fields as f>
            <#if f.type.name == 'java.lang.String'>
                <#if f.jdbcType == 'VARCHAR' || f.jdbcType == 'varchar' || f.jdbcType == 'CHAR' || f.jdbcType == 'char'>
                    <if test="map.${f.name} != null and map.${f.name} != ''">
                        and ${tableAlias}.${f.columnName} = ${r"#{map."}${f.name}${r"}"}
                    </if>
                </#if>
            <#else>
                <if test="map.${f.name} != null">
                    and ${tableAlias}.${f.columnName} = ${r"#{map."}${f.name}${r"}"}
                </if>
            </#if>
        </#list>
        <#list fields as f>
            <#if f.type.name == 'java.lang.String'>
                <#if f.jdbcType == 'TEXT' || f.jdbcType == 'LONGTEXT' || f.jdbcType == 'text' || f.jdbcType == 'longtext'>
                    <if test="map.${f.name} != null and map.${f.name} != ''">
                        and ${tableAlias}.${f.columnName} like CONCAT('%',${r"#{map."}${f.name}${r"}"},'%')
                    </if>
                </#if>
            </#if>
        </#list>
    </sql>
    <select id="find${funs.prop('findName')}Maps" resultType="java.util.Map">
        select
        id,
        <include refid="${tableName}_alias_columns"/>
        from ${tableName} ${tableAlias} where true
        <if test="map.id != null and map.id != ''">
            and ${tableAlias}.id = ${r"#{map.id}"}
        </if>
    </select>
    <select id="find${funs.prop('findName')}MapsCount" resultType="long">
        select count(1)
        from ${tableName} ${tableAlias}
        where true
        <include refid="find${funs.prop('findName')}MapsCondition"/>
    </select>
</#if>


