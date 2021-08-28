package ${functions.packageName('controller')};

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yunxin.common.core.controller.BaseController;

import com.yunxin.common.core.domain.AjaxResult;
import com.yunxin.common.core.page.TableDataInfo;
import com.yunxin.common.utils.PageUtils;
import com.yunxin.common.utils.StringUtils;
import ${functions.packageName('list_vo')}.${name};
import com.yunxin.dataplatform.entity.collect.Edit${name};
import ${functions.packageName('query')}.Query${name};
import ${functions.packageName('service')}.I${name}Service;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
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

${funs.prop("tabLine")?replace("|","")}/**
${funs.prop("tabLine")?replace("|","")} * 添加采集应用
${funs.prop("tabLine")?replace("|","")} */
${funs.prop("tabLine")?replace("|","")}@PreAuthorize("@ss.hasPermi('CollectApp:CollectApp:add')")
${funs.prop("tabLine")?replace("|","")}@PostMapping("/add")
${funs.prop("tabLine")?replace("|","")}@ApiOperation("添加采集应用列表")
${funs.prop("tabLine")?replace("|","")}public AjaxResult add(@RequestBody EditCollectApp edit) {
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}if (edit.getId() == null) {
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}return AjaxResult.error("数据id不能为空");
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}}
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}return AjaxResult.success();
${funs.prop("tabLine")?replace("|","")}}
${funs.prop("tabLine")?replace("|","")}
${funs.prop("tabLine")?replace("|","")}/**
${funs.prop("tabLine")?replace("|","")}* 编辑采集应用
${funs.prop("tabLine")?replace("|","")}*/
${funs.prop("tabLine")?replace("|","")}@PreAuthorize("@ss.hasPermi('CollectApp:CollectApp:edit')")
${funs.prop("tabLine")?replace("|","")}@PostMapping("/edit")
${funs.prop("tabLine")?replace("|","")}@ApiOperation("编辑采集应用列表")
${funs.prop("tabLine")?replace("|","")}public AjaxResult edit(@RequestBody EditCollectApp edit) {
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}if (edit.getId() == null) {
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}return AjaxResult.error("数据id不能为空");
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}}
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}return AjaxResult.success();
${funs.prop("tabLine")?replace("|","")}}
${funs.prop("tabLine")?replace("|","")}
${funs.prop("tabLine")?replace("|","")}
${funs.prop("tabLine")?replace("|","")}/**
${funs.prop("tabLine")?replace("|","")}* 删除采集应用
${funs.prop("tabLine")?replace("|","")}*/
${funs.prop("tabLine")?replace("|","")}@PreAuthorize("@ss.hasPermi('CollectApp:CollectApp:del')")
${funs.prop("tabLine")?replace("|","")}@DeleteMapping("/del")
${funs.prop("tabLine")?replace("|","")}@ApiOperation("删除采集应用")
${funs.prop("tabLine")?replace("|","")}public AjaxResult del(@RequestParam(value = "id") String id) {
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}if (StringUtils.isBlank(id)) {
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}return AjaxResult.error("数据id不能为空");
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}}
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}String[] ss = StringUtils.split(id, ",");
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}collectAppService.removeByIds(Arrays.asList(ss));
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}return AjaxResult.success();
${funs.prop("tabLine")?replace("|","")}${funs.prop("tabLine")?replace("|","")}}
${funs.prop("tabLine")?replace("|","")}
${funs.prop("tabLine")?replace("|","")}}

