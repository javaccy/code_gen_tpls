@ layout("/template/common/layout.html",{title:'${tableComment}添加',css:'/static/login/css/style'}){
<div class="layui-card">
    <div class="layui-card-body">
        <div class="layui-form" style="padding-bottom: 10px;">
                <input type="text" class="layui-input layui-input-inline layui-input-search" style="width: 200px" name="param" placeholder="名字">
                <button class="layui-btn" type="submit" lay-submit lay-filter="search-submit">查询</button>
                <button class="layui-btn layuiadmin-btn-useradmin" id="add" data-type="add">添加</button>
        </div>
        <table id="newsList" lay-filter="newsList"></table>
        <script type="text/html" id="newsListBar"> </script>
    </div>
</div>
<script type="text/html" id="tableImageTpl">
    <img src="{{d.avatar_url}}"/>
</script>
<script type="text/javascript">
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
            tableIns.reload({where:edit.field});
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

//未激活
public static Integer zhuangtai_0 = 0;
//激活
public static Integer zhuangtai_1 = 1;
//失效
public static Integer zhuangtai_2 = 2;
//无
public static String prize_type_0 = "0";
//红包
public static String prize_type_1 = "1";
//彩票积分
public static String prize_type_2 = "2";
//未领取
public static String prize_status_0 = "0";
//已领取
public static String prize_status_1 = "1";
//已回收
public static String prize_status_2 = "2";
//未窜货，
public static String is_flee_0 = "0";
//窜货
public static String is_flee_1 = "1";


public static Kv zhuangtaiKvs = Kv.create()
.set(zhuangtai_0,"未激活")
.set(zhuangtai_1,"激活")
.set(zhuangtai_2,"失效");
public static Kv prizeTypeKvs = Kv.create()
.set(prize_type_0,"无")
.set(prize_type_1,"红包")
.set(prize_type_2,"彩票积分");
public static Kv prizeStatusKvs = Kv.create()
.set(prize_status_0,"未领取")
.set(prize_status_1,"已领取")
.set(prize_status_2,"已回收");
public static Kv isFleeKvs = Kv.create()
.set(is_flee_0,"未窜货，")
.set(is_flee_1,"窜货");

setAttr("zhuangtaiKvs", Kami.zhuangtaiKvs);
setAttr("prizeTypeKvs", Kami.prizeTypeKvs);
setAttr("prizeStatusKvs", Kami.prizeStatusKvs);
setAttr("isFleeKvs", Kami.isFleeKvs);

<style type="text/css">
    tbody .laytable-cell-1-avatar_url{
        height:100px;
    }
</style>
@}