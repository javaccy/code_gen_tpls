<#assign xxxx=''/>
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
<#if paramsName??>
    <#assign mybatisParamsName=paramsName/>
</#if>
<#if (functions.prop('select_map')=='true')??>
    <!-- todo ${author} ${mybatisSelectPrefix}${xxxx}${mybatisSelectSuffix} 注释 -->
    <sql id="${tableName}${xxxx???string(''+xxxx,'')}_alias_columns">
        <#--<#list fields as f><#if f_index+1 ==fields?size>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}<#else>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}, </#if></#list>-->
        <#-- ${aliasColumns?join(",")} -->
        <#list aliasColumns as c>
        <#if c_index == 0>
            ${c}
            <#else>
            ,${c}
        </#if>
        </#list>
    </sql>
    <#-- 没用不要了
    <select id="${mybatisSelectPrefix}${xxxx}${mybatisSelectSuffix}Count" resultType="long">
        select count(1) from ${tableName} ${tableAlias} where true
        <include refid="${mybatisSelectPrefix}${xxxx}${mybatisSelectSuffix}Condition"/>
    </select>
    -->
    <select id="${mybatisSelectPrefix}${xxxx}${mybatisSelectSuffix}" resultType="java.util.Map">
        select
        *
        from (
        select
        <choose>
            <when test="${mybatisParamsName}.columns != null">
                <choose>
                    <when test="${mybatisParamsName}.columns == ''">
                        count(1) count
                    </when>
                    <otherwise>
                        ${r"${"}${mybatisParamsName}${".columns}"}
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
        <if test="${mybatisParamsName}.${idName} != null and ${mybatisParamsName}.${idName} != ''">
            and ${tableAlias}.${idName} = ${r"#{"}${mybatisParamsName}${"."}${idName}${r"}"}
        </if>
        <#else>
        <if test="${mybatisParamsName}.${idName} != null">
            and ${tableAlias}.${idName} = ${r"#{"}${mybatisParamsName}${"."}${idName}${r"}"}
        </if>
        </#if>
        <include refid="${mybatisSelectPrefix}${xxxx}${mybatisSelectSuffix}Condition"/>
        <choose>
            <when test="${mybatisParamsName}.orderBy != null and ${mybatisParamsName}.orderBy != ''">
                order by ${r"${"}${mybatisParamsName}${".orderBy}"}
            </when>
            <when test="${mybatisParamsName}.page != null">
                order by ${tableAlias}.create_time desc
                <include refid="com.aiinp.cash.provider.base.mapper.AAMapper.params_limit"/>
            </when>
            <otherwise>
                <!-- 没有排序 -->
            </otherwise>
        </choose>
        ) as ${tableAlias}
        <choose>
            <when test="${mybatisParamsName}.orderBy != null and ${mybatisParamsName}.orderBy != ''">
                order by ${r"${"}${mybatisParamsName}${".orderBy}"}
            </when>
            <when test="${mybatisParamsName}.page != null">
                order by ${tableAlias}.createTime desc
            </when>
            <otherwise>
                <!-- 没有排序 -->
            </otherwise>
        </choose>
    </select>
    <sql id="${mybatisSelectPrefix}${xxxx}${mybatisSelectSuffix}Condition">
        <#list fields as f>
            <#if f.type.name == 'java.lang.String'>
                <#if ((f.jdbcType == 'VARCHAR' || f.jdbcType == 'varchar') && f.columnLength < 200) || f.jdbcType == 'CHAR' || f.jdbcType == 'char'>
        <if test="${mybatisParamsName}.${f.name} != null and ${mybatisParamsName}.${f.name} != ''">
            and ${tableAlias}.${f.columnName} = ${r"#{"}${mybatisParamsName}${"."}${f.name}${r"}"}
        </if>
                </#if>
            <#else>
        <if test="${mybatisParamsName}.${f.name} != null">
            and ${tableAlias}.${f.columnName} = ${r"#{"}${mybatisParamsName}${"."}${f.name}${r"}"}
        </if>
            </#if>
        </#list>
        <#list fields as f>
            <#if f.type.name == 'java.lang.String'>
                <#if f.columnLength gt 200 || f.jdbcType == 'TEXT' || f.jdbcType == 'LONGTEXT' || f.jdbcType == 'text' || f.jdbcType == 'longtext'>
        <if test="${mybatisParamsName}.${f.name} != null and ${mybatisParamsName}.${f.name} != ''">
            and ${tableAlias}.${f.columnName} like CONCAT('%',${r"#{"}${mybatisParamsName}${"."}${f.name},${f.jdbcType?upper_case}${r"}"},'%')
        </if>
                </#if>
            </#if>
        </#list>
    </sql>
</#if>



