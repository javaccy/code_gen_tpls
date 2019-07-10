package ${functions.packageName('mapper')};
import com.baomidou.mybatisplus.mapper.BaseMapper;
import ${functions.packageName('model')}.${name};
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * ${tableComment} Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since ${datetime}
 */
public interface ${name}Mapper extends BaseMapper<${name}> {

    <#if (functions.properties('select_map')=='true')??>
    List<Map<String, Object>> findMaps(@Param("params") Map<String, Object> params);
    </#if>

    long findMapsCount(@Param("params") Map<String, Object> params);

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
