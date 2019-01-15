@ layout("/template/common/layout.html",{title:'${tableComment}列表',css:'/static/login/css/style'}){
<div class="layui-card">
    <div class="layui-card-body">
        <div class="layui-form" style="padding-bottom: 10px;">
                <input type="text" class="layui-input layui-input-inline layui-input-search" style="width: 200px" name="param" placeholder="名字">
                <button class="layui-btn" type="submit" lay-submit lay-filter="search-submit">查询</button>
                <button class="layui-btn" type="submit" lay-submit lay-filter="export-submit">导出</button>
                <button class="layui-btn layuiadmin-btn-useradmin" id="add" data-type="add">添加</button>
        </div>
        <table id="newsList" lay-filter="newsList"></table>
        <script type="text/html" id="newsListBar"> </script>
    </div>
</div>
<script type="text/javascript">
    layui.use(['jquery','form','layer','laydate','table','laytpl','tools'],function($,form,layer,laydate,table,laytpl,tools){
        var tableIns = table.render({
            id : "newsList",
            elem: '#newsList',
            url : 'pageJson',
            cellMinWidth : 95,
            page : true,
            height : "full",
            limit : 20,
            limits : [10,15,20,25],
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
            tableIns.reload({where:edit.field,page: {curr: 1}});
        });

        form.on("submit(search-submit)",function(edit){
            edit.field.excel = true;
            tools.postDownload("pageExport",edit.field)
        });


        function edit(edit){
            tools.openFrameForm('edit?id='+edit.id,"编辑${tableComment!"XXXXXXXXXXX"}",{tableInstance:tableIns,area:['50%','70%']})
            /*var index = layui.layer.open({
                title : "${tableComment!"XXXXXXXXXXX"}编辑",
                type : 2,
                content : "edit?id="+edit.id,
                area: ['800px', '600px'],
                success : function(layero, index){
                }
            })*/
            //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
            /*$(window).on("resize",function(){
                layui.layer.full(index);
            })*/
        }


        $("#add").on("click",function(){
            tools.openFrameForm('add',"添加${tableComment!"XXXXXXXXXXX"}",{tableInstance:tableIns,area:['50%','70%']})
            /*var index = layui.layer.open({
                title : "${tableComment!"XXXXXXXXXXX"}添加",
                type : 2,
                content : "add",
                area: ['800px', '600px'],
                success : function(layero, index){
                }
            });*/
        });

        function del(edit){
            tools.del("del",{id:edit.id},tableIns);
        }
        $("#add").trigger("click")

    })
</script>
@}