package cn.togeek.controller.driving;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

import cn.togeek.service.driving.MarketServiceService;
import cn.togeek.util.TimeUtils;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 市场服务
 */
@SuppressWarnings("all")
@RestController
@RequestMapping("/market/service/")
@Api(tags = "驾驶舱-市场服务")
public class MarketServiceController {

    @Autowired
    private MarketServiceService marketServiceService;
    String DAY = "2019-01-01";

    @GetMapping("net/load")
    @ApiOperation(value = "全网负荷、负荷预测96点值")
    public Map<String,Object> getNetLoad(
       @ApiParam(value="查询时间 yyyy-MM-dd",required=true) @RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date){
        Map<String, Object> map = marketServiceService.getNetLoad(date);
//        Date demoTime = TimeUtils.strconvertDate(DAY, "yyyy-MM-dd");
//        Map<String, Object> map = marketServiceService.getNetLoad(demoTime);
//
//        List<Date> time = TimeUtils.getTime96Points(date);
//        map.put("time", time);

        return map;
    }

}
