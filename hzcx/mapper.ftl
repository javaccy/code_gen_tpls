package ${functions.packageName('mapper')};
import com.baomidou.mybatisplus.mapper.BaseMapper;
import ${functions.packageName('model')}.${name};
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ${name}Mapper extends BaseMapper<${name}> {

    <#if (functions.properties('select_map')=='true')??>
    List<Map<String, Object>> findMaps(@Param("params") Map<String, Object> params);
    </#if>

    long findMapsCount(@Param("params") Map<String, Object> params);

}
