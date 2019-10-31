package ${funs.packageName("controller")};

import ${funs.packageName("feign_service")}.${functions.filePrefix('feign_service')}${name}${functions.fileSuffix('feign_service')};
import ${funs.packageName('service')}.${name}${functions.fileSuffix('service')};
import com.aiinp.tsf.common.model.dto.CommonIdDTO;
import com.aiinp.tsf.order.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
*  @author ${author}
*  @since ${datetime}
*/
@RestController
@RequestMapping(value = "/${name?uncap_first}")
public class ${name}Controller extends BaseController implements FeignOrderService {

    @Autowired
    private ${name}Service ${name?uncap_first}Service;


    @Override
    public ${name} getById(IdDTO id){
        return ${name?uncap_first}Service.getById(id.getId());
    }

}
