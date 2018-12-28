<div class="layui-form-item">
    <label class="layui-form-label">${title!''}</label>
    <div class="layui-input-block">
        <textarea name="${columnName}" id="tinymce_${columnName}" placeholder="${title!''}" class="layui-input qy-abstract" style='width:30%'>${r"${(o."+columnName+")!''}"}</textarea>
    </div>
</div>

<#--分隔符-->
= = = = = = = =

tinymce.init({
    selector:'#tinymce_${columnName}',
    height:300,
    width:650,
    language:'zh_CN',
    plugins:['image'],
    automatic_uploads: true,
    images_upload_url: '${r"${basePath}"}/admin/upload/image?oss=true&domain=true',
    images_upload_credentials: true
});