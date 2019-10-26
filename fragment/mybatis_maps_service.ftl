    <#assign xxxx=''/>
    <#if mybatisFindName??>
        <#assign xxxx=mybatisFindName/>
    <#else >
        <#assign xxxx=funs.prop('findName')/>
    </#if>
    <#if funs.prop("findMode") == "vo">
    List<${xxxx}${name}PageVO> find${xxxx}${name}Page(${xxxx}${name}PageDTO params) throws Exception;
    <#else>
    List<Map<String, Object>> find${xxxx}Page(Page page, ${xxxx}PageParam param) throws Exception;

    List<Map<String, Object>> find${xxxx}Maps(Map<String, Object> map);

    Kv<String, Object> find${xxxx}Map(Map<String, Object> map);
    </#if>

