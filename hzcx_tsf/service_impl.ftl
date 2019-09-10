package ${functions.packageName('service_impl')};
import com.aiinp.cash.provider.base.BaseService;
<#--
<#if (functions.properties('select_map')=='true')??>
import com.aiinp.cash.common.tools.Kv;
</#if>
-->
import ${functions.packageName('mapper')}.${name}Mapper;
import ${functions.packageName('model')}.${functions.filePrefix('model')}${name};
import  ${functions.packageName('service')}.${functions.filePrefix('service')}${name}Service;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * <p>
 * ${tableComment} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${datetime}
 */
@Service
@Transactional(rollbackFor = Throwable.class)
public class ${name}ServiceImpl extends BaseService<${name}Mapper,${functions.filePrefix('model')}${name}> implements  ${functions.filePrefix('service')}${name}Service {

    @Resource
    private ${name}Mapper mapper;
    <#--
    <#if (functions.properties('select_map')=='true')??>
    @Override
    public List<Map<String, Object>> findMaps(Map<String, Object> params) {
        return mapper.findMaps(params);
    }

    @Override
    public Kv<String, Object> findMap(Map<String, Object> params) {
        List<Map<String, Object>> maps = findMaps(params);
        return maps.size() == 1 ? Kv.toKv(maps.get(0)) : null;
    }

    @Override
    public ${functions.filePrefix('model')}${name?cap_first} findOne(Map<String,Object> params) throws Exception {
        return BeanMapUtils.toObject(findMap(params), ${functions.filePrefix('model')}${name?cap_first}.class);
    }
    @Override
    public List<${functions.filePrefix('model')}${name?cap_first}> findList(Map<String,Object> params) throws Exception {
        List<Map<String, Object>> maps = findMaps(params);
        return BeanMapUtils.toObject(maps, ${functions.filePrefix('model')}${name?cap_first}.class);
    }
    </#if>
    -->
    <#if funs.prop('finds')=='true'>
        <#import "../macro/macros.ftl" as m>
        <#list tplGroup.properties as p>
            <#if p.key?starts_with('findName')>
                <#if p.value != "false">
                <@m.mybatis_maps_service_impl p.value/>

                </#if>
            </#if>
        </#list>

    </#if>



}
