import io.jboot.db.annotation.Table;

/**
 * ${tableComment}
 * @param <M>
 */
@Table(datasource = "${schemaName}",tableName = "${tableName}", primaryKey = "${idName}")
public class ${name} extends Base${name}<${name}> {

    public static final ${name} dao = new ${name}().dao();

    public static String getTableName() {
        return "${tableName}";
    }
}
