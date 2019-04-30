package ${functions.packageName('service')};
import com.baomidou.mybatisplus.service.IService;
<#if (functions.properties('select_map')=='true')??>
import com.soft.ware.core.util.Kv;
</#if>
import ${functions.packageName('model')}.${name};

import java.util.List;
import java.util.Map;

public interface ${functions.filePrefix('service')}${name}Service extends IService<${name}> {

    <#if (functions.properties('select_map')=='true')??>
    List<Map<String,Object>> findMaps(Map<String,Object> params);

    Kv<String,Object> findMap(Map<String,Object> params);

    ${name?cap_first} findOne(Map<String, Object> params) throws Exception;

    List<${name?cap_first}> findList(Map<String, Object> params) throws Exception;
    </#if>
}
