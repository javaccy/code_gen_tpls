<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${functions.packageName('mapper')}.${name?cap_first}Mapper">
    <!-- 通用查询映射结果 -->
    <resultMap id="BaseResultMap" type="${functions.packageName('model')}.${functions.findTpl('model').filePrefix}${name?cap_first}">
        <id column="${idName?lower_case}" property="${idName?lower_case}" />
        <#list fields as f>
        <result column="${f.columnName}" property="${f.name}" />
        </#list>
    </resultMap>
    <#import "../macro/macros.ftl" as m>

    <!-- 通用查询结果列 -->
    <sql id="Base_Column_List">
        <#if idType??>${idName},</#if> <#list fields as f><#if f_index+1 ==fields?size>${f.columnName}${f.columnName?contains("_")?string(" AS "+f.columnName,"")}<#else>${f.columnName}${f.columnName?contains("_")?string(" AS "+f.columnName,"")}, </#if></#list>
    </sql>

    <#if funs.prop('finds')=='true'>
        <#import "../macro/macros.ftl" as m>
        <#list tplGroup.properties as p>
            <#if p.key?starts_with('findName')>
                <#if p.value != "false">
                    <@m.mybatis_maps_xml p.value/>

                </#if>
            </#if>
        </#list>
    </#if>
</mapper>
