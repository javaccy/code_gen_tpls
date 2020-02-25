<#list fields as f>
    <#if funs.prop("getter") == 'true'>
    public ${f.type.simpleName} get${f.name?cap_first}() {
      return ${f.name};
    }
    </#if>
    <#if funs.prop("setter") == 'true'>
    public ${tpl.filePrefix}${name}${tpl.fileSuffix} set${f.name?cap_first}( ${f.type.simpleName} ${f.name}) {
      this.${f.name} = ${f.name};return this;
    }
    </#if>
</#list>
