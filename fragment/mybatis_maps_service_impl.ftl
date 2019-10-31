    <#assign xxxx=''/>
    <#if mybatisFindName??>
        <#assign xxxx=mybatisFindName/>
    <#else >
        <#assign xxxx=funs.prop('findName')/>
    </#if>

    <#if funs.prop("findMode") == "vo">
    @Override
    public List<${xxxx}${name}${r"PageVO>"} find${xxxx}Page(${xxxx}${name}PageDTO params) throws Exception {
        long count = mapper.find${xxxx}MapsCount(params);
        params.setTotal(count);
        return mapper.find${xxxx}Maps(params);
    }
    <#else>
    @Override
    public List${r"<Map<String, Object>>"} find${xxxx}Page(${xxxx}${name}PageDTO params) throws Exception {
        long count = (Long) mapper.findCustomerMaps(params).get(0).get("count");
        params.setTotal(count);
        return mapper.findCustomerMaps(params);
    }
    </#if>

