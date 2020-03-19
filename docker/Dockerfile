#基础镜像
FROM java:8-jre
VOLUME /tmp
ADD trade-center-analysis-1.0.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-Dfile.encoding=UTF8", "-Duser.timezone=GMT+08", "-jar", "app.jar"]
EXPOSE 8085