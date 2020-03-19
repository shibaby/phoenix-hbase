package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author wangb
 * @description: 数据查询对象
 * @create: 2019-10-09 14:21
 */
@Data
public class QueryBean extends QueryTimeRange {


    @ApiModelProperty(value = "传递参数 fire ，water ，wind，sun")
    private String flagObj;

}