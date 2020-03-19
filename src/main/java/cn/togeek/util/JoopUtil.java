package cn.togeek.util;

import cn.togeek.tools.LogUtil;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class JoopUtil {

   public static Object merge(Object from, Object to, String... ignore) {
      if(from == null) {
         return null;
      }

      List<String> ignoreFields = ignore == null ? Collections.EMPTY_LIST : Arrays.asList(ignore);
      Field[] fields = from.getClass().getDeclaredFields();
      Field[] var5 = fields;
      int var6 = fields.length;


      for(int var7 = 0; var7 < var6; ++var7) {
         Field field = var5[var7];
         Object v = null;

         try {

            PropertyDescriptor pd = new PropertyDescriptor(field.getName(), from.getClass());
            Method readMethod = pd.getReadMethod();
            v = readMethod.invoke(from);

            if(!ignoreFields.contains(field.getName()) && v != null) {
               PropertyDescriptor temppd = new PropertyDescriptor(field.getName(), to.getClass());
               Method writeMethod = temppd.getWriteMethod();
               writeMethod.invoke(to, v);
            }

         }
         catch(IntrospectionException | IllegalAccessException | InvocationTargetException e) {
            LogUtil.logger(JoopUtil.class).error(e.getMessage(), e);
         }

      }

      return to;
   }

   public static Object mergeMap(Map<String, Object> map, Object to, String... ignore) {
      if(map == null) {
         return null;
      }

      List<String> ignoreFields = ignore == null ? Collections.EMPTY_LIST : Arrays.asList(ignore);
      List<String> fileNames =
         Arrays.stream(to.getClass().getDeclaredFields()).map(item -> item.getName()).collect(Collectors.toList());

      for(String key : map.keySet()) {
         try {
            Object v = map.get(key);
            if(!ignoreFields.contains(key) && v != null && fileNames.contains(key)) {
               PropertyDescriptor pd = new PropertyDescriptor(key, to.getClass());
               Method writeMethod = pd.getWriteMethod();
               writeMethod.invoke(to, v);
            }
         }
         catch(IntrospectionException | IllegalAccessException | InvocationTargetException e) {
            LogUtil.logger(JoopUtil.class).error(e.getMessage(), e);
         }
      }

      return to;
   }
}
