package ${functions.packageName('controller')};

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.hlsa.common.utils.other.AjaxResult;
import com.hlsa.common.utils.other.StringUtils;
import com.hlsa.common.utils.other.TableDataInfo;
import com.hlsa.datainput.entity.Firefighter;
import com.hlsa.datainput.service.IFirefighterService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.hlsa.common.utils.other.BaseController;

import java.util.List;
import java.util.ArrayList;

/**
 * <p>
 * ${tableComment} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${datetime}
 */
@Controller
@RequestMapping("/${(tableName?replace(tplGroup.tablePrefix,""))?replace("_","-")}")
public class ${tpl.filePrefix}${name}Controller extends BaseController {

    @Autowired
    private ${funs.filePrefix("service")}${name}${funs.fileSuffix("service")} ${name?uncap_first}Service;

    /**
     * 根据条件分页查询，前端分页传pageNum,pageSize
     * @param ${name?uncap_first}
     * @return
     */
    @GetMapping("/list")
    public TableDataInfo list(${name} ${name?uncap_first}){
        startPage();
        //条件构造器
        QueryWrapper<${name}> queryWrapper = new QueryWrapper<>();

        <#list fields as f>
        <#if f.type.simpleName == 'String' || f.type.simpleName == 'Integer'>
        //根据${f.comment}搜索
        if(StringUtils.isNotEmpty(${name?uncap_first}.get${f.name?cap_first}())){
        queryWrapper.eq("${f.columnName?lower_case}", ${name?uncap_first}.get${f.name?cap_first}());
        }
        </#if>
        </#list>

        List<${name}> list = ${name?uncap_first}${funs.fileSuffix("service")}.list(queryWrapper);
        return getDataTable(list);
   }

    /**
     * 添加
     * @param ${name?uncap_first} ${comment}信息
     * @return AjaxResult 添加结果
     */
    @PostMapping("/add")
    public AjaxResult add(${name} ${name?uncap_first}){
        //${name?uncap_first}.setCreatedBy("");
        ${name?uncap_first}.setCreatedTime(new Date());
        ${name?uncap_first}${funs.fileSuffix("service")}.save(${name?uncap_first});
        return AjaxResult.success();
    }

    /**
    * 修改
    * @param ${name?uncap_first} ${comment}信息
    * @return AjaxResult 修改结果
    */
    @PostMapping("/update")
    public AjaxResult update(${name} ${name?uncap_first}){
        //根据id修改
        ${name} o = ${name?uncap_first}${funs.fileSuffix("service")}.getById(${name?uncap_first});
        BeanUtils.copyProperties(o, ${name?uncap_first});
        //o.setCreatedBy();
        o.setUpdatedTime(new Date());
        ${name?uncap_first}${funs.fileSuffix("service")}.updateById(${name?uncap_first});
        return AjaxResult.success();
    }

    /**
    * 删除
    * @param ${name?uncap_first} ${comment}信息
    * @return AjaxResult 修改结果
    */
    @DeleteMapping("/del")
    public AjaxResult del(${name} ${name?uncap_first}){
        <#if funs.containsColumn("is_delete")>
        ${name?uncap_first}${funs.fileSuffix("service")}.updateById(new ${name}().set${funs.camelcase(idName?lower_case)?cap_first}(${name}.get${funs.camelcase(idName?lower_case)?cap_first}()).setDelFlag(DelFlag.DELETED.name()));
        <#else>
        ${name?uncap_first}${funs.fileSuffix("service")}.removeById(${name?uncap_first}.get${funs.camelcase(idName?lower_case)?cap_first}());
        </#if>
        return AjaxResult.success();
    }


}
