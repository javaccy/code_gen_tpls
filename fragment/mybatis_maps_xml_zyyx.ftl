<#assign xxxx=''/>
<#assign mybatisSelectPrefix=''/>
<#assign mybatisSelectSuffix=''/>
<#if mybatisFindName??>
    <#assign xxxx=mybatisFindName/>
<#else >
    <#assign xxxx=funs.prop('findName')/>
</#if>
<#if selectPrefix??>
<#assign mybatisSelectPrefix=selectPrefix/>
</#if>
<#if selectSuffix??>
    <#assign mybatisSelectSuffix=selectSuffix/>
</#if>
<#if (functions.prop('select_map')=='true')??>
    <!-- todo ${author} find${xxxx}${selectSuffix} 注释 -->
    <sql id="${tableName}${xxxx???string(''+xxxx,'')}_alias_columns">
        <#--<#list fields as f><#if f_index+1 ==fields?size>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}<#else>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}, </#if></#list>-->
        <#-- ${aliasColumns?join(",")} -->
        <#list aliasColumns as c>
        <#if c_index == 0>
            c
            <#else>
            ,c
        </#if>
        </#list>
    </sql>
    <#-- 没用不要了
    <select id="find${xxxx}${selectSuffix}Count" resultType="long">
        select count(1) from ${tableName} ${tableAlias} where true
        <include refid="find${xxxx}${selectSuffix}Condition"/>
    </select>
    -->
    <select id="find${xxxx}${selectSuffix}" resultType="java.util.Map">
        select
        *
        from (
        select
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
            <otherwise>
                <#if idType??>
                ${idName},
                </#if>
                <include refid="${tableName}${xxxx???string(''+xxxx,'')}_alias_columns"/>
            </otherwise>
        </choose>
        from ${tableName} ${tableAlias} where true
        <#if idType.name == 'java.lang.String'>
        <if test="params.${idName} != null and params.${idName} != ''">
            and ${tableAlias}.${idName} = ${r"#{params."}${idName}${r"}"}
        </if>
        <#else>
        <if test="params.${idName} != null">
            and ${tableAlias}.${idName} = ${r"#{params."}${idName}${r"}"}
        </if>
        </#if>
        <include refid="find${xxxx}${selectSuffix}Condition"/>
        <choose>
            <when test="params.orderBy != null and params.orderBy != ''">
                order by ${r"${params.orderBy}"}
            </when>
            <when test="params.page != null">
                order by ${tableAlias}.create_time desc
                <include refid="com.aiinp.cash.provider.base.mapper.AAMapper.params_limit"/>
            </when>
            <otherwise>
                <!-- 没有排序 -->
            </otherwise>
        </choose>
        ) as ${tableAlias}
        <choose>
            <when test="params.orderBy != null and params.orderBy != ''">
                order by ${r"${params.orderBy}"}
            </when>
            <when test="params.page != null">
                order by ${tableAlias}.createTime desc
            </when>
            <otherwise>
                <!-- 没有排序 -->
            </otherwise>
        </choose>
    </select>
    <sql id="find${xxxx}${selectSuffix}Condition">
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



