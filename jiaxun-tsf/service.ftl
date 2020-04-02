package ${functions.packageName('service')};

import ${functions.packageName('entity')}.${name};
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * ${tableComment} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${tpl.date}
 */
@Service
public interface I${name}Service extends IService<${name}> {

}
