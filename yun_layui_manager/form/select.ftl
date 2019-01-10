<div class="layui-form-item">
    <label class="layui-form-label">${title!'XXXXXXXX'}</label>
    <div class="layui-input-block">
        <select name="${columnName}" value="${r"${(o."+columnName+")!''}"}" lay-verify="required">
            ${r"<#list resolvers.entrySet() as s>"}
            ${r"<#if o?? && s.key == o.status>"}
            <option value="${r"${s.key}"}" selected>${r"${s.value}"}</option>
            ${r"<#else>"}
            <option value="${r"${s.key}"}">${r"${s.value}"}</option>
            ${r"</#if>"}
            ${r"</#list>"}
        </select>
    </div>
</div>