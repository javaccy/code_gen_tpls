<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${tableName}编辑</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../css/admin.css" media="all">
</head>
<body>
<div class="layui-card">
    <div class="layui-card-body" style="padding: 15px;">
        <form class="layui-form" action="" onsubmit="return false">
            <input type="hidden" name="id" value="${r"${(o."+idName+")!''}"}" />
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
<script src="../../layui/layui.js"></script>
<script>
    layui.config({
        base:'../../js/modules/'
    });
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
</body>

</html>
