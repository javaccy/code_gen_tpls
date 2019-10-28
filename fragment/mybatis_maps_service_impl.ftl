    <#assign xxxx=''/>
    <#if mybatisFindName??>
        <#assign xxxx=mybatisFindName/>
    <#else >
        <#assign xxxx=funs.prop('findName')/>
    </#if>

    <#if funs.prop("findMode") == "vo">
    @Override
    public List<${xxxx}${name}PageVO> find${xxxx}Page(${xxxx}${name}PageDTO params) throws Exception {
        long count = mapper.find${xxxx}MapsCount(params);
        params.setTotal(count);
        return mapper.find${xxxx}Maps(params);
    }
    <#else>
    @Override
    public List<Map<String, Object>> find${xxxx}Page(${xxxx}PageDTO params) throws Exception {
        long count = mapper.find${xxxx}MapsCount(params);
        page.setTotal(count);
        return mapper.find${xxxx}Maps(params);
    }
    </#if>

