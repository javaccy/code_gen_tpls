package ${functions.packageName('mapper')};

import com.jiaxun.tsf.common.provider.base.BaseMapper;
import ${functions.packageName('entity')}.${name};
<#--import com.baomidou.mybatisplus.core.mapper.BaseMapper;-->

/**
 * <p>
 * ${tableComment} Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since ${tpl.date}
 */
public interface ${name}Mapper extends BaseMapper<${name}> {

}
