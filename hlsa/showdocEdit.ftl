**请求URL：**
- ` http://xx.com/api/${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}/edit `

**请求方式：**
- POST

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|${funs.camelcase(idName?lower_case)}|是|${idType.simpleName}|${idColumn.comment}|
<#list fields as f>
    <#if f.columnName?lower_case == "create_time" || f.columnName?lower_case == "update_time" || f.columnName?lower_case == "create_by" || f.columnName?lower_case == "update_by" || f.columnName?lower_case == "is_delete" || f.columnName?lower_case == "del_flag" || f.columnName?lower_case == "is_use">
        <#continue >
    <#else>
|${f.name} |否  |${f.type.simpleName?lower_case} |${f.comment}   |
    </#if>
</#list>
**返回示例**

```
{
    "code": 0,
    "msg": "",
    "data": {

    }
}
```

**返回参数说明**
|


**备注**

- 更多返回错误代码请看首页的错误代码描述
