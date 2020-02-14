package ${functions.packageName('serviceImpl')};

import ${functions.packageName('entity')};
import ${functions.packageName('mapper')};
import ${functions.packageName('service')};
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
