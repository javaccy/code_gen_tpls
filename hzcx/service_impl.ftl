package ${functions.packageName('service_impl')};
import com.soft.ware.core.base.controller.BaseService;
import ${functions.packageName('mapper')}.${name}Mapper;
import ${functions.packageName('model')}.${name};
import ${functions.packageName('service')}.BannerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
@Service
@Transactional
public class ${name}ServiceImpl extends BaseService<${name}Mapper,${name}> implements ${name}Service {

    @Resource
    private ${name}Mapper mapper;

}