<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>${tableComment!"XXXXXXXXXXX"}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${r"${basePath}"}/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${r"${basePath}"}/css/admin.css" media="all" />
</head>
<body>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div style="padding-bottom: 10px;">
                <form onsubmit="return false">
                    <input type="text" class="layui-input layui-input-inline layui-input-search" style="width: 200px" name="param" placeholder="名字">
                    <button class="layui-btn" type="submit" lay-submit lay-filter="search-submit">查询</button>
                    <button class="layui-btn layuiadmin-btn-useradmin" id="add" data-type="add">添加</button>
                </form>
            </div>
            <table id="newsList" lay-filter="newsList"></table>
            <script type="text/html" id="newsListBar"> </script>
        </div>
    </div>
</div>
<script type="text/javascript" src="${r"${basePath}"}/layui/layui.js"></script>
<script type="text/html" id="tableImageTpl">
    <img src="{{d.avatar_url}}"/>
</script>
<script type="text/javascript">
    layui.config({
        base:'../../js/modules/'
    });
    layui.use(['jquery','form','layer','laydate','table','laytpl','tools'],function($,form,layer,laydate,table,laytpl,tools){
        var tableIns = table.render({
            elem: '#newsList',
            url : 'pageJson',
            cellMinWidth : 95,
            page : true,
            height : "full",
            limit : 20,
            limits : [10,15,20,25],
            id : "newsListTable",
            cols : [[
                {type:'numbers'},
                <#list fields as f>
                    {field: '${f.columnName}', title: '${f.title!''}',align:'center'},
                </#list>
                {title: '操作',fixed:"right",align:"center",templet:function(d){
                        var as = [];
                        as.push('<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="edit">编辑</a>');
                        as.push('<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del">删除</a>');
                        return as.join("\n");
                    }}
            ]],
            done:function(a){
                //layui.tools.addTree("/agency/inOutList",a.data,this)
            }
        });

        //列表操作
        table.on('tool(newsList)', function(obj){
            eval(obj.event+"(obj.data)");
        });

        form.on("submit(search-submit)",function(edit){
            var params = [];
            layui.jquery.each(edit.form.elements,function(i,n){
                if(n.value && n.name){
                    params.push(n.name+"="+n.value);
                }
            });
            tableIns.reload({url:"pageJson?"+params.join("&")});
        });


        function edit(edit){
            var index = layui.layer.open({
                title : "${tableComment!"XXXXXXXXXXX"}编辑",
                type : 2,
                content : "edit?id="+edit.id,
                area: ['800px', '600px'],
                success : function(layero, index){
                }
            })
            //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
            /*$(window).on("resize",function(){
                layui.layer.full(index);
            })*/
        }


        $("#add").on("click",function(){
            var index = layui.layer.open({
                title : "${tableComment!"XXXXXXXXXXX"}添加",
                type : 2,
                content : "add",
                area: ['800px', '600px'],
                success : function(layero, index){
                }
            });
        });

        function del(edit){
            layer.confirm('确定删除此${tableComment!"XXXXXXXXXXX"}？',{icon:3, title:'提示信息'},function(index){
                tools.post("del?id="+edit.id,{},function(){
                    tableIns.reload()
                });
                layer.close(index);
            });
        }


    })
</script>
<style type="text/css">
    tbody .laytable-cell-1-avatar_url{
        height:100px;
    }
</style>
</body>

</html>