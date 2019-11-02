<#assign xxxx=''/>
<#if mybatisFindName??>
    <#assign xxxx=mybatisFindName/>
<#else >
    <#assign xxxx=funs.prop('findName')/>
</#if>
<#if (functions.prop('select_map')=='true')??>
    <!-- todo ${author} find${xxxx}Maps 注释 -->
    <sql id="${tableName}${xxxx???string(''+xxxx,'')}_alias_columns">
        <#--<#list fields as f><#if f_index+1 ==fields?size>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}<#else>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}, </#if></#list>-->
        ${aliasColumns?join(",")}
    </sql>
    <#-- 没用不要了
    <select id="find${xxxx}MapsCount" resultType="long">
        select count(1) from ${tableName} ${tableAlias} where true
        <include refid="find${xxxx}MapsCondition"/>
    </select>
    -->
    <#if funs.prop("findMode") == "vo">
    <select id="find${xxxx}Page" resultType=" ${funs.packageName("find_page_vo")}.${xxxx}${name}PageVO">
    <#else>
    <select id="find${xxxx}Maps" resultType="java.util.Map">
    </#if>
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
        <#if funs.prop("findMode") == "vo">
        <include refid="find${xxxx}${name}ListCondition"/>
        <#else>
        <include refid="find${xxxx}MapsCondition"/>
        </#if>
        <choose>
            <when test="params.orderBy != null and params.orderBy != ''">
                order by ${r"${params.orderBy}"}
            </when>
            <when test="params.page != null">
                order by ${tableAlias}.create_time desc
                <include refid="com.aiinp.tsf.order.app.mapper.AaMapper.params_limit"/>
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
    <#if funs.prop("findMode") == "vo">
    <sql id="find${xxxx}${name}ListCondition">
    <#else>
    <sql id="find${xxxx}MapsCondition">
    </#if>
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



