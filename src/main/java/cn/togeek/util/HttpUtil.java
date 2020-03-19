package cn.togeek.util;

import com.alibaba.druid.support.json.JSONUtils;
import org.springframework.util.StreamUtils;

import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.Map;

public class HttpUtil {

   public static String sendHttpRequest(String url, Map<String, Object> parame) throws Exception {
      URL httpUrl = new URL(url);
      HttpURLConnection conn = (HttpURLConnection) httpUrl.openConnection();
      conn.setDoOutput(true);
      String parastr = JSONUtils.toJSONString(parame);
      conn.getOutputStream().write(parastr.getBytes("UTF-8"));
      conn.setDoInput(true);
      conn.connect();
      String result = StreamUtils.copyToString(conn.getInputStream(), Charset.forName("UTF-8"));
      return result;
   }
}
