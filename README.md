#### 报错内容:
>```
>Error running 'ServiceStarter': Command line is too long. Shorten command 
>line for ServiceStarter or also for Application default configuration.
>```
#### 解决办法：
>```
>修改项目下 .idea\workspace.xml，找到标签 <component name="PropertiesComponent">， 
>在标签里加一行 <property name="dynamic.classpath" value="true" />
>如果还报错，那么重启idea
>```