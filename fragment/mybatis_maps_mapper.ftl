    <#assign xxxx=''/>
    <#if mybatisFindName??>
        <#assign xxxx=mybatisFindName/>
    <#else >
        <#assign xxxx=funs.prop('findName')/>
    </#if>
    <#if funs.prop("findMode") == "vo">
    List<${xxxx}${name}PageVO> find${xxxx}List(@Param("params") ${xxxx}${name}PageDTO params);
    <#else>
    List<Map<String,Object>> find${xxxx}Maps(@Param("params") Map<String,Object> params);
    </#if>

