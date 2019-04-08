<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${getMethod('mapper')}.${name?cap_first}Mapper">

    <!-- 通用查询映射结果 -->
    <resultMap id="BaseResultMap" type="${getMethod('model')}.${name}">
        <id column="${idName?lower_case}" property="${idName?lower_case}" />
        <#list fields as f>
        <result column="${f.columnName}" property="${f.name}" />
        </#list>
    </resultMap>

</mapper>
