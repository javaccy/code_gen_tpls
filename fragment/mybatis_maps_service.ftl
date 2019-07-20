    <#assign xxxx=''/>
    <#if mybatisFindName??>
        <#assign xxxx=mybatisFindName/>
    <#else >
        <#assign xxxx=funs.prop('findName')/>
    </#if>
    List<Map<String, Object>> find${xxxx}Page(String ownerId, Page page, ${xxxx}PageParam param);

    List<Map<String, Object>> find${xxxx}Maps(Map<String, Object> map);

    Kv<String, Object> find${xxxx}Map(Map<String, Object> map);
