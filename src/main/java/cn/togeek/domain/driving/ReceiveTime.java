package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author wangb
 * @description: 接收时间参数对象
 * @create: 2019-11-22 09:54
 */
@SuppressWarnings("all")
@Data
public class ReceiveTime {

    @ApiModelProperty(value = "接收时间参数字符串")
    private String time;

    public ReceiveTime() {
    }

    public ReceiveTime(String time) {
        this.time = time;
    }
}