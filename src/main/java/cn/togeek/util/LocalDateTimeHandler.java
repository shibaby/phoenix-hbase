package cn.togeek.util;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
import org.springframework.stereotype.Component;

/**
 * @Auther: shibaobao
 * @Date: 2020/3/18 17:04
 */
@Component
public class LocalDateTimeHandler implements TypeHandler<LocalDateTime> {

   @Override
   public LocalDateTime getResult(ResultSet rs, String str) throws SQLException {
      System.out.println(TimeUtils.stringToLocalDateTime(rs.getString(str), "yyyy-MM-dd HH:mm:ss.S"));
      return TimeUtils.stringToLocalDateTime(rs.getString(str), "yyyy-MM-dd HH:mm:ss.S");
   }

   @Override
   public LocalDateTime getResult(ResultSet arg0, int arg1) throws SQLException {
      return null;
   }

   @Override
   public LocalDateTime getResult(CallableStatement arg0, int arg1) throws SQLException {
      // TODO Auto-generated method stub
      return null;
   }

   @Override
   public void setParameter(PreparedStatement arg0, int arg1, LocalDateTime arg2, JdbcType arg3) throws SQLException {

   }
}
