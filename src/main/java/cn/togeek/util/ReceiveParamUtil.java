package cn.togeek.util;

import cn.togeek.domain.driving.QueryByTimeRange;
import cn.togeek.domain.driving.QueryTimeRange;
import cn.togeek.domain.driving.ReceiveTime;
import cn.togeek.tools.BaseCalendar;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

/**
 * @author wangb
 * @description:
 * @create: 2019-11-22 09:58
 */
@SuppressWarnings("all")
public class ReceiveParamUtil {

    public static QueryTimeRange getTimeRangeByReceived(ReceiveTime receiveTime){
        if (receiveTime == null || StringUtils.isEmpty(receiveTime.getTime())){
            return null;
        }
        String strTime = (receiveTime.getTime()).trim();
        String[] ymd = strTime.split("-");
        Date startDate = null;
        Date endDate = null;
        if (ymd.length == 1){
            startDate = TimeUtils.strconvertNullDate(strTime,"yyyy");
            endDate = TimeUtils.nextYearNull(startDate);
        }else if(ymd.length == 2){
            startDate = TimeUtils.strconvertNullDate(strTime,"yyyy-MM");
            endDate = TimeUtils.nextMonthNull(startDate);
        }else if(ymd.length == 3){
            startDate = TimeUtils.strconvertNullDate(strTime,"yyyy-MM-dd");
            endDate = TimeUtils.tomorrowNull(startDate);
        }
        if (startDate == null){
            return null;
        }
        QueryTimeRange range = new QueryTimeRange();
        range.setStartTime(startDate);
        range.setEndTime(endDate);
        return range;
    }

    /**
     * 根据年份获取周期为十二个月的开始和结束时间，当前年则为当前月之前的十二个月
     * @param receiveTime
     * @return
     */
    public static QueryTimeRange getTimeRangeByYear(ReceiveTime receiveTime) {
        if (receiveTime == null || StringUtils.isEmpty(receiveTime.getTime())){
            return null;
        }
        String strTime = (receiveTime.getTime()).trim();
        String[] ymd = strTime.split("-");
        Date startDate = null;
        Date endDate = null;

        if (ymd.length != 1){
            return null;
        }

        Date date = TimeUtils.strconvertNullDate(strTime,"yyyy");

//        if(TimeUtils.isCurrentYear(date)) {
//            endDate = BaseCalendar.getEndOfDayJavaCalendar(
//               BaseCalendar.getEndOfMonthJavaCalendar(
//                  BaseCalendar.getNextMonthJavaCalendar(
//                     System.currentTimeMillis(), -1).getTimeInMillis()).getTimeInMillis()).getTime();
//            startDate = BaseCalendar.getStartOfDayJavaCalendar(
//               BaseCalendar.getStartOfMonthJavaCalendar(
//                  BaseCalendar.getNextMonthJavaCalendar(
//                     endDate.getTime(), -11).getTimeInMillis()).getTimeInMillis()).getTime();
//        }
//        else {
        startDate = BaseCalendar.getStartOfYearJavaCalendar(date.getTime()).getTime();
        endDate = BaseCalendar.getEndOfYearJavaCalendar(date.getTime()).getTime();
//        }

        QueryTimeRange range = new QueryTimeRange();
        range.setStartTime(startDate);
        range.setEndTime(endDate);
        return range;
    }

    /**
     * 根据年份获取周期为十二个月的开始和结束时间，当前年则为当前月之前的十二个月
     * @param receiveTime
     * @return
     */
    public static QueryTimeRange getTimeRangeByYear(Date date) {
        if (date == null){
            return null;
        }

        Date startDate = null;
        Date endDate = null;

//        if(TimeUtils.isCurrentYear(date)) {
//            endDate = BaseCalendar.getEndOfDayJavaCalendar(
//               BaseCalendar.getEndOfMonthJavaCalendar(
//                  BaseCalendar.getNextMonthJavaCalendar(
//                     System.currentTimeMillis(), -1).getTimeInMillis()).getTimeInMillis()).getTime();
//            startDate = BaseCalendar.getStartOfDayJavaCalendar(
//               BaseCalendar.getStartOfMonthJavaCalendar(
//                  BaseCalendar.getNextMonthJavaCalendar(
//                     endDate.getTime(), -11).getTimeInMillis()).getTimeInMillis()).getTime();
//        }
//        else {
        startDate = BaseCalendar.getStartOfYearJavaCalendar(date.getTime()).getTime();
        endDate = BaseCalendar.getEndOfYearJavaCalendar(date.getTime()).getTime();
//        }

        QueryTimeRange range = new QueryTimeRange();
        range.setStartTime(startDate);
        range.setEndTime(endDate);
        return range;
    }

    public static QueryByTimeRange getQueryByTimeRangeByReceived(ReceiveTime receiveTime){
        if (receiveTime == null || StringUtils.isEmpty(receiveTime.getTime())){
            return null;
        }
        String strTime = (receiveTime.getTime()).trim();
        String[] ymd = strTime.split("-");
        Date date = null;
        String flag = null;
        if (ymd.length == 1){
            date = TimeUtils.strconvertNullDate(strTime,"yyyy");
            flag = "year";
        }else if(ymd.length == 2){
            date = TimeUtils.strconvertNullDate(strTime,"yyyy-MM");
            flag = "month";
        }else if(ymd.length == 3){
            date = TimeUtils.strconvertNullDate(strTime,"yyyy-MM-dd");
            flag = "day";
        }
        if (date == null){
            return null;
        }
        QueryByTimeRange range = new QueryByTimeRange();
        range.setQueryTime(date);
        range.setTimeReage(flag);
        return range;
    }



}