package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * @author wangb
 * @description:
 * @create: 2019-10-21 15:58
 */
@Data
public class SingleICVRes {

   @ApiModelProperty(value = "月份")
   private LocalDate month;

   @ApiModelProperty(value = "电力用户Id")
   private String puId;

   @ApiModelProperty(value = "电力用户名称")
   private String puName;

   @ApiModelProperty(value = "用户性质")
   private String userNature;

   @ApiModelProperty(value = "电力用户产业类别id")
   private String industryCategoryId;

   @ApiModelProperty(value = "电力用户产业类别名称")
   private String industryCategoryName;

   @ApiModelProperty(value = "电力用户电压等级Id")
   private String voltageLevelId;

   @ApiModelProperty(value = "电力用户电压等级值")
   private String voltageLevelValue;

   @ApiModelProperty(value = "本月总用电量")
   private BigDecimal energyUsed;

   @ApiModelProperty(value = "本月用电量同比")
   private BigDecimal monthOnMonth;

   @ApiModelProperty(value = "本月用电量环比")
   private BigDecimal ringRatio;

   @ApiModelProperty(value = "用电量的增长减少率")
   private BigDecimal growthReductionRate;

   @ApiModelProperty(value = "产业类别")
   public BigDecimal totleIndustryCategory;

   @ApiModelProperty(value = "电压等级")
   public BigDecimal totleVoltageLevel;

}