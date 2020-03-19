package cn.togeek.entity.driving;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import cn.togeek.entity.BaseEntity;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("t_net_load")
@ApiModel(value = "NetLoad", description = "全网96点负荷值和预测值 t_net_load")
public class NetLoad extends BaseEntity {
   @ApiModelProperty(value = "实际")
   private LocalDateTime time;

   @ApiModelProperty(value = "实际负荷")
   private BigDecimal realLoad;

   @ApiModelProperty(value = "预测负荷")
   private BigDecimal forecastLoad;

}
