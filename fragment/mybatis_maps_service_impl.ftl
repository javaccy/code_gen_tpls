    <#assign xxxx=''/>
    <#if mybatisFindName??>
        <#assign xxxx=mybatisFindName/>
    <#else >
        <#assign xxxx=funs.prop('findName')/>
    </#if>

    <#if funs.prop("findMode") == "vo">
    @Override
    public List<${xxxx}${name}${r"PageVO>"} find${xxxx}Page(Page page,${xxxx}${name}PageDTO params) {
        long count = mapper.find${xxxx}MapsCount(page, params);
        page.setTotal(count);
        return mapper.find${xxxx}Maps(params);
    }
    <#else>
    @Override
    public List${r"<Map<String, Object>>"} find${xxxx}Page(Page page, ${xxxx}${name}PageDTO params) {
        long count = (Long) mapper.findCustomerMaps(page, params).get(0).get("count");
        page.setTotal(count);
        return mapper.findCustomerMaps(params);
    }
    </#if>

