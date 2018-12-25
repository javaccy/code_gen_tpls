package com.yyz.company.service.entity.valid;
import com.yyz.company.service.entity.valid.base.Base${name};
import io.jboot.db.annotation.Table;

/**
 * ${tableComment}
 */
@Table(datasource = "${schemaName}",tableName = "${tableName}", primaryKey = "${idName}")
public class ${name} extends Base${name}<${name}> {

    public static final ${name} dao = new ${name}().dao();

    public static String getTableName() {
        return "${tableName}";
    }
}
