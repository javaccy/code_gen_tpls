package ${functions.packageName('service_impl')};
import com.soft.ware.core.base.controller.BaseService;
import ${functions.packageName('mapper')}.${name}Mapper;
import ${functions.packageName('model')}.${name};
import  ${functions.packageName('service')}.${functions.filePrefix('service')}${name}Service;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
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
        return maps.isEmpty() ? null : maps.get(0);
    }
    </#if>


}