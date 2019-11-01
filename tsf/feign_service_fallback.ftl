package ${funs.packageName("feign_service_fallback")};

com.aiinp.tsf.provider.model.dto.CommonIdDTO
import ${funs.packageName("model")}.${name};
import feign.hystrix.FallbackFactory;

/**
 * @author ${author}
 * @since ${datetime}
 */
class Feign${name}ServiceFallback implements FallbackFactory${r"<Feign"}${name}${r"Service>"} {

    @Override
    public Feign${name}Service create(Throwable cause) {
        return new FeignOrderService() {
            @Override
            public ${name} getById(CommonIdDTO id) {
                return null;
            }
        };
    }
}


