@Title(value = "${entity.comment}")
public class ${entity.name} extends DataEntity<${entity.name}, ${entity.idType.simpleName}> {

<#list entity.excludeParentFields as item>
    //${item.comment}
    private ${item.type.simpleName} ${item.name};
</#list>

    public ${entity.name}() {
        super();
    }


<#list entity.excludeParentFields as item>
    @Title(value = "${item.comment}")
    public ${item.type.simpleName} ${item.getMethodName}() {
        return ${item.name};
    }

    public void ${item.setMethodName}(${item.type.simpleName} ${item.name}) {
        this.${item.name} = ${item.name};
    }
</#list>

}