    <#assign xxxx=''/>
    <#if mybatisFindName??>
        <#assign xxxx=mybatisFindName/>
    <#else >
        <#assign xxxx=funs.prop('findName')/>
    </#if>
    List<Map<String,Object>> find${xxxx}Maps(@Param("params") Map<String,Object> params);

    long find${xxxx}MapsCount(@Param("params") Map<String,Object> params);
