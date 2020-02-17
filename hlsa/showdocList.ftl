

**简要描述：**

- ${comment}列表查询接口

**请求URL：**
- ` http://xx.com/api/${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}/list `

**请求方式：**
- GET

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
<#list fields as f>
|${f.name} |否  |${f.type.simpleName?lower_case} |${f.comment}   |
</#list>

**返回示例**

```
{
    "code": 0,
    "msg": "",
    "total":0,
    "rows": {
        [
            {
            "${funs.camelcase(idName?lower_case)}": 1,
        <#list fields as f>
            <#if f.type.simpleName == 'Integer'>
            "${f.name}": ${1}<#if f_has_next>,</#if>
            <#elseif f.type.simpleName == "Boolean">
            "${f.name}": false<#if f_has_next>,</#if>
            <#elseif f.type.simpleName == "BigDecmail">
            "${f.name}": 0.01<#if f_has_next>,</#if>
            <#else>
            "${f.name}": "${f.comment}"<#if f_has_next>,</#if>
            </#if>
        </#list>
            }
        ]
    }
}
```
**返回参数说明**

|参数名|类型|说明|
|:-----  |:-----|-----                           |
|${funs.camelcase(idName?lower_case)} |${idType.simpleName}   | ID |
<#list fields as f>
|${f.name} |${f.type.simpleName}   | ${f.comment} |
</#list>

**备注**

更多返回错误代码请看首页的错误代码描述











