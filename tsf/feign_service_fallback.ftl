package ${funs.packageName("feign_service_fallback")};

import com.aiinp.tsf.provider.model.dto.CommonIdDTO;
import ${funs.packageName("model")}.${name};
import feign.hystrix.FallbackFactory;

/**
 * @author ${author}
 * @since ${datetime}
 */
class Feign${name}ServiceFallbackFactory implements FallbackFactory${r"<Feign"}${name}${r"Service>"} {

    @Override
    public Feign${name}Service create(Throwable cause) {
        return new Feign${name}Service() {
            @Override
            public ${name} getById(CommonIdDTO id) {
                return null;
            }
        };
    }
}



