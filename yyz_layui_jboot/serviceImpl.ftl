package com.yyz.company.service.provider;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.yyz.commons.common.DB;
import com.yyz.company.service.api.${name}Service;
import com.yyz.company.service.entity.valid.${name};
import io.jboot.aop.annotation.Bean;

import javax.inject.Singleton;

@Bean
@Singleton
public class ${name}ServiceImpl implements ${name}Service {

    @Override
    public Page<Record> findPage(Page<Record> pager, List<Object> params, String where) {
        Page<Record> page = DB.useBusi().paginate(pager.getPageNumber(), pager.getPageSize(), "select ${tableAlias}.* ", "from " + ${name}.getTableName() + " ${tableAlias} where true " + where, params.toArray());
        return page;
    }

    //todo 请删除
    @Override
    public QyPrizeWhite findById(String id, SysUser user) {
        QyPrizeWhite o = getDao().findById(id);
        checkUserModel(o, user);
        return o;
    }
}
