    <#assign xxxx=''/>
    <#if mybatisFindName??>
        <#assign xxxx=mybatisFindName/>
    <#else >
        <#assign xxxx=funs.prop('findName')/>
    </#if>
    @Override
    public List<Map<String, Object>> find${xxxx}Page(String ownerId, Page page, ${xxxx}PageParam param) throws Exception {
        Kv<String, Object> params = Kv.obj("ownerId", user.getOwnerId())
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
