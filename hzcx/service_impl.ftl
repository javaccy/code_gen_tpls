
import com.soft.ware.core.base.controller.BaseService;
import com.soft.ware.rest.common.persistence.dao.${name}Mapper;
import com.soft.ware.rest.common.persistence.model.${name};
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
@Service
@Transactional
public class ${name}ServiceImpl extends BaseService<${name}Mapper,${name}> implements ${name}Service {

    @Resource
    private ${name}Mapper mapper;

}