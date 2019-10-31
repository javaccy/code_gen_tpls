package ${funs.packageName("feign_service")};

import com.aiinp.tsf.common.model.dto.CommonIdDTO;
import ${funs.packageName("model")}.${name};
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @author ${author}
 * @since ${datetime}
 */
@FeignClient(value = "provider-${funs.prop("model")}", path = "/${name?uncap_first}", fallbackFactory = Feign${name}ServiceFallback.class)
public interface Feign${name}Service {


    /**
     * 根据id获取订单
     * @param id 订单id
     * @return   订单信息
    */
    @PostMapping(value = "/")
    ${name} getById(@RequestBody IdDTO id);

}
