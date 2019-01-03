package com.yyz.company.service.api;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.yyz.commons.jboot.BaseService;
import com.yyz.company.service.entity.sys.SysUser;
import com.yyz.company.service.entity.valid.${name};

import java.util.List;

public interface ${name}Service extends BaseService<${name}>{


    /**
      * 分页查询${tableComment}
      * @param pager
      * @param params
      * @param where
      * @param orderBy
      * @return
    */
    Page<Record> findPage(Page<Record> pager, List<Object> params, String where, String orderBy);


   <#if functions.containsColumn("company_id")>
       /**
       * 根据用户查询
       * @param id
       * @param user
       * @return
       */
       ${name} findById(String id, SysUser user);
   </#if>


}
