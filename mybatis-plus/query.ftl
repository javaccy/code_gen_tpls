package ${functions.packageName('query')};

import io.swagger.annotations.ApiParam;
import lombok.Data;

/**
 *  @author ${funs.prop('author')!default(author)}
 *  @since ${tpl.date}
 */
@Data
public class Query${name} {

${funs.prop("tabLine")?replace("|","")}@ApiParam(hidden = true)
${funs.prop("tabLine")?replace("|","")}private Map${r"<String, Object>"} params = new HashMap<>();

}
