package ${functions.packageName('feign')};

import com.hlsa.common.constant.ServiceId;
import com.hlsa.common.model.dto.Del;
import com.hlsa.common.model.dto.Add;
import com.hlsa.common.model.dto.Edit;
import io.swagger.annotations.ApiOperation;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.hlsa.common.utils.other.AjaxResult;
import com.hlsa.common.utils.other.TableDataInfo;
import ${functions.packageName('DTOList')}.${name}${funs.fileSuffix("DTOList")};
import ${functions.packageName('DTOEdit')}.${name}${funs.fileSuffix("DTOEdit")};

/**
 * @author ${author}
 * @since ${tpl.date}
 */
@FeignClient(value = "${name}Api", path = "/${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}")
public interface ${name}Api {

  String BASE_URL = "/${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}";

  /**
   * 查询列表
   *
   * @param ${name?uncap_first}${funs.fileSuffix("DTOList")} 列表
   * @return TableDataInfo 修改结果
   */
  @ApiOperation(value = "查询")
  @PostMapping("/list")
  TableDataInfo list(${name}${funs.fileSuffix("DTOList")} ${name?uncap_first}${funs.fileSuffix("DTOList")});

  /**
   * 添加
   *
   * @param ${name?uncap_first}${funs.fileSuffix("DTOEdit")} 参数
   * @return AjaxResult 修改结果
   */
  @ApiOperation(value = "新增")
  @PostMapping("/add")
  AjaxResult add(@RequestBody @Validated(value = Add.class) ${name}${funs.fileSuffix("DTOEdit")} ${name?uncap_first}${funs.fileSuffix("DTOEdit")});

  /**
   * 修改
   *
   * @param ${name?uncap_first}${funs.fileSuffix("DTOEdit")} 参数
   * @return AjaxResult 修改结果
   */
  @ApiOperation(value = "更新${comment}")
  @PutMapping("/update")
  AjaxResult update(@RequestBody @Validated(value = Edit.class) ${name}${funs.fileSuffix("DTOEdit")} ${name?uncap_first}${funs.fileSuffix("DTOEdit")});

  <#if funs.prop("delMode") == "requestBody">
  /**
   * 根据id删除 ${tableComment}
   * @param param param.id ${comment}ID
   * @return AjaxResult 删除结果
   */
   @ApiOperation(value = "删除${comment}")
   @PostMapping("/del")
   AjaxResult del(@RequestBody @Validated(value = Del.class) ${name}${funs.fileSuffix("DTOEdit")} param);
  <#else>
  /**
   * 根据id删除 ${tableComment}
   * @param ${funs.camelcase(idName?lower_case)} ${idComment}
   * @return AjaxResult 删除结果
   */
  @ApiOperation(value = "删除${comment}")
  @PostMapping("/del")
  AjaxResult del(@RequestParam("${funs.camelcase(idName?lower_case)}") ${idType.simpleName} ${funs.camelcase(idName?lower_case)});
  </#if>


 /**
  * 根据id查询 ${tableComment}
  * @param ${funs.camelcase(idName?lower_case)}
  * @return 错误码和查询结果(.data)
  */
  @GetMapping(value = "/one")
  AjaxResult one(@RequestParam(value = "${funs.camelcase(idName?lower_case)}") Long ${funs.camelcase(idName?lower_case)});

}
