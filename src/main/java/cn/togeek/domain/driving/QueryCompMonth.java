package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @author wangb
 * @description:
 * @create: 2019-10-12 13:29
 */
@Data
public class QueryCompMonth {
    @ApiModelProperty(value = "公司id")
    private String compId;
    @ApiModelProperty(value = "查询月份")
    private Date month;

}