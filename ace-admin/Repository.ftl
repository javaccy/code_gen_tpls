import com.javaccy.core.annotation.MyBatisDao;
import com.javaccy.core.persistence.mapper.CrudMapper;

@MyBatisDao
public interface ${entity.name}Repository extends CrudMapper<${entity.name},${entity.idType.simpleName}>  {

}