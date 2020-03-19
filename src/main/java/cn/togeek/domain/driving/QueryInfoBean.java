package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author wangb
 * @description:
 * @create: 2019-10-28 11:16
 */
@Data
public class QueryInfoBean {

    @ApiModelProperty(value = "被查询基础信息id")
    private String id;

    @ApiModelProperty(value = "页面编号。generation，electricity，powerUser")
    private String pageCode;

    @ApiModelProperty(value = "签页标志。基本信息 base,注册信息 registered")
    private String signing;

}