package cn.togeek.util;

import java.math.BigDecimal;

/**
 * BigDecimal类型数据计算
 * @Auther: shibaobao
 * @Date: 2020/2/16 20:15
 */
public class BigDecimalUtil {

   /**
    * 多个BigDecimal类型数据相加
    * @param vals
    * @return
    */
   public static BigDecimal add(BigDecimal ...vals) {
      BigDecimal result = null;

      for(int i = 0; i < vals.length; i++) {
         result = result == null ? vals[i] : (vals[i] == null ? result : result.add(vals[i]));
      }

      return result;
   }

   /**
    * 多个BigDecimal类型数据相减
    * @param vals
    * @return
    */
   public static BigDecimal subtract(BigDecimal ...vals) {
      BigDecimal result = null;

      for(int i = 0; i < vals.length; i++) {
         result = result == null ? vals[i] : (vals[i] == null ? result : result.subtract(vals[i]));
      }

      return result;
   }

   public static BigDecimal divide(BigDecimal dividend, BigDecimal divisor) {
      return dividend == null || divisor == null || divisor.doubleValue() == 0 ? null : dividend.divide(divisor, 4, BigDecimal.ROUND_HALF_UP);
   }

   public static BigDecimal multiply(BigDecimal val1, BigDecimal val2) {
      return val1 == null || val2 == null ? null : val1.multiply(val2);
   }
}
