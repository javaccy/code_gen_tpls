<#assign xxxx=''/>
<#if mybatisFindName??>
    <#assign xxxx=mybatisFindName/>
<#else >
    <#assign xxxx=funs.prop('findName')/>
</#if>
<#if (functions.prop('select_map')=='true')??>
    <sql id="${tableName}${xxxx???string(''+xxxx,'')}_alias_columns">
        <#list fields as f><#if f_index+1 ==fields?size>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}<#else>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}, </#if></#list>
    </sql>
    <select id="find${xxxx}MapsCount" resultType="long">
        select count(1) from ${tableName} ${tableAlias} where true
        <include refid="find${xxxx}MapsCondition"/>
    </select>
    <select id="find${xxxx}Maps" resultType="java.util.Map">
        select
        *
        from (
        select
        id,
        <choose>
            <when test="params.columns != null">
                <choose>
                    <when test="params.columns == ''">
                        count(1) count
                    </when>
                    <otherwise>
                        ${r"${params.columns}"}
                    </otherwise>
                </choose>
            </when>
            <when test="params.notColumns != null and params.notColumns != ''">
                ${r"${params.notColumns}"}
            </when>
            <otherwise>
                id,
                <include refid="${tableName}${xxxx???string(''+xxxx,'')}_alias_columns"/>
            </otherwise>
        </choose>
        from ${tableName} ${tableAlias} where true
        <if test="params.id != null and params.id != ''">
            and ${tableAlias}.id = ${r"#{params.id}"}
        </if>
        ) as ${tableAlias}
    </select>
    <sql id="find${xxxx}MapsCondition">
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
    </sql>
</#if>



