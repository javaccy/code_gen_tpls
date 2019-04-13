package ${functions.packageName('mapper')};
import com.baomidou.mybatisplus.mapper.BaseMapper;
import ${functions.packageName('model')}.${name};

public interface ${name}Mapper extends BaseMapper<${name}> {
    <#if (functions.properties('select_map')=='true')??>
    List<Map<String, Object>> findMaps(@Param("params") Map<String, Object> params);
    </#if>

}
