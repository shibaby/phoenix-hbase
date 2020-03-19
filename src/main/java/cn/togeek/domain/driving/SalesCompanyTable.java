package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author wangb
 * @description: 单个售电公司详情
 * @create: 2019-10-23 09:43
 */
@Data
public class SalesCompanyTable {

    @ApiModelProperty("售电公司唯一编号")
    private String id;

    @ApiModelProperty(value = "序号")
    private Integer indexNum;

    @ApiModelProperty(value = "售电公司名称")
    private String companyName;

   @ApiModelProperty(value = "公司性质")
    private String companyType;

    @ApiModelProperty(value = "注册分类")
    private String registeClassification;

    @ApiModelProperty(value = " 注册资本（万元）")
    private String registeCapital;

    @ApiModelProperty(value = "注册总额（万元）")
    private String totalCapital;

    @ApiModelProperty(value = " 年售电量上限（亿千瓦时）")
    private String annualSalesCap;

    @ApiModelProperty(value = "代理用户数量（个）")
    private Integer proxyTotNumber;

    @ApiModelProperty(value = "代理总电量（亿千万时）")
    private BigDecimal proxyTotElec;

   @ApiModelProperty(value = "企业规模")
   private String enterpriseScale;

//=========================================================

    @ApiModelProperty(value = "代理用户名称")
    private String proxyUserName;

    @ApiModelProperty(value = "代理电量（千瓦时）")
    private BigDecimal proxyElec;

    @ApiModelProperty(value = "代理用户产业类别")
    private String proxyUserIndusCateg;

//    @ApiModelProperty(value = "企业规模（亿元）")
//   private String businessScale;

   @ApiModelProperty(value = "售电公司信用")
   private String companyCredit;


    private Integer length = 0;
    private Boolean merge = false;

    @ApiModelProperty(value = "子代理企业")
    private List<SalesChildCompanyTable> children;

}