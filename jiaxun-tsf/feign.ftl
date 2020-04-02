package ${functions.packageName('feign')};

import com.jiaxun.tsf.common.model.vo.DataVO;
import com.jiaxun.tsf.common.model.vo.ListVO;
import com.jiaxun.tsf.common.model.vo.BaseVO;
import com.jiaxun.tsf.common.tools.Add;
import com.jiaxun.tsf.common.tools.Edit;
import io.swagger.annotations.ApiOperation;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import ${functions.packageName('vo')}.${name}${funs.fileSuffixPrefix("vo")};
import ${functions.packageName('queryDto')}.${name}${funs.fileSuffixPrefix("queryDto")};
import ${functions.packageName('editDto')}.${name}${funs.fileSuffixPrefix("editDto")};

/**
 * @author ${author}
 * @since ${tpl.date}
 */
@FeignClient(value = "${name}Api", path = "/${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}")
public interface ${name}Api {

  /**
   * 查询列表
   *
   * @param ${name?uncap_first}${funs.fileSuffixPrefix("queryDto")} 列表
   * @return TableDataInfo 修改结果
   */
  @ApiOperation(value = "查询")
  @PostMapping("/list")
  ListVO<${name}${funs.fileSuffixPrefix("vo")}> list(${name}${funs.fileSuffixPrefix("queryDto")} ${name?uncap_first}${funs.fileSuffixPrefix("queryDto")}) throws Exception;

  /**
   * 添加
   *
   * @param ${name?uncap_first}${funs.fileSuffixPrefix("editDto")} 参数
   * @return AjaxResult 修改结果
   */
  @ApiOperation(value = "新增")
  @PostMapping("/add")
  BaseVO add(@RequestBody @Validated(value = Add.class) ${name}${funs.fileSuffixPrefix("editDto")} ${name?uncap_first}${funs.fileSuffixPrefix("editDto")});

  /**
   * 修改
   *
   * @param ${name?uncap_first}${funs.fileSuffixPrefix("editDto")} 参数
   * @return AjaxResult 修改结果
   */
  @ApiOperation(value = "更新${comment!""}")
  @PutMapping("/edit")
  BaseVO update(@RequestBody @Validated(value = Edit.class) ${name}${funs.fileSuffixPrefix("editDto")} ${name?uncap_first}${funs.fileSuffixPrefix("editDto")});

  <#if funs.prop("delMode") == "requestBody">
  /**
   * 根据id删除 ${tableComment}
   * @param param param.id ${comment}ID
   * @return AjaxResult 删除结果
   */
   @ApiOperation(value = "删除${comment}")
   @PostMapping("/del")
   BaseVO del(@RequestBody @Validated(value = Del.class) ${name}${funs.fileSuffixPrefix("editDto")} param);
  <#else>
  /**
   * 根据id删除 ${tableComment}
   * @param ${funs.camelcase(idName?lower_case)} ${idComment!''}
   * @return AjaxResult 删除结果
   */
  @ApiOperation(value = "删除${comment!''}")
  @PostMapping("/del")
  BaseVO del(@RequestParam("${funs.camelcase(idName?lower_case)}") ${idType.simpleName} ${funs.camelcase(idName?lower_case)});
  </#if>


 /**
  * 根据id查询 ${tableComment}
  * @param ${funs.camelcase(idName?lower_case)}
  * @return 错误码和查询结果(.data)
  */
  @GetMapping(value = "/one")
  DataVO<${name}${funs.fileSuffixPrefix("vo")}> one(@RequestParam(value = "${funs.camelcase(idName?lower_case)}") Long ${funs.camelcase(idName?lower_case)}) throws Exception;

}
