package ${functions.packageName('controller')};

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yunxin.common.core.controller.BaseController;

import com.yunxin.common.core.page.TableDataInfo;
import com.yunxin.common.utils.PageUtils;
import ${functions.packageName('list_vo')}.${name};
import ${functions.packageName('query')}.Query${name};
import ${functions.packageName('service')}.I${name}Service;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
  * <p>
  * 信息项表 前端控制器
  * </p>
  *
  * @author ${funs.prop('author')!default(author)}
  * @since ${tpl.date}
  */
@RestController
@RequestMapping("/${name?uncap_first}")
public class ${name}Controller extends BaseController{

    @Autowired
    private I${name}Service ${name?uncap_first}Service;

${funs.prop("tabLine")?replace("|","")}/**
${funs.prop("tabLine")?replace("|","")} * 查询${tableComment}列表
${funs.prop("tabLine")?replace("|","")} */
${funs.prop("tabLine")?replace("|","")}@PreAuthorize("@ss.hasPermi('${name}:${name}:list')")
${funs.prop("tabLine")?replace("|","")}@GetMapping("/list")
${funs.prop("tabLine")?replace("|","")}@ApiOperation("获取${tableComment}列表")
${funs.prop("tabLine")?replace("|","")}public TableDataInfo<${name}> list(Query${name} query) {
${funs.prop("tabLine")?replace("|","")}     Page${r"<Map<String,Object>>"} page = PageUtils.buildPage();
${funs.prop("tabLine")?replace("|","")}     ${name?uncap_first}Service.select${name}List(query, page);
${funs.prop("tabLine")?replace("|","")}     return getDataTable(page, ${name}.class);
${funs.prop("tabLine")?replace("|","")}}

}

