<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.soft.ware.modular.system.dao.MenuMapper">

    <!-- 通用查询映射结果 -->
    <resultMap id="BaseResultMap" type="com.soft.ware.rest.modular.auth.model.${name}">
        <id column="${idName?lower_case}" property="${idName?lower_case}" />
        <#list fields as f>
        <result column="${f.name}_" property="${f.name}" />
        </#list>
    </resultMap>

</mapper>
