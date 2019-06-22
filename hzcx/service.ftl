package ${functions.packageName('service')};
import com.soft.ware.core.base.controller.IIService;
<#if (functions.properties('select_map')=='true')??>
import com.soft.ware.core.util.Kv;
</#if>
import ${functions.packageName('model')}.${name};

import java.util.List;
import java.util.Map;

/**
 * <p>
 * ${tableComment} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${datetime}
 */
public interface ${functions.filePrefix('service')}${name}Service extends IIService<${name}> {

    <#if (functions.properties('select_map')=='true')??>
    List<Map<String,Object>> findMaps(Map<String,Object> params);

    Kv<String,Object> findMap(Map<String,Object> params);

    ${name?cap_first} findOne(Map<String, Object> params) throws Exception;

    List<${name?cap_first}> findList(Map<String, Object> params) throws Exception;
    </#if>
}
