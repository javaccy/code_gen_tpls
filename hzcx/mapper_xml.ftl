<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${functions.packageName('mapper')}.${name?cap_first}Mapper">
    <!-- 通用查询映射结果 -->
    <resultMap id="BaseResultMap" type="${functions.packageName('model')}.${name?cap_first}">
        <id column="${idName?lower_case}" property="${idName?lower_case}" />
        <#list fields as f>
        <result column="${f.columnName}" property="${f.name}" />
        </#list>
    </resultMap>

    <!-- 通用查询结果列 -->
    <sql id="Base_Column_List">
        id, <#list fields as f><#if f_index+1 ==fields?size>${f.columnName}${f.columnName?contains("_")?string(" AS "+f.columnName,"")}<#else>${f.columnName}${f.columnName?contains("_")?string(" AS "+f.columnName,"")}, </#if></#list>
    </sql>
    <#if (functions.properties('select_map')=='true')??>
    <sql id="${tableName}_alias_columns">
        <#list fields as f><#if f_index+1 ==fields?size>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}<#else>${tableAlias}.${f.columnName}${f.columnName?contains("_")?string(" AS "+f.name,"")}, </#if></#list>
    </sql>
    <select id="findMaps" resultType="java.util.Map">
        select
        id,
        <include refid="${tableName}_alias_columns"/>
        from ${tableName} ${tableAlias} where true
        <if test="params.id != null and params.id != ''">
            and ${tableAlias}.id = ${r"#{params.id}"}
        </if>
        <#list fields as f>
        <#if f.type.name == 'java.lang.String'>
        <if test="params.${f.name} != null and params.${f.name} != ''">
            and ${tableAlias}.${f.columnName} = ${r"#{params."}${f.name}${r"}"}
        </if>
        <#else>
        <if test="params.${f.name} != null">
            and ${tableAlias}.${f.columnName} = ${r"#{params."}${f.name}${r"}"}
        </if>
        </#if>
        </#list>
    </select>
    </#if>
</mapper>
