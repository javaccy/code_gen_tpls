package ${functions.packageName('service')};


import ${functions.packageName('entity')}.${name}DO;
<#-- import ${functions.packageName('list_vo')}.${name}; -->
import ${functions.packageName('query')}.Query${name};
import ${functions.packageName('mapper')}.${name}Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 *  <p>
 * ${tableComment} 服务类
 *  </p>
 *
 * @author ${funs.prop('author')!default(author)}
 * @since ${tpl.date}
 */
public interface I${name}Service extends IService<${name}${r"DO>"} {

    List${r"<Map<String,Object>>"} select${name}List(Query${name} query, Page${r"<Map<String,Object>>"} page);

}