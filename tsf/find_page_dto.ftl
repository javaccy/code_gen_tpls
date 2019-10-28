package ${funs.packageName("find_page_dto")};

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * @author ${author}
 * @since ${datetime}
 */
@Data
@ToString
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = true)
public class ${name}PageDTO extends PageDTO {

    /**
     * 分页
     *
     * @param page
     * @param size
     */
    public CustomerOrderPageDTO(Integer page, Integer size) {
        super(page, size);
    }
}
