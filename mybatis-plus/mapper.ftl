package ${functions.packageName('mapper')};

import ${functions.packageName('entity')}.${name}DO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * <p>
 * ${tableComment}表 Mapper 接口
 * </p>
 *
 * @author ${funs.prop('author')!default(author)}
 * @since ${tpl.date}
 */
public interface ${name}Mapper extends BaseMapper<${name}${r"DO>"} {

 ${funs.prop("tabLine")?replace("|","")}List${r"<Map<String, Object>>"} select${name}List(@Param("page") Page${r"<Map<String, Object>>"} page, @Param("p") Map${r"<String, Object>"} param);

}
