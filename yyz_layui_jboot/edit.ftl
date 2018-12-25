@ layout("/template/common/layout.html",{title:'${tableComment}编辑',css:'/static/login/css/style'}){
<div class="layui-card">
    <div class="layui-form layui-card-body" style="padding: 15px;">
            <input type="hidden" name="id" value="${r"${o."+idName+"!''}"}" />
            <#list fields as f>
            <#if f.inputTemplateRender?? && f.inputTemplateRender!="">
            ${f.inputTemplateRender}
            <#else>
                <#if f.columnName?contains('img')>
            <div class="layui-form-item">
                <label class="layui-form-label">${f.title!''}</label>
                <div class="layui-upload">
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" src=${r"${o."+f.columnName+"!''}"}" height="150px" width="150px">
                        <input type="hidden" name="${f.columnName}" value="${r"${(o."+f.columnName+")!''}"}">
                        <button type="button" class="layui-btn layui-btn-sm .uploadBtn">上传图片</button>
                        <input class="layui-upload-file" type="file" name="file" multiple="">
                    </div>
                </div>
            </div>
                <#elseif f.columnName?contains('time')>
            <div class="layui-form-item">
                <label class="layui-form-label">${f.title}</label>
                <div class="layui-input-block">
                    <input type="text" name="${f.columnName}" value="${r"${o."+f.columnName+"!''}"}" lay-verify="required" placeholder="${f.title!'XXX'}" class="layui-input datetime_input">
                </div>
            </div>
                <#else>
            <div class="layui-form-item">
                <label class="layui-form-label">${f.title!'XXXX'}</label>
                <div class="layui-input-block">
                    <input type="text" name="${f.columnName}" value="${r"${o."+f.columnName+"!''}"}" lay-verify="required" placeholder="${f.title!'XXX'}" class="layui-input">
                </div>
            </div>
                </#if>
            </#if>
            </#list>
            <div class="layui-form-item layui-layout-admin">    
                <div class="layui-input-block">
                    <div class="layui-footer" style="left: 0;">
                        <button class="layui-btn layui-hide" lay-submit lay-filter="web-submit">保  存</button>
                    </div>
                </div>
            </div>
    </div>
</div>
<script>
    layui.use(['form','layer','layedit','laydate','upload','tools'],function(form,layer,layedit,laydate,upload,tools){
        form.verify({
            type:function(value,item){
                if(!(/\d+/.test(value))){
                    return '类型不能为空';
                }
            }
        });

        if (top === window) {
            $('[lay-filter=web-submit]').removeClass('layui-hide');
            form.on("submit(web-submit)",function(data){
                if (data.field.id) {
                    layui.tools.post("edit",data.field,function(d){
                        layui.tools.tip(d,"${tableComment}修改成功！","${tableComment}修改失败！")
                    })
                } else {
                    layui.tools.post("add",data.field,function(d){
                        layui.tools.tip(d,"${tableComment}添加成功！","${tableComment}添加失败！")
                    });
                }
                return false;
            });
        }

        tools.initUpload();
        tools.initDateTime();

        <#list fields as f>
            <#if (f.inputTemplateRenders?size > 1)>
                ${f.inputTemplateRenders[1]}
            </#if>
        </#list>
    })
</script>
@}