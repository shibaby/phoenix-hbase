package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author wangb
 * @description: 单个发电企业查询对象
 * @create: 2019-10-10 17:23
 */
@Data
public class SingleCompQueryBean extends QueryTimeRange {

   @ApiModelProperty(value = "企业Id")
   private String companyId;

}