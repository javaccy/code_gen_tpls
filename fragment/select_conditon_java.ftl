<#list fields as f>
    <#if f.columnName?lower_case == "create_time" || f.columnName?lower_case == "update_time" || f.columnName?lower_case == "create_by" || f.columnName?lower_case == "update_by" || f.columnName?lower_case == "is_delete" || f.columnName?lower_case == "del_flag" || f.columnName?lower_case == "is_use">
        <#continue >
    </#if>
    <#if f.type.simpleName == 'BigDecimal' || f.type.simpleName == 'Long' || f.type.simpleName == 'Integer' || f.type.simpleName == "Boolean">
    //根据${f.comment}搜索
    if (param.get${f.name?cap_first}() != null) {
      queryWrapper.eq("${f.columnName?lower_case}", param.get${f.name?cap_first}());
    }
    <#elseif f.type.simpleName == 'Date'>
        <#continue/>
    <#else>
    //根据${f.comment}搜索
    if (StringUtils.isNotEmpty(param.get${f.name?cap_first}())) {
      queryWrapper.eq("${f.columnName?lower_case}", param.get${f.name?cap_first}());
    }
    </#if>
</#list>
