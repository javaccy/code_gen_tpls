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
    List<${xxxx}${name}${r"PageVO>"} find${xxxx}Page(@Param("params") ${xxxx}${name}PageDTO params);
    <#else>

    /**
     * 分页查询
     * @param params 查询参数
     * @return       返回结果
     * @throws Exception 查询失败
     */
    List${r"<Map<String,Object>>"} find${xxxx}Maps(@Param("page") Page page, @Param("params") ${xxxx}${name}PageDTO params);
    </#if>

