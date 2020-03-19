package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @author wangb
 * @description:
 * @create: 2019-10-11 16:52
 */
@Data
public class QueryTable {

    @ApiModelProperty(value = "查询日期")
    private Date day;

    @ApiModelProperty(value = "like  名称")
    private String compName;

    @ApiModelProperty(value = "pageNum")
    private int pageNum = 1;

    @ApiModelProperty(value = "pageSize")
    private int pageSize = 10;

}