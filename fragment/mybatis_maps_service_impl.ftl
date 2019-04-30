    @Override
    public List<Map<String, Object>> find${funs.properties('findName')}Page(SessionUser user, Page page, GoodsPageParam param) throws Exception {
        Kv<String, Object> params = Kv.obj("ownerId", user.getOwnerId())
        long count = mapper.find${funs.properties('findName')}MapsCount(params);
        page.setTotal(count);
        params.put("page", page);
        return mapper.find${funs.properties('findName')}Maps(params);
    }

    @Override
    public List<Map<String, Object>> find${funs.properties('findName')}Maps(Map<String, Object> map) {
        return mapper.findMaps(map);
    }

    @Override
    public Kv<String, Object> find${funs.properties('findName')}Map(Map<String, Object> map) {
        List<Map<String, Object>> maps = findMaps(map);
        return maps.size() == 1 ? Kv.toKv(maps.get(0)) : null;
    }
