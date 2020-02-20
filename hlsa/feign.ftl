package ${functions.packageName('feign')};

import io.swagger.annotations.ApiOperation;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
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
 * @since ${date}
 */
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
  AjaxResult add(@RequestBody @Validated ${name}${funs.fileSuffix("DTOEdit")} ${name?uncap_first}${funs.fileSuffix("DTOEdit")});

  /**
   * 修改
   *
   * @param ${name?uncap_first}${funs.fileSuffix("DTOEdit")} 参数
   * @return AjaxResult 修改结果
   */
  @ApiOperation(value = "更新${comment}")
  @PutMapping("/update")
  AjaxResult update(@RequestBody @Validated ${name}${funs.fileSuffix("DTOEdit")} ${name?uncap_first}${funs.fileSuffix("DTOEdit")});

  /**
   * 删除
   *
   * @param id ${idComment}
   * @return AjaxResult 删除结果
   */
  @ApiOperation(value = "删除${comment}")
  @DeleteMapping("/del")
  AjaxResult del(@RequestParam("id") ${idType.simpleName} id);

}
