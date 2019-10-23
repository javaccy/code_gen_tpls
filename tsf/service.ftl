package ${functions.packageName('service')};
import com.baomidou.mybatisplus.extension.service.IService;
<#-- 没用不要了
<#if (functions.properties('select_map')=='true')??>
import com.aiinp.cash.common.tools.Kv;
</#if>
-->
import ${functions.packageName('model')}.${functions.filePrefix('model')}${name};

/**
 * <p>
 * ${tableComment} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${datetime}
 */
public interface ${functions.filePrefix('service')}${name}Service extends IService<${functions.filePrefix('model')}${name}> {

    <#-- 没用不要了
    <#if (functions.properties('select_map')=='true')??>
    List<Map<String,Object>> findMaps(Map<String,Object> params);

    Kv<String,Object> findMap(Map<String,Object> params);

    ${functions.filePrefix('model')}${name?cap_first} findOne(Map<String, Object> params) throws Exception;

    List<${functions.filePrefix('model')}${name?cap_first}> findList(Map<String, Object> params) throws Exception;
    </#if>
    -->
    <#if funs.prop('finds')=='true'>
        <#import "../macro/macros.ftl" as m>
        <#list tplGroup.properties as p>
            <#if p.key?starts_with('findName')>
                <#if p.value != "false">
                    <@m.mybatis_maps_service p.value/>

                </#if>
            </#if>
        </#list>

    </#if>

}
