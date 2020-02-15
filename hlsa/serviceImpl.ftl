package ${functions.packageName('serviceImpl')};

import ${functions.packageName('entity')}.${name};
import ${functions.packageName('mapper')}.${name}Mapper;
import ${functions.packageName('service')}.I${name}Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * ${tableComment} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${datetime}
 */
@Service
public class ${name}ServiceImpl extends ServiceImpl<${name}Mapper, ${name}> implements I${name}Service {

}
