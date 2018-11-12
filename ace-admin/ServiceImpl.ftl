import com.javaccy.core.persistence.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* Created by cc on 2015/12/3.
*/
@Service
@Transactional
public class ${entity.name}ServiceImpl extends BaseServiceImpl<${entity.name},${entity.name}Repository,String> implements ${entity.name}Service{

@Autowired
private ${entity.name}Repository ${entity.uncapitalizeName}Repository;



}