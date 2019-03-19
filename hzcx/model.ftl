
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import org.hibernate.validator.constraints.NotBlank;

import java.io.Serializable;
/**
  * ${tableComment}
*/
@TableName("${tableName}")
public class ${name} extends Model<${name}> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private ${idType.simpleName} ${idName?lower_case};

    <#list fields as f>
    //${f.comment}
    private ${f.type.simpleName} ${f.name};
    </#list>

    <#list fields as f>
    public ${f.type.simpleName} get${f.name?cap_first}(){
        return ${f.name};
    }

    public void set${f.name?cap_first}( ${f.type.simpleName} ${f.name}){
        this.${f.name} = ${f.name};
    }
    </#list>


    public  ${idType.simpleName} get${idName?cap_first}(){
        return ${idName?lower_case};
    }

    public  void set${idName?cap_first}(${idType.simpleName} ${idName?lower_case}){
        this.${idName?lower_case} = ${idName?lower_case};
    }


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