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
    List<Map<String,Object>> findMaps(Map<String,Object> map);

    Kv<String,Object> findMap(Map<String,Object> map);

    ${name?cap_first} findOne(Map<String, Object> map) throws Exception;
    </#if>
}
