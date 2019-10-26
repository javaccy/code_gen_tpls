    <#assign xxxx=''/>
    <#if mybatisFindName??>
        <#assign xxxx=mybatisFindName/>
    <#else >
        <#assign xxxx=funs.prop('findName')/>
    </#if>
    <#if funs.prop("findMode") == "vo">
    @Override
    public List<${xxxx}${name}PageVO> find${xxxx}${name}Page(${xxxx}${name}PageDTO params) throws Exception {
        long count = mapper.find${xxxx}MapsCount(params);
        params.setTotal(count);
        return mapper.find${xxxx}Maps(params);
    }
    <#else>
    @Override
    public List<Map<String, Object>> find${xxxx}Page(Page page, ${xxxx}PageParam param) throws Exception {
        Kv<String, Object> params = Kv.obj("ownerId", param.getOwnerId());
        long count = mapper.find${xxxx}MapsCount(params);
        page.setTotal(count);
        params.put("page", page);
        return mapper.find${xxxx}Maps(params);
    }

    @Override
    public List<Map<String, Object>> find${xxxx}Maps(Map<String, Object> map) {
        return mapper.findMaps(map);
    }

    @Override
    public Kv<String, Object> find${xxxx}Map(Map<String, Object> map) {
        List<Map<String, Object>> maps = findMaps(map);
        return maps.size() == 1 ? Kv.toKv(maps.get(0)) : null;
    }
    </#if>

