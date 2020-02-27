<#assign currentTplName=''/>
<#if tplName??>
    <#assign currentTplName=tplName/>
<#else>
    <#assign currentTplName=""/>
</#if>
<#list fields as f>
  <#if (currentTplName == "entity") && (f.columnName == "create_time" || f.columnName == "update_time" || f.columnName == "create_by" || f.columnName == "update_by" || f.columnName == "remark")>
      <#continue >
  <#elseif (currentTplName == "DTOEdit") && (f.columnName == "create_time" || f.columnName == "update_time" || f.columnName == "create_by" || f.columnName == "update_by" || f.columnName == "is_delete")>
      <#continue >
  <#elseif (currentTplName == "ListEdit") && (f.columnName == "create_time" || f.columnName == "update_time")>
      <#continue >
  </#if>
  <#if functions.properties('comment') == 'doc'>
  /**
   * ${f.comment!''}
   */
  <#elseif functions.properties('comment') == 'swagger'>
  @ApiModelProperty(value = "${f.comment}")
  <#else>
  //${f.comment}
  </#if>
  <#if functions.properties('jsonField')=='true'>
      <#if f.columnName?contains("_") && f.type.name = 'java.util.Date'>
  @JSONField(name = "${f.columnName}", format = "yyyy-MM-dd HH:mm:ss")
      </#if>
      <#if f.columnName?contains("_") && f.type.name != 'java.util.Date'>
  @JSONField(name = "${f.columnName}")
      </#if>
  </#if>
  <#if functions.properties('jsonFormat')=='true'>
      <#if f.type.name = 'java.util.Date'>
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
      </#if>
  </#if>
  <#if functions.properties('jsonProperty')=='true'>
      <#if f.columnName?contains("_")>
  @JsonProperty(value = "${f.name}")
      </#if>
  </#if>
  <#if funs.prop('tableField')=='true' && f.columnName?contains("_")>
  @TableField("${f.columnName}")
  </#if>
  private ${f.type.simpleName} ${f.name};
</#list>
