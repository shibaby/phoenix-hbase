package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @author wangb
 * @description: 查询时间范围对象
 * @create: 2019-10-09 14:00
 */
@Data
public class QueryTimeRange {

    @ApiModelProperty(value = "开始时间")
    private Date startTime;

    @ApiModelProperty(value = "结束时间")
    private Date endTime;

}