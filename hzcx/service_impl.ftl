package ${functions.packageName('service_impl')};
import com.soft.ware.core.base.controller.BaseService;
import com.soft.ware.rest.modular.auth.util.BeanMapUtils;
import ${functions.packageName('mapper')}.${name}Mapper;
import ${functions.packageName('model')}.${name};
import  ${functions.packageName('service')}.${functions.filePrefix('service')}${name}Service;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ${name}ServiceImpl extends BaseService<${name}Mapper,${name}> implements  ${functions.filePrefix('service')}${name}Service {

    @Resource
    private ${name}Mapper mapper;

    <#if (functions.properties('select_map')=='true')??>
    @Override
    public List<Map<String, Object>> findMaps(Map<String, Object> map) {
        return mapper.findMaps(map);
    }

    @Override
    public Map<String, Object> findMap(Map<String, Object> map) {
    List<Map<String, Object>> maps = findMaps(map);
        return maps.size() == 1 ? null : maps.get(0);
    }

    @Override
    public ${name?cap_first} findOne(Map<String,Object> map) throws Exception {
        return BeanMapUtils.toObject(map, ${name?cap_first}.class);
    }
    </#if>


}