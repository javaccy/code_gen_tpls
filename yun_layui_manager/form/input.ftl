<div class="layui-form-item">
    <label class="layui-form-label">${title?!''}</label>
    <div class="layui-input-block">
        <input type="text" name="${columnName}" value="${r"${(o."+columnName+")!''}"}" lay-verify="required" placeholder="${title!''}" class="layui-input">
    </div>
</div>
