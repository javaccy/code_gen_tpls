<#import "../macro/macros.ftl" as m>
package ${functions.packageName('edit_bo')};

import io.swagger.annotations.ApiParam;
<#if funs.prop("lombok") == "true">
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.EqualsAndHashCode;
</#if>
<#if funs.prop("swagger") == "true">
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
</#if>
import java.io.Serializable;

/**
 * <p>
 * ${tableComment!'编辑数据'}
 * </p>
 *
 * @author ${funs.prop('author')!default(author)}
 * @since ${tpl.date}
 */
<#if funs.prop("lombok") == "true">
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
</#if>
<#if funs.prop("swagger") == "true">
    @ApiModel(value = "${name}对象", description = "${tableComment!''}")
</#if>
public class ${tpl.filePrefix}${name}${tpl.fileSuffixPrefix} implements Serializable {

${funs.prop("tabLine")?replace("|","")}private static final long serialVersionUID = 1L;

${funs.prop("tabLine")?replace("|","")}/**
${funs.prop("tabLine")?replace("|","")} * ${idComment?default('主键id')}
${funs.prop("tabLine")?replace("|","")} */
${funs.prop("tabLine")?replace("|","")}@ApiParam(value = "${tableComment!''}Id")
${funs.prop("tabLine")?replace("|","")}private ${idType.simpleName} ${idName};


}
