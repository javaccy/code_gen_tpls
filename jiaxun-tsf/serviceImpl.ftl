package ${functions.packageName('serviceImpl')};

import ${functions.packageName('entity')}.${name};
import ${functions.packageName('mapper')}.${name}Mapper;
import ${functions.packageName('service')}.I${name}Service;
import com.jiaxun.tsf.common.provider.base.ServiceImpl;

/**
 * <p>
 * ${tableComment} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${tpl.date}
 */
public class ${name}ServiceImpl extends ServiceImpl<${name}Mapper, ${name}> implements I${name}Service {

}
