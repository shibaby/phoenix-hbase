package cn.togeek.service.driving;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import cn.togeek.entity.driving.NetLoad;
import cn.togeek.mapper.driving.NetLoadMapper;
import cn.togeek.service.BaseService;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class NetLoadService extends BaseService<NetLoadMapper, NetLoad> {

   /**
    * 获取时间段内的实际/预测负荷值
    * @param start 包含start时间
    * @param end 不包含end时间
    * @return
    * @throws Exception
    */
   public List<NetLoad> getByTimeRange(Date start, Date end) {
      QueryWrapper<NetLoad> queryWrapper = new QueryWrapper<>();
      queryWrapper.ge("time", start).lt("time", end).orderByAsc("time");
      return this.getList(queryWrapper);
   }

   /**
    * 删除时间段内记录
    * @param start 包含start时间
    * @param end 不包含end时间
    */
   public void deleteByTimeRange(Date start, Date end) {
      QueryWrapper<NetLoad> wrapper = new QueryWrapper<>();
      wrapper.ge("time", start).lt("time", end);
      this.baseMapper.delete(wrapper);
   }

   public List<NetLoad> getNetLoadList(String start, String end) {

      return this.baseMapper.getNetLoadList(start, end);
   }
}