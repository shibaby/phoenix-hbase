package cn.togeek.mapper.driving;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import cn.togeek.entity.driving.NetLoad;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface NetLoadMapper extends BaseMapper<NetLoad> {

   List<NetLoad> getNetLoadList(@Param("start") String start, @Param("end") String end);
}