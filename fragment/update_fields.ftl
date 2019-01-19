<#list fields as f>
    old.set${f.name?cap_first}(model.get${f.name?cap_first}());
</#list>