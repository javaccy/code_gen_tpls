<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >

<mapper namespace="${getMethod('Repository')}">
    <resultMap id="BaseResultMap" type="${getMethod('Entity')}">
    <id column="id" property="id" jdbcType="${entity.idJdbcType}"/>
    <#list entity.fields as item>
        <#if item.name == 'createBy' || item.name == 'updateBy'>
            <result column="${item.columnName}" property="${item.name}.id" jdbcType="${item.jdbcType}"/>
            <#else>
            <result column="${item.columnName}" property="${item.name}" jdbcType="${item.jdbcType}"/>
        </#if>
    </#list>
    </resultMap>

    <sql id="Base_Column_List" >
        id
        <#list entity.fields as item>
            <#if item.name == 'createBy' || item.name == 'updateBy'>
            ,`${item.columnName}` "${item.name}.id"
            <#else>
            ,`${item.columnName}` ${item.name}
            </#if>
        </#list>
    </sql>
    <delete id="deleteByPrimaryKey" parameterType="${entity.idType.name}" >
        delete from ${table.name}
        where id = ${r"#{"}id${r"}"}
    </delete>
    <insert id="insert" parameterType="${getMethod('Entity')}" >
        insert into ${table.name} (
        id,
        <#list entity.fields as item>
            ${item.columnName}<#if item_index+1 < entity.fields?size>,</#if>
        </#list>
        )
        values (
        ${r"#{"}id${r"}"},
        <#list entity.fields as item >
            <#if item.name == 'createBy' || item.name == 'updateBy'>
            ${r"#{"}${item.name}.id${r"}"}<#if item_index+1 < entity.fields?size>,</#if>
            <#else>
            ${r"#{"}${item.name}${r"}"}<#if item_index+1 < entity.fields?size>,</#if>
            </#if>
        </#list>
        )
    </insert>
    <delete id="deleteInPrimaryKeys" parameterType="${entity.idType.name}" >
        delete from ${table.name}
        where id IN (${r"${"}ids${r"}"})
    </delete>
    <insert id="insertSelective" parameterType="${getMethod('Entity')}" >
        insert into ${table.name}
        <trim prefix="(" suffix=")" suffixOverrides="," >
            id,
        <#list entity.fields as item >
            <#if item.name == 'createBy' || item.name == 'updateBy'>
                <if test="${item.name}.id != null" >
                ${item.columnName},
                </if>
            <#else>
                <if test="${item.name} != null" >
                ${item.columnName},
                </if>
            </#if>
        </#list>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides="," >
        ${r"#{"}id${r"}"},
        <#list entity.fields as item>
            <#if item.name == 'createBy' || item.name == 'updateBy'>
                <if test="${item.name} != null and ${item.name}.id != null" >
                ${r"#{"}${item.name}${r"}"},
                </if>
            <#else>
                <if test="${item.name} != null and ${item.name} != null" >
                ${r"#{"}${item.name}${r"}"},
                </if>
            </#if>
        </#list>
        </trim>
    </insert>
    <update id="updateByPrimaryKeySelective" parameterType="${getMethod('Entity')}" >
        update ${table.name}
        <set>
        <#list entity.fields as item>
            <#if item.name == 'createBy' || item.name == 'updateBy'>
                <if test="${item.name} != null and ${item.name}.id != null" >
                ${item.columnName} = ${r"#{"}${item.name}${r"}"},
                </if>
            <#else>
                <if test="${item.name} != null and ${item.name} != null" >
                ${item.columnName} = ${r"#{"}${item.name}${r"}"},
                </if>
            </#if>
        </#list>
        </set>
        where id = ${r"#{"}id${r"}"}
    </update>
    <update id="updateByPrimaryKey" parameterType="${getMethod('Entity')}" >
        update ${table.name}
        set
        <#list entity.fields as item>
            <#if item.name == 'createBy' || item.name == 'updateBy'>
            ${item.columnName} = ${r"#{"}${item.name}.id${r"}"},
            <#else>
            ${item.columnName} = ${r"#{"}${item.name}${r"}"},
            </#if>
        </#list>
        where id = ${r"#{"}id${r"}"}
    </update>


    <select id="selectByPrimaryKey" resultMap="BaseResultMap" parameterType="${entity.idType.name}" >
        select
        <include refid="Base_Column_List" />
        from ${table.name}
        where id = ${r"#{"}id${r"}"}
    </select>
    <select id="selectList" resultType="${getMethod('Entity')}" resultMap="BaseResultMap">
        SELECT
        <include refid="Base_Column_List"/>
        FROM ${table.name} WHERE TRUE
        <include refid="selectPageCondition"/>
    </select>

    <select id="selectJqGridPage" resultType="${getMethod('Entity')}" resultMap="BaseResultMap">
        SELECT
        <include refid="Base_Column_List"/>
        FROM ${table.name} WHERE 1=1
        <if test="jqGridFilter != null and jqGridFilter.sql != null">
            ${r"${"}jqGridFilter.sql${r"}"}
        </if>
        <if test="jqGridFilter.order != null">
        ${r"${"}jqGridFilter.order${r"}"}
        </if>
    </select>

    <select id="selectPage" resultType="${getMethod('Entity')}" resultMap="BaseResultMap">
        SELECT
        <include refid="Base_Column_List"/>
        FROM ${table.name}
        <include refid="selectPageCondition"/>
        <include refid="com.javaccy.core.persistence.BaseMapper.selectPageLimitMysql"/>
    </select>
    <select id="selectPageCount" resultType="long" parameterType="Page">
        SELECT
            count(*)
            FROM ${table.name}
            where 1=1
        <include refid="selectPageCondition"/>
    </select>
    <sql id="selectPageLimit">
        limit ${r"#{"}firstResult${r"}"},${r"#{"}maxResult${r"}"}
    </sql>
    <sql id="selectPageCondition">
        <#list entity.fields as item>
        <if test="condition.${item.name} != null">
            and ${item.columnName} = ${r"#{"}condition.${item.name}${r"}"}
        </if>
        </#list>
    </sql>

</mapper>