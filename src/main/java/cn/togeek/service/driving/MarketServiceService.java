package cn.togeek.service.driving;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import cn.togeek.entity.driving.NetLoad;
import cn.togeek.tools.BaseCalendar;
import cn.togeek.util.DrivingChartUtil;
import cn.togeek.util.TimeUtils;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MarketServiceService {

   @Autowired
   NetLoadService netLoadService;

   public Map<String, Object> getNetLoad(Date date) {
      Date start = BaseCalendar.getStartOfDayJavaCalendar(date.getTime()).getTime();
      Date end = BaseCalendar.getEndOfDayJavaCalendar(date.getTime()).getTime();

      QueryWrapper<NetLoad> query = new QueryWrapper<>();
      query.ge("time", start).le("time", end).orderByAsc("time");
//      List<NetLoad> list = netLoadService.getList(query);
      List<NetLoad> list = netLoadService.getNetLoadList(
         TimeUtils.dateConvertString(start, "yyyy-MM-dd HH:mm:ss"),
         TimeUtils.dateConvertString(end, "yyyy-MM-dd HH:mm:ss")
      );

      String[] keys = {"time","realLoad","forecastLoad"};
      Map<String,Object> map = DrivingChartUtil.sourceFieldListObj(list, keys);

      return map;
   }
}