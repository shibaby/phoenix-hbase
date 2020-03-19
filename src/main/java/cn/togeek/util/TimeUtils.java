package cn.togeek.util;

import cn.togeek.tools.BaseCalendar;
import cn.togeek.tools.LogUtil;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;

public class TimeUtils {
   private static final Logger logger = LogUtil.logger(TimeUtils.class);

   public static Date strconvertDate(String strDate, String format) {
      SimpleDateFormat sdf = new SimpleDateFormat(format);
      Date date = null;
      try {
         date = sdf.parse(strDate);
      }
      catch(Exception e) {
         logger.info(strDate + "can not parse by " + format);
         e.printStackTrace();
         date = new Date();
      }
      finally {
         return date;
      }
   }

   public static Date strconvertNullDate(String strDate, String format) {
      SimpleDateFormat sdf = new SimpleDateFormat(format);
      Date date = null;
      try {
         date = sdf.parse(strDate);
      }
      catch(Exception e) {
         logger.info(strDate + "can not parse by " + format);
         e.printStackTrace();
      }
      finally {
         return date;
      }
   }

   public static String dateConvertString(Date date, String format) {
      SimpleDateFormat sdf = new SimpleDateFormat(format);
      String strDate = null;
      try {
         strDate = sdf.format(date);
      }
      catch(Exception e) {
         logger.info(strDate + "can not format by " + format);
         strDate = sdf.format(new Date());
      }
      finally {
         return strDate;
      }
   }

   public static String dateConvertString(LocalDate date, String format) {
      DateTimeFormatter dtf = DateTimeFormatter.ofPattern(format);
      String strDate = null;
      try {
         strDate = dtf.format(date);
      }
      catch(Exception e) {
         logger.info(strDate + "can not format by " + format);
         strDate = dtf.format(LocalDate.now());
      }
      finally {
         return strDate;
      }
   }
   public static String dateConvertString(LocalDateTime date, String format) {
      DateTimeFormatter dtf = DateTimeFormatter.ofPattern(format);
      String strDate = null;
      try {
         strDate = dtf.format(date);
      }
      catch(Exception e) {
         logger.info(strDate + "can not format by " + format);
         strDate = dtf.format(LocalDate.now());
      }
      finally {
         return strDate;
      }
   }



   /**
    *  将Date转换成LocalDateTime
    * @param date
    * @return
    */
   public static LocalDateTime convertDateToLDT(Date date) {
      if(null == date) {
         return null;
      }

      return LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
   }

   /**
    * 将LocalDateTime转换成Date
    */
   public Date LocalDateTimeToUdate(LocalDateTime localDateTime) {
      ZoneId zone = ZoneId.systemDefault();
      Instant instant = localDateTime.atZone(zone).toInstant();
      return Date.from(instant);
   }

   /**
    *  根据传入的时间格式返回系统当前的时间
    * @param format string
    * @return
    */
   public static String timeByFormat(String format) {
      DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(format);
      LocalDateTime now = LocalDateTime.now();
      return now.format(dateTimeFormatter);
   }

   /**
    * 将Date转换成LocalDate
    * @param date
    * @return
    */
   public static LocalDate dateToLocalDate(Date date) {
      LocalDateTime localDateTime = LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
      return localDateTime.toLocalDate();
   }

   /**
    * 将Date转换成LocalDate
    * @param date
    * @return
    */
   public static LocalDateTime dateToLocalDateTime(Date date) {
      return LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
   }

   /**
    *  将LocalDate转换成Date
    * @param localDate
    * @return
    */
   public static Date localDateToDate(LocalDate localDate) {
      Instant instant = localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant();
      return Date.from(instant);
   }

   public static LocalDateTime stringToLocalDateTime(String strDate, String format) {
      DateTimeFormatter dtf = DateTimeFormatter.ofPattern(format);
      return LocalDateTime.parse(strDate, dtf);
   }

   public static LocalDate stringToLocalDate(String strDate, String format) {
      DateTimeFormatter dtf = DateTimeFormatter.ofPattern(format);
      return LocalDateTime.parse(strDate, dtf).toLocalDate();
   }

   /**
    * 获取上个月的前一天
    * @return
    */
   public static Date getDate() {
      Calendar calendar = Calendar.getInstance();
      calendar.add(Calendar.MONTH, -1);
      return calendar.getTime();
   }

   /**
    * 获取上个月的昨天
    * @return
    */
   public static Date getLastMonthDay() {
      Date date = new Date();
      Calendar calendar = Calendar.getInstance();
      calendar.setTime(date); // 设置为当前时间
      calendar.add(Calendar.MONTH, -1);
      calendar.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH) - 1);// 设置为上一个月
      date = calendar.getTime();
      return date;
   }

   /**
    * 获取上上个月的昨天
    * @return
    */
   public static Date getLastLastMonthDay(){
      Date date = new Date();
      Calendar calendar = Calendar.getInstance();
      calendar.setTime(date); // 设置为当前时间
      calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 2);
      calendar.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH));// 设置为上一个月
      date = calendar.getTime();
      return date;
   }

   /**
    * 获取上个月的每一天
    * @return
    */
   public static List<String> getDayListOfMonth() {
      List<String> list = new ArrayList<String>();
      Calendar aCalendar = Calendar.getInstance(Locale.CHINA);
      int year = aCalendar.get(Calendar.YEAR);//年份
      int month = aCalendar.get(Calendar.MONTH);//月份
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
      Date date = null;

      try {
         date = format.parse(year + "-" + month);
      }
      catch(ParseException e) {

      }

      aCalendar.setTime(date);
      int day = aCalendar.getActualMaximum(Calendar.DATE);

      for(int i = 1; i <= day; i++) {
         String aDate = null;

         if(month < 10 && i < 10) {
            aDate = String.valueOf(year) + "-0" + month + "-0" + i;
         }

         if(month < 10 && i >= 10) {
            aDate = String.valueOf(year) + "-0" + month + "-" + i;
         }

         if(month >= 10 && i < 10) {
            aDate = String.valueOf(year) + "-" + month + "-0" + i;
         }

         if(month >= 10 && i >= 10) {
            aDate = String.valueOf(year) + "-" + month + "-" + i;
         }

         list.add(aDate);
      }

      return list;
   }


   /**
    * 获取指定日期下个月的第一天
    * @param dateStr
    * @param format
    * @return
    */
   public static String getFirstDayOfNextMonth(String dateStr,String format){
      SimpleDateFormat sdf = new SimpleDateFormat(format);
      try {
         Date date = sdf.parse(dateStr);
         Calendar calendar = Calendar.getInstance();
         calendar.setTime(date);
         calendar.set(Calendar.DAY_OF_MONTH,1);
         calendar.add(Calendar.MONTH, 1);
         return sdf.format(calendar.getTime());
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   public static Date getFirstDayOfNextMonth(String dateStr){
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      try {
         Date date = sdf.parse(dateStr);
         Calendar calendar = Calendar.getInstance();
         calendar.setTime(date);
         calendar.set(Calendar.DAY_OF_MONTH,1);
         calendar.add(Calendar.MONTH, 1);
         return calendar.getTime();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   public static Date getFirstDayOfNextMonth(Date date){
      try {
         Calendar calendar = Calendar.getInstance();
         calendar.setTime(date);
         calendar.set(Calendar.DAY_OF_MONTH,1);
         calendar.add(Calendar.MONTH, 1);
         return calendar.getTime();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   /**
    * 返回昨天
    * @param today
    * @return
    */
   public static Date yesterday(Date today) {
      Calendar calendar = Calendar.getInstance();
      calendar.setTime(today);
      calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - 1);
      return calendar.getTime();
   }

   /**
    * 返回明天
    * @param today
    * @return
    */
   public static Date tomorrow(Date today) {
      Calendar calendar = Calendar.getInstance();
      calendar.setTime(today);
      calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 1);
      return calendar.getTime();
   }
   public static Date tomorrowNull(Date today) {
      if (today == null){
         return null;
      }
      Calendar calendar = Calendar.getInstance();
      calendar.setTime(today);
      calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 1);
      return calendar.getTime();
   }
   /**
    * 返回下月
    * @param today
    * @return
    */
   public static Date nextMonth(Date today) {
      Calendar calendar = Calendar.getInstance();
      calendar.setTime(today);
      calendar.set(Calendar.MARCH, calendar.get(Calendar.MARCH) + 1);
      return calendar.getTime();
   }
   public static Date nextMonthNull(Date today) {
      if (today == null){
         return null;
      }
      Calendar calendar = Calendar.getInstance();
      calendar.setTime(today);
      calendar.set(Calendar.MARCH, calendar.get(Calendar.MARCH) + 1);
      return calendar.getTime();
   }


   /**
    * 返回下年
    * @param today
    * @return
    */
   public static Date nextYear(Date today) {
      Calendar calendar = Calendar.getInstance();
      calendar.setTime(today);
      calendar.set(Calendar.YEAR, calendar.get(Calendar.YEAR) + 1);
      return calendar.getTime();
   }


   public static Date nextYearNull(Date today) {
      if (today == null){
         return null;
      }
      Calendar calendar = Calendar.getInstance();
      calendar.setTime(today);
      calendar.set(Calendar.YEAR, calendar.get(Calendar.YEAR) + 1);
      return calendar.getTime();
   }

   /**
    * 判断指定日期是否是当前年
    * @param date
    * @return
    */
   public static boolean isCurrentYear(Date date) {
      long start = BaseCalendar.getStartOfYearJavaCalendar(System.currentTimeMillis()).getTimeInMillis();
      long end = BaseCalendar.getEndOfDayJavaCalendar(
         BaseCalendar.getEndOfYearJavaCalendar(System.currentTimeMillis()).getTimeInMillis()).getTimeInMillis();

      return (date.getTime() - start >= 0) && (date.getTime() - end <= 0);
   }

   /**
    * 判断指定日期是否是当前月
    * @param date
    * @return
    */
   public static boolean isCurrentMonth(Date date) {
      long start = BaseCalendar.getStartOfMonthJavaCalendar(System.currentTimeMillis()).getTimeInMillis();
      long end = BaseCalendar.getEndOfDayJavaCalendar(
         BaseCalendar.getEndOfMonthJavaCalendar(System.currentTimeMillis()).getTimeInMillis()).getTimeInMillis();

      return (date.getTime() - start >= 0) && (date.getTime() - end <= 0);
   }

   /**
    * 判断指定日期是否是当月第一天
    * @param date
    * @return
    */
   public static boolean isFistDayOfMonth(Date date) {
      return BaseCalendar.getStartOfMonthJavaCalendar(date.getTime()).equals(BaseCalendar.getStartOfDayJavaCalendar(date.getTime()));
   }

   /**
    * 判断指定日期是否是当年第一天
    * @param date
    * @return
    */
   public static boolean isFistDayOfYear(Date date) {
      return BaseCalendar.getStartOfYearJavaCalendar(date.getTime()).equals(BaseCalendar.getStartOfDayJavaCalendar(date.getTime()));
   }

   /**
    * 获取时间段内每月的第一天
    * @param start
    * @param end
    * @return
    */
   public static List<Date> getFistDaysByDateRange(Date start, Date end) {
      List<Date> dates = new ArrayList<>();
      Date date = BaseCalendar.getStartOfMonthJavaCalendar(start.getTime()).getTime();

      while(date.getTime() <= end.getTime()) {
         dates.add(date);
         date = BaseCalendar.getNextMonthJavaCalendar(date.getTime(), 1).getTime();
      }

      return dates;
   }

   /**
    * 获取时间段内每天的开始时间
    * @param start
    * @param end
    * @return
    */
   public static List<Date> getDaysByDateRange(Date start, Date end) {
      List<Date> dates = new ArrayList<>();
      Date date = BaseCalendar.getStartOfDayJavaCalendar(start.getTime()).getTime();

      while(date.getTime() <= end.getTime()) {
         dates.add(date);
         date = BaseCalendar.getNextDayJavaCalendar(date.getTime(), 1).getTime();
      }

      return dates;
   }

   /**
    * 获取指定日期的96点
    * @param date
    * @return
    */
   public static List<Date> getTime96Points(Date date) {
      List<Date> dates = new ArrayList<>();
      Date start = BaseCalendar.getStartOfDayJavaCalendar(date.getTime()).getTime();
      Date end = BaseCalendar.getNextDayJavaCalendar(start.getTime(), 1).getTime();

      while(start.getTime() < end.getTime()) {
         dates.add(start);
         start = BaseCalendar.getNextMinuteJavaCalendar(start.getTime(), 15).getTime();
      }

      return dates;
   }

   /**
    * 获取指定日期的当月开始时间
    * @param date
    * @return
    */
   public static Date getFirstDayOfMonth(Date date) {

      return BaseCalendar.getStartOfMonthJavaCalendar(date.getTime()).getTime();
   }

   /**
    * 获取指定日期的当月开始时间
    * @param date
    * @return
    */
   public static Date getLastDayOfMonth(Date date) {

      return BaseCalendar.getEndOfDayJavaCalendar(BaseCalendar.getEndOfMonthJavaCalendar(date.getTime()).getTimeInMillis()).getTime();
   }



   /**
    * 获取一个时间里的所有月份
    * @param minDate
    * @param maxDate
    * @return
    * @throws Exception
    */
   public static List<String> getMonthBetween(String minDate, String maxDate,String format) throws  Exception{
      ArrayList<String> result = new ArrayList<String>();
      SimpleDateFormat sdf = new SimpleDateFormat(format);//格式化为年月

      Calendar min = Calendar.getInstance();
      Calendar max = Calendar.getInstance();

      min.setTime(sdf.parse(minDate));
      min.set(min.get(Calendar.YEAR), min.get(Calendar.MONTH), 1);

      max.setTime(sdf.parse(maxDate));
      max.set(max.get(Calendar.YEAR), max.get(Calendar.MONTH), 2);

      Calendar curr = min;
      while (curr.before(max)) {
         result.add(sdf.format(curr.getTime()));
         curr.add(Calendar.MONTH, 1);
      }

      return result;
   }





   public static List<String> getMonths12ByYearMonth(String maxTime,String fmat) {
      int leng = 11; //月份长度为12
      Date maxd = strconvertNullDate(maxTime,fmat);
      List<String> month = null;
      Calendar calendar = Calendar.getInstance();
      calendar.setTime(maxd);
      calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - leng);
      Date mind = calendar.getTime();
      String minTime = dateConvertString(mind,fmat);
      try {
         month = getMonthBetween(minTime, maxTime,fmat);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return  month;

   }

   public static List<String> getMonths12ByYear(int maxYearTime,String fmat) {
     LocalDate now = LocalDate.now();
     int nowMonth = now.getMonthValue();
     int nowYear = now.getYear();
     if (maxYearTime >= nowYear){
        String timestr = nowYear + "-" + nowMonth;
        return getMonths12ByYearMonth(timestr,fmat);
     }else{

        String timestr = maxYearTime + "-12";
        return getMonths12ByYearMonth(timestr,fmat);
     }

   }

   /**
    * 某年向前的12个月,某年大于等于当年年，则为当前年当前月向前推12个月
    * @param maxYearTime
    * @return
    */
   public static List<String> getMonths12ByYear(String maxYearTime) {
      int year = Integer.parseInt(maxYearTime);
      return getMonths12ByYear(year,"yyyy-MM");
   }
}
