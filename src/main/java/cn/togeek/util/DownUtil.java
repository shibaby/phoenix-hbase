package cn.togeek.util;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @author luzhaobo
 * @2019-08-12
 */
public class DownUtil {
    /**
     * @param  byteArrayOutputStream 将文件路径
     * @param response HttpServletResponse  写入response
     * @param returnName 返回的文件名
     */
    public static void download(ByteArrayOutputStream byteArrayOutputStream, HttpServletResponse response, String returnName)  {

        OutputStream outputstream = null;
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            response.setContentType("application/msword");
            response.setHeader("Content-Disposition", "attachment; filename=" + returnName);
            response.setContentLength(byteArrayOutputStream.size());
            outputstream = response.getOutputStream();
            byteArrayOutputStream.writeTo(outputstream);
            byteArrayOutputStream.close();
            outputstream.flush();
            outputstream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


}
