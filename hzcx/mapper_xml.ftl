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


    <#if (functions.properties('select_map')=='true')??>
    <sql id="${tableName}_alias_columns">
        <#list columnNames as c><#if c_index==0>${tableAlias}.${c}<#else>,${tableAlias}.${c}</#if></#list>
    </sql>
    <select id="findMaps" resultType="java.util.Map">
        select
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
</mapper>
