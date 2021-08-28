package ${functions.packageName('mapper')};

import ${functions.packageName('entity')}.${name}DO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * ${tableComment}表 Mapper 接口
 * </p>
 *
 * @author ${funs.prop('author')!default(author)}
 * @since ${tpl.date}
 */
public interface ${name}Mapper extends BaseMapper<${name}DO> {

}
