package cn.togeek.util;

import cn.togeek.util.validation.PojoResolver;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author wangb
 * @description:
 * @create: 2019-10-15 11:00
 */
@SuppressWarnings("all")
public class DrivingChartUtil {

    public static Map<String,List> sourceFieldList(List source, String[] targetFields)  {
        Map<String,List> map = new HashMap<>();
        for (String field:targetFields){
            map.put(field,new ArrayList());
        }
        try {
            for (Object sourceItem: source){
                Class sourceClass = sourceItem.getClass();
                Field[] sourceFields = sourceClass.getDeclaredFields();
                for (Field sourceField : sourceFields) {
                    String name = sourceField.getName();
                    for (String field:targetFields){
                        if (field.equals(name)){
                            Class type = sourceField.getType();
                            String methodName = name.substring(0, 1).toUpperCase() + name.substring(1);
                            Method getMethod = sourceClass.getMethod("get" + methodName);
                            Object value = getMethod.invoke(sourceItem);//执行源对象的get方法得到属性值
                            List item = map.get(name);
                            item.add(value);
                            break;
                        }
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return map;
    }

    public static Map<String,Object> sourceFieldListObj(List source, String[] targetFields)  {
        Map<String,Object> map = new HashMap<>();
        for (String field:targetFields){
            map.put(field,new ArrayList());
        }
        try {
            for (Object sourceItem: source){
                Class sourceClass = sourceItem.getClass();
                Field[] sourceFields = sourceClass.getDeclaredFields();
                for (Field sourceField : sourceFields) {
                    String name = sourceField.getName();
                    for (String field:targetFields){
                        if (field.equals(name)){
                            Class type = sourceField.getType();
                            String methodName = name.substring(0, 1).toUpperCase() + name.substring(1);
                            Method getMethod = sourceClass.getMethod("get" + methodName);
                            Object value = getMethod.invoke(sourceItem);//执行源对象的get方法得到属性值
                            List item = (List) map.get(name);
                            item.add(value);
                            break;
                        }
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return map;
    }

    public static Double sumBigDecimalList(List<BigDecimal> bigDecimals){
        if (bigDecimals == null || bigDecimals.isEmpty()){
            return 0.0;
        }
        BigDecimal sumVal = new BigDecimal(0);
        for (BigDecimal item : bigDecimals){
            sumVal = item.add(sumVal);
        }
        return sumVal.doubleValue();
    }

    public static Double avgBigDecimalList(List<BigDecimal> bigDecimals){
        if (bigDecimals == null || bigDecimals.isEmpty()){
            return 0.0;
        }
        BigDecimal sumVal = new BigDecimal(0);
        for (BigDecimal item : bigDecimals){
            sumVal = item.add(sumVal);
        }
        return sumVal.divide(new BigDecimal(bigDecimals.size())).doubleValue();
    }

    public static BigDecimal getAvgBigDecimalList(List<BigDecimal> bigDecimals){
        if (bigDecimals == null || bigDecimals.isEmpty()){
            return BigDecimal.ZERO;
        }
        BigDecimal sumVal =  BigDecimal.ZERO;
        for (BigDecimal item : bigDecimals){
            sumVal = item.add(sumVal);
        }

        return sumVal.divide(new BigDecimal(bigDecimals.size()),4, BigDecimal.ROUND_HALF_UP);
    }

    public static BigDecimal sumBigDecimalByList(List<BigDecimal> bigDecimals){
        if (bigDecimals == null || bigDecimals.isEmpty()){
            return BigDecimal.ZERO;
        }
        BigDecimal sumVal = BigDecimal.ZERO;
        for (BigDecimal item : bigDecimals){
            sumVal = item.add(sumVal);
        }
        return sumVal;
    }

    public static Map<String,Object> getKeyInfo(String[] keys,Class clazz){
        Map<String,Object> map = new HashMap<>();
        List<PojoResolver.WebColumnInfo> pojoList= PojoResolver.meta(clazz);
        for (PojoResolver.WebColumnInfo pojo:pojoList) {
            for (String key:keys){
                if (key.equals(pojo.getField())){
                    pojo.getField();
                    map.put(pojo.getField(),pojo.getTitle());
                    continue;
                }
            }
        }
        return map;
    }


}