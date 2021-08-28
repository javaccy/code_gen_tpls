<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${functions.packageName('mapper')}.${name?cap_first}Mapper">
    <!-- 通用查询映射结果 -->
    <resultMap id="BaseResultMap" type="${functions.packageName('entity')}.${functions.findTpl('entity').filePrefix}${name?cap_first}DO">
        <id column="${idColumnName?lower_case}" property="${idName}" />
        <#list fields as f>
        <result column="${f.columnName}" property="${f.name}" />
        </#list>
    </resultMap>
    <#import "../macro/macros.ftl" as m>

    <!-- 通用查询结果列 -->
    <sql id="Base_Column_List">
        <#if idType??>${idColumnName}</#if>
        <#list fields as f>
        ,${f.columnName}${f.columnName?contains("_")?string(" AS "+f.columnName,"")}
        </#list>
    </sql>
    <#--
    <#if (functions.properties('select_map')=='true')??>
        <@m.mybatis_maps_xml '' "find" "Maps" "p"/>
    </#if>
    -->

    <#if funs.prop('finds')=='true'>
        <#list tplGroup.properties as p>
            <#if p.key?starts_with('findName')>
                <#if p.value != "false">
                    <@m.mybatis_plus_maps_xml_simple name "select" "List" "p"/>

                </#if>
            </#if>
        </#list>

    </#if>

</mapper>
