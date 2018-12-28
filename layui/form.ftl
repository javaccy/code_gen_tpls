<#list fields as f>
    <#if f.inputTemplateRender?? && f.inputTemplateRender!="">
        ${f.inputTemplateRender}
    <#else>
        <div class="layui-form-item">
            <label class="layui-form-label">${f.title!'XXXX'}</label>
            <div class="layui-input-block">
                <input type="text" name="${f.columnName}" value="${r"${(o."+f.columnName+")!''}"}" lay-verify="required" placeholder="${f.title!'XXX'}" class="layui-input">
            </div>
        </div>
    </#if>
</#list>