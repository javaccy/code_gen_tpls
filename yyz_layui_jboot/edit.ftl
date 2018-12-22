@ layout("/template/common/layout.html",{title:'${tableComment}编辑',css:'/static/login/css/style'}){
<div class="layui-card">
    <div class="layui-card-body" style="padding: 15px;">
        <form class="layui-form" action="" onsubmit="return false">
            <input type="hidden" name="id" value="${r"${o."+idName+"!''}"}" />
            <#list fields as f>
            <#if f.inputTemplateRender?? && f.inputTemplateRender!="">
            ${f.inputTemplateRender}
            <#else>
            <div class="layui-form-item">
                <label class="layui-form-label">${f.title!'XXXX'}</label>
                <div class="layui-input-block">
                    <input type="text" name="${f.columnName}" value="${r"${o."+f.columnName+"!''}"}" lay-verify="required" placeholder="${f.title!'XXX'}" class="layui-input">
                </div>
            </div>
            </#if>
            </#list>
            <div class="layui-form-item layui-layout-admin">    
                <div class="layui-input-block">
                    <div class="layui-footer" style="left: 0;">
                        <button class="layui-btn" lay-submit="" lay-filter="web-submit">保  存</button>
                    </div>
                </div>
            </div>
        </form>
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
        form.on("submit(web-submit)",function(data){
            if (data.field.id) {
                layui.tools.postTable("./edit",data.field,"${tableComment}修改成功！")
            } else {
                layui.tools.postTable("./add",data.field,"${tableComment}添加成功！")
            }
            return false;
        })

        <#list fields as f>
            <#if (f.inputTemplateRenders?size > 1)>
                ${f.inputTemplateRenders[1]}
            </#if>
        </#list>
    })
</script>
@}