package ${functions.packageName('mapper')};
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import ${functions.packageName('model')}.${functions.filePrefix('model')}${name};

/**
 * <p>
 * ${tableComment} Mapper 接口111
 * </p>
 *
 * @author ${author}
 * @since ${datetime}
 */
public interface ${name}Mapper extends BaseMapper<${functions.filePrefix('model')}${name}> {
    <#-- 没用不要了
    <#if (functions.properties('select_map')=='true')??>
    List<Map<String, Object>> findMaps(@Param("params") Map<String, Object> params);
    </#if>
    -->
    <#-- 没用不要了
    long findMapsCount(@Param("params") Map<String, Object> params);
    -->
    <#if funs.prop('finds')=='true'>
        <#import "../macro/macros.ftl" as m>
        <#list tplGroup.properties as p>
            <#if p.key?starts_with('findName')>
                <#if p.value != "false">
                    <@m.mybatis_maps_mapper p.value/>

                </#if>
            </#if>
        </#list>
    </#if>

}
