package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author wangb
 * @description: 电力用户查看详情
 * @create: 2019-10-22 15:47
 */
@Data
public class PowerUserViewDetailsTable {
   @ApiModelProperty("唯一编号")
   private String id;

   @ApiModelProperty(value = "序号")
   private Integer indexNum;

   @ApiModelProperty(value = "电力用户名称")
   private String powerUserName;

   @ApiModelProperty(value = "所属区域")
   private String area;

   @ApiModelProperty(value = "用户性质")
   private String userNature;

   @ApiModelProperty(value = "电压等级(KV)")
   private String voltageLevel;

   @ApiModelProperty(value = "年累计用电量（千万时）")
   private String yearTotalElectric;

   @ApiModelProperty(value = "电价（元/千瓦时）")
   private String electricityPrice;

   @ApiModelProperty(value = "产业类别")
   private String industryCategory;

   @ApiModelProperty(value = "节点信息")
   private String nodeInfo;

   @ApiModelProperty(value = "联系人")
   private String contact;

   @ApiModelProperty(value = "电话")
   private String contactNumber;


}