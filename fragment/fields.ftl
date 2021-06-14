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
${funs.prop("tabLine")?replace("|","")}/**
${funs.prop("tabLine")?replace("|","")} * ${f.comment!''}
${funs.prop("tabLine")?replace("|","")} */
  <#elseif functions.properties('comment') == 'swagger'>
${funs.prop("tabLine")?replace("|","")}@ApiModelProperty(value = "${f.comment}")
  <#else>
${funs.prop("tabLine")?replace("|","")}//${f.comment}
  </#if>
  <#if functions.properties('jsonField')=='true'>
      <#if f.columnName?contains("_") && f.type.name == 'java.util.Date'>
${funs.prop("tabLine")?replace("|","")}@JSONField(name = "${f.columnName}", format = "yyyy-MM-dd HH:mm:ss")
      </#if>
      <#if f.columnName?contains("_") && f.type.name != 'java.util.Date'>
${funs.prop("tabLine")?replace("|","")}@JSONField(name = "${f.columnName}")
      </#if>
  </#if>
  <#if functions.properties('jsonFormat')=='true'>
      <#if f.type.name == 'java.util.Date' >
${funs.prop("tabLine")?replace("|","")}@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
      <#elseif f.type.name == 'java.time.LocalDate'>
${funs.prop("tabLine")?replace("|","")}@JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
      <#elseif f.type.name == 'java.time.LocalDateTime'>
${funs.prop("tabLine")?replace("|","")}@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
      <#elseif f.type.name == 'java.time.LocalTime'>
${funs.prop("tabLine")?replace("|","")}@JsonFormat(pattern = "HH:mm:ss",timezone="GMT+8")
      </#if>
  </#if>
  <#if functions.properties('jsonProperty')=='true'>
      <#if f.columnName?contains("_")>
${funs.prop("tabLine")?replace("|","")}@JsonProperty(value = "${f.name}")
      </#if>
  </#if>
  <#if funs.prop('tableField')=='true' && f.columnName?contains("_")>
${funs.prop("tabLine")?replace("|","")}@TableField("${f.columnName}")
  </#if>
${funs.prop("tabLine")?replace("|","")}private ${funs.prop("type.mapping."+f.type.simpleName,f.type.simpleName)} ${f.name};

</#list>
