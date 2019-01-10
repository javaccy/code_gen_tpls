package com.yyz.company.service.entity.valid;
import com.yun.model.base.Base${name};
import com.zcurd.common.util.ModelUtils;
import com.zcurd.model.SysUser;

// todo arpAir.addMapping("${tableName}", ${name}.class);
/**
 * ${tableComment}
 */
public class ${name} extends Base${name}<${name}> {

    public static final ${name} dao = new ${name}().dao();

    public static String getTableName() {
        return "${tableName}";
    }

<#if functions.containsColumn("company_id")>
    public ${name} findByIdAndUser(String id, SysUser user) {
        ${name} o = dao.findById(id);
        ModelUtils.checkUserModel(o, user);
        return o;
    }
</#if>
}
