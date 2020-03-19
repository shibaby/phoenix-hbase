package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @author wangb
 * @description: 单个售电公司详情
 * @create: 2019-10-23 09:43
 */
@Data
public class SalesChildCompanyTable {


    @ApiModelProperty(value = "代理用户名称")
    private String proxyUserName;

    @ApiModelProperty(value = "代理电量（千瓦时）")
    private BigDecimal proxyElec;

    @ApiModelProperty(value = "代理用户产业类别")
    private String proxyUserIndusCateg;

    @ApiModelProperty(value = "企业规模（亿元）")
    private String businessScale;

    @ApiModelProperty(value = "售电公司信用")
    private String companyCredit;


}