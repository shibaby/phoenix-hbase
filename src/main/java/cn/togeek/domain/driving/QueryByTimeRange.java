package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @author wangb
 * @description:
 * @create: 2019-11-17 20:19
 */
@Data
public class QueryByTimeRange {

    @ApiModelProperty(value = "查询年、月、日。year,month,day")
    private String timeReage;

    @ApiModelProperty(value = "查询时间")
    private Date queryTime;


}