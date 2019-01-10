<div class="layui-form-item">
    <label class="layui-form-label">${title!''}</label>
    <div class="layui-upload">
        <div class="layui-upload-list">
            <img class="layui-upload-img" src="${(o.image)!''}" height="150px" width="150px">
            <input type="hidden" name="${columnName}" value="${r"${(o."+columnName+")!''}"}">
            <button type="button" class="layui-btn layui-btn-sm" id="${name}UploadImageBtn">上传图片</button>
            <input class="layui-upload-file" type="file" name="file" multiple="">
        </div>
    </div>
</div>

<#--分隔符-->
= = = = = = = =

//上传缩略图
upload.render({
    elem: '#${name}UploadImageBtn',
    url: '/upload/image?oss=true=domain=true',
    accept:'image',
    acceptMime:'image/jpeg|image/jpg|image/png|image/gif',
    exts:'jpg|jpeg|png|gif',
    method : "post",
    before: function(obj) {
        //预读本地文件示例，不支持ie8
        var u = this;
        obj.preview(function (index, file, result) {
            u.elem.closest("div").find("img").attr('src',location)
        });
    },
    done: function(res){
        this.elem.closest("div").find("img").attr('src',res.location)
        this.elem.closest("div").find("input[type='hidden']").val(res.pic)
    },
    error:function(c){
        alert(c);
    }
});