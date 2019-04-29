package ${functions.packageName('service_impl')};
import com.soft.ware.core.base.controller.BaseService;
<#if (functions.properties('select_map')=='true')??>
    import com.soft.ware.core.util.Kv;
</#if>
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
    public List<Map<String, Object>> findMaps(Map<String, Object> params) {
        return mapper.findMaps(params);
    }

    @Override
    public Kv<String, Object> findMap(Map<String, Object> params) {
        List<Map<String, Object>> maps = findMaps(params);
        return maps.size() == 1 ? null : Kv.toKv(maps.get(0));
    }

    @Override
    public ${name?cap_first} findOne(Map<String,Object> params) throws Exception {
        return BeanMapUtils.toObject(params, ${name?cap_first}.class);
    }
    @Override
    public List<${name?cap_first}> findList(Map<String,Object> params) throws Exception {
        List<Map<String, Object>> maps = findMaps(params);
        return BeanMapUtils.toObject(maps, TOwnerStaff.class);
    }
    </#if>


}