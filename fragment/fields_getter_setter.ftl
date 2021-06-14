<#list fields as f>
    <#if funs.prop("getter") == 'true'>
${funs.prop("tabLine")?replace("|","")}public ${funs.prop("type.mapping." + f.type.simpleName, f.type.simpleName)} get${f.name?cap_first}() {
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}return ${f.name};
${funs.prop("tabLine")?replace("|","")}}

    </#if>
    <#if funs.prop("setter") == 'true'>
        <#if funs.prop("fluentSetter") == "false">
${funs.prop("tabLine")?replace("|","")}public void set${f.name?cap_first}(${funs.prop("type.mapping." + f.type.simpleName, f.type.simpleName)} ${f.name}) {
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}this.${f.name} = ${f.name};
${funs.prop("tabLine")?replace("|","")}}
        <#else>
${funs.prop("tabLine")?replace("|","")}public ${tpl.filePrefix}${name}${tpl.fileSuffixPrefix} set${f.name?cap_first}(${funs.prop("type.mapping." + f.type.simpleName, f.type.simpleName)} ${f.name}) {
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}this.${f.name} = ${f.name};return this;
${funs.prop("tabLine")?replace("|","")}}
        </#if>

    </#if>
</#list>
