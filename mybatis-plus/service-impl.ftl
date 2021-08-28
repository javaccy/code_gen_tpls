package ${functions.packageName('service-impl')};

import ${functions.packageName('entity')}.${name}DO;
<#-- import ${functions.packageName('list_vo')}.${name}; -->
import ${functions.packageName('query')}.Query${name};
import ${functions.packageName('mapper')}.${name}Mapper;
import ${functions.packageName('service')}.I${name}Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * ${tableComment} 服务实现类
 * </p>
 *
 * @author ${funs.prop('author')!default(author)}
 * @since ${tpl.date}
 */
@Service
public class ${name}ServiceImpl extends ServiceImpl<${name}Mapper, ${name}DO> implements I${name}Service {

    @Override
    public List${r"<Map<String,Object>>"} select${name}List(Query${name} query, Page${r"<Map<String,Object>>"} page) {
        return null;
    }

}