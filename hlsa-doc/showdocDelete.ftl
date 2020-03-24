欢迎使用ShowDoc！

**简要描述：**

- ${comment}根据id删除接口

**请求URL：**
- ` http://xx.com/api/${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}/del `

**请求方式：**
- POST

**参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|${funs.camelcase(idName?lower_case)}|是|${idType.simpleName}|${idColumn.comment}|


**返回示例**

```
{
    "code": 0,
    "msg": "成功",
    "data": {

    }
}
```

**返回参数说明**

|参数名|类型|说明|
|:----|:-----|-----|
|code |string |错误码|
|msg  |string |失败/公共 消息|
|data |object |{}|



**备注**

- 更多返回错误代码请看首页的错误代码描述


