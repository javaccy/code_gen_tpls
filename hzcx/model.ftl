package ${functions.packageName('model')};
import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;
/**
  * ${tableComment}
*/
@TableName("${tableName}")
public class ${name} extends Model<${name}> {

    private static final long serialVersionUID = 1L;

    <#if idType.name == 'java.lang.String'>
    @TableId(value = "id", type = IdType.UUID)
    <#else>
    @TableId(value = "id", type = IdType.AUTO)
    </#if>
    private ${idType.simpleName} ${idName?lower_case};

    <#list fields as f>
    //${f.comment}
    <#if f.columnName?contains("_") && f.type.name = 'java.util.Date'>
    @JSONField(name = "${f.columnName}", format = "YYYY-MM-DD HH:mm:ss")
    </#if>
    <#if f.columnName?contains("_") && f.type.name != 'java.util.Date'>
    @JSONField(name = "${f.columnName}")
    </#if>
    private ${f.type.simpleName} ${f.name};
    </#list>


    public ${idType.simpleName} get${idName?cap_first}(){
        return ${idName?lower_case};
    }

    public ${name} set${idName?cap_first}(${idType.simpleName} ${idName?lower_case}){
        this.${idName?lower_case} = ${idName?lower_case};
        return this;
    }


    <#list fields as f>
    public ${f.type.simpleName} get${f.name?cap_first}(){
        return ${f.name};
    }

    public ${name} set${f.name?cap_first}( ${f.type.simpleName} ${f.name}){
        this.${f.name} = ${f.name};
        return this;
    }
    </#list>



    @Override
    protected Serializable pkVal() {
        return this.${idName?lower_case};
    }

    @Override
    public String toString() {
        return "${name}{" +
        "${idName?lower_case}=" + ${idName?lower_case} +
        <#list fields as f>
            ", ${f.name}=" + ${f.name} +
        </#list>
        "}";
    }

}