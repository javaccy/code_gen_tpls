    <#assign xxxx=''/>
    <#if mybatisFindName??>
        <#assign xxxx=mybatisFindName/>
    <#else >
        <#assign xxxx=funs.prop('findName')/>
    </#if>

    <#if funs.prop("findMode") == "vo">

    /**
     * 分页查询
     * @param params 查询参数
     * @return       返回结果
     * @throws Exception 查询失败
     */
    List<${xxxx}${name}PageVO> find${xxxx}Page(${xxxx}${name}PageDTO params) throws Exception;
    <#else>

    /**
     * 分页查询
     * @param params 查询参数
     * @return       返回结果
     * @throws Exception 查询失败
     */
    List<Map<String, Object>> find${xxxx}Page(${xxxx}PageDTO params) throws Exception;
    </#if>

