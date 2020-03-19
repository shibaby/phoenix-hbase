package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @author wangb
 * @description:
 * @create: 2019-10-17 16:38
 */
@Data
public class QueryMonth {

    @ApiModelProperty(value = "查询月份，例如 2019-10-10")
    private Date month;

}