package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

/**
 * @author wangb
 * @description:
 * @create: 2019-11-18 10:58
 */
public class QueryByFlagTimeRange {

    @ApiModelProperty(value = "查询年、月、日。year,month,day")
    private String timeReage;

    @ApiModelProperty(value = "查询时间")
    private Date queryTime;


}