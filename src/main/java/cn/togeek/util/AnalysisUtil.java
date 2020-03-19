package cn.togeek.util;

import cn.hutool.core.date.DateUtil;
import cn.togeek.tools.BigDecimals;
import cn.togeek.tools.Calendars;
import cn.togeek.tools.LogUtil;
import cn.togeek.tools.Tool;
import org.apache.poi.util.IOUtils;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Date;

public class AnalysisUtil {
   public static LocalDateTime dateToLocalDateTime(Date date) {
      if(date == null) {
         return null;
      }

      Instant instant = date.toInstant();
      ZoneId zone = ZoneId.systemDefault();
      LocalDateTime localDateTime = LocalDateTime.ofInstant(instant, zone);

      return localDateTime;
   }

   public static String formartHHmm(Date date) {
      return DateUtil.format(date, "HH:mm");
   }

   public static String[] getTimes() {
      Date declareDate = Calendars.builder().dayOnly().getTime();
      String[] times = new String[Const.POINT_NUM];

      for(int i = 0; i < Const.POINT_NUM; i++) {
         times[i] = formartHHmm(declareDate);
         declareDate = Calendars.builder(declareDate).addMinute(15).getTime();
      }

      return times;
   }

   public static void copyResource(ByteArrayOutputStream out, String path) throws IOException {
      try(InputStream in = ResourceFinder.getResourceAsStream(path)) {
         IOUtils.copy(in, out);
      }
   }

   public static Object convert(Method writer, String s) throws ParseException {
      if(Tool.isEmpty(s)) {
         return null;
      }

      Class type = writer.getParameterTypes()[0];

      if(type == Long.class || type == long.class) {
         return (long) Double.parseDouble(s);
      }
      else if(type == Short.class || type == short.class) {
         return (short) Double.parseDouble(s);
      }
      else if(type == BigDecimal.class) {
         return new BigDecimal(s);
      }
      else if(type == Date.class) {
         return new SimpleDateFormat("yyyy-MM-dd").parse(s);
      }
      else if(type == Integer.class || type == int.class) {
         return Integer.parseInt(s);
      }

      return s;
   }

   public static <T> BigDecimal getPropValue(T clazz, String filedName) {
      PropertyDescriptor propDesc = null;
      BigDecimal value = null;

      if(clazz == null) {
         return null;
      }

      try {
         propDesc = new PropertyDescriptor(filedName, clazz.getClass());
         Method method = propDesc.getReadMethod();
         value = (BigDecimal) method.invoke(clazz);
      }
      catch(IntrospectionException | IllegalAccessException | InvocationTargetException e) {
         LogUtil.logger(AnalysisUtil.class).error(e.getMessage(), e);
      }

      return value;
   }

   public static String getTimeString(int index) {
      Date date = Calendars.builder().dayOnly().getTime();
      date = Calendars.builder(date).addMinute(15 * index).getTime();

      return DateUtil.format(date, "HHmm");
   }

   public static <T> Object getPointValue(T clazz, String prefix) {
      Date point = Calendars.builder().hour(23).minute(45).getTime();
      String timeStr = DateUtil.format(point, "HHmm");
      Object value = null;

      if(clazz == null) {
         return null;
      }

      try {
         PropertyDescriptor pd = new PropertyDescriptor(prefix + timeStr, clazz.getClass());
         Method method = pd.getReadMethod();
         value = method.invoke(clazz);
      }
      catch(IntrospectionException | IllegalAccessException | InvocationTargetException e) {
         LogUtil.logger(AnalysisUtil.class).error(e.getMessage(), e);
      }

      return value;
   }

   public static BigDecimal sum(BigDecimal[] array) {
      return array == null ? null : Arrays.stream(array).reduce((a, b) -> BigDecimals.sum(a, b)).orElse(null);
   }
}
