package ${funs.packageName("controller")};

import ${funs.packageName("feign_service")}.${functions.filePrefix('feign_service')}${name}${functions.fileSuffix('feign_service')};
import ${funs.packageName('service')}.${name}${functions.fileSuffix('service')};
import com.aiinp.tsf.provider.model.dto.CommonIdDTO;
import ${funs.packageName('model')}.${name};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
*  @author ${author}
*  @since ${datetime}
*/
@RestController
@RequestMapping(value = "/${tableName?substring(2)?replace('_','/')}")
public class ${name}Controller extends BaseController implements Feign${name}Service {

    @Autowired
    private ${name}Service ${name?uncap_first}Service;


    @Override
    public ${name} getById(CommonIdDTO id){
        return ${name?uncap_first}Service.getById(id.getId());
    }

}
