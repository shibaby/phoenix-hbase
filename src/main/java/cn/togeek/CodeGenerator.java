package cn.togeek;

import cn.togeek.entity.BaseEntity;
import cn.togeek.tools.Tool;
import com.baomidou.mybatisplus.core.exceptions.MybatisPlusException;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.ConstVal;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.FileOutConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.TemplateConfig;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

@Component
public class CodeGenerator {
   @Autowired
   private Environment env;

   private String scanner(String tip) {
      Scanner scanner = new Scanner(System.in);
      StringBuilder help = new StringBuilder();
      help.append("请输入" + tip + "：");
      System.err.println(help.toString());

      if(scanner.hasNext()) {
         String ipt = scanner.nextLine();

         if(StringUtils.isNotEmpty(ipt)) {
            return ipt.replaceAll("\\n", "");
         }
      }

      throw new MybatisPlusException("请输入正确的" + tip + "！");
   }

   public void generate() {
      while(true) {
         String tnameAndentity = scanner("表名,实体名(以空格分开,实体名不给,则默认为表名(去掉t_)),exist退出");

         if("exit".equalsIgnoreCase(tnameAndentity)) {
            return;
         }

         generate(tnameAndentity.trim());
      }
   }

   private void generate(String tnameAndentity) {
      int blank = tnameAndentity.indexOf(" ");
      String tableName = null;
      String entityName = null;

      if(blank > 0) {
         tableName = tnameAndentity.substring(0, blank).trim();
         entityName = tnameAndentity.substring(blank).trim();
      }
      else {
         tableName = tnameAndentity;
      }

      if(Tool.isNullOrEmpty(entityName)) {
         entityName = tableName.startsWith("t_") || tableName.startsWith("T_") ? tableName.substring(2) : tableName;
         entityName = NamingStrategy.capitalFirst(entityName);
      }

      AutoGenerator mpg = new AutoGenerator();

      // 全局配置
      GlobalConfig gc = new GlobalConfig();
      String projectPath = System.getProperty("user.dir");
      gc.setOutputDir(projectPath + "/src/main/java");
      gc.setAuthor("togeek");
      gc.setEntityName(entityName);
      gc.setMapperName(entityName + "Mapper");
      gc.setServiceName(entityName + "Service");
      gc.setControllerName(entityName + "Controller");

      gc.setOpen(false);
      mpg.setGlobalConfig(gc);

      // 数据源配置
      DataSourceConfig dsc = new DataSourceConfig();
      dsc.setUrl(env.getProperty("spring.datasource.url"));
      // dsc.setSchemaName("public");
      dsc.setDriverName(env.getProperty("spring.datasource.driver-class-name"));
      dsc.setUsername(env.getProperty("spring.datasource.username"));
      dsc.setPassword(env.getProperty("spring.datasource.password"));
      mpg.setDataSource(dsc);

      // 包配置
      PackageConfig pc = new PackageConfig();
      pc.setModuleName("generated");
      pc.setParent("cn.togeek");
      pc.setPathInfo(new HashMap<>());

      pc.getPathInfo().put(ConstVal.ENTITY_PATH, gc.getOutputDir() + "/cn/togeek/generated/entity");
      pc.getPathInfo().put(ConstVal.MAPPER_PATH, gc.getOutputDir() + "/cn/togeek/generated/mapper");
      pc.getPathInfo().put(ConstVal.SERVICE_PATH, gc.getOutputDir() + "/cn/togeek/generated/service");
      pc.getPathInfo().put(ConstVal.CONTROLLER_PATH, gc.getOutputDir() + "/cn/togeek/generated/controller");

      mpg.setPackageInfo(pc);

      // 自定义配置
      InjectionConfig cfg = new InjectionConfig() {
         @Override
         public void initMap() {
            // to do nothing
         }
      };

      // 如果模板引擎是 freemarker
      String templatePath = "/templates/mapper.xml.ftl";

      // 自定义输出配置
      List<FileOutConfig> focList = new ArrayList<>();
      // 自定义配置会被优先输出
      focList.add(new FileOutConfig(templatePath) {
         @Override
         public String outputFile(TableInfo tableInfo) {
            // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
            return projectPath + "/src/main/resources/mapper/" + pc.getModuleName() + "/" + tableInfo.getEntityName() +
               "Mapper" + StringPool.DOT_XML;
         }
      });

      cfg.setFileOutConfigList(focList);
      mpg.setCfg(cfg);

      // 配置模板
      TemplateConfig templateConfig = new TemplateConfig();

      // 配置自定义输出模板
      //指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别
      templateConfig.setEntity("templates/entity2.java");
      templateConfig.setMapper("templates/mapper2.java");
      templateConfig.setService("templates/service2.java");
      templateConfig.setController("templates/controller2.java");

      templateConfig.setXml(null);
      mpg.setTemplate(templateConfig);

      // 策略配置
      StrategyConfig strategy = new StrategyConfig();
      strategy.setNaming(NamingStrategy.underline_to_camel);
      strategy.setColumnNaming(NamingStrategy.underline_to_camel);
      strategy.setEntityLombokModel(true);
      strategy.setRestControllerStyle(true);
      strategy.setInclude(tableName);
      strategy.setSuperEntityClass(BaseEntity.class.getName());
      strategy.setSuperEntityColumns("id", "creator", "creator_id", "create_time", "modifier", "modifier_id",
         "modify_time");
      strategy.setControllerMappingHyphenStyle(true);
      strategy.setTablePrefix(pc.getModuleName() + "_");
      mpg.setStrategy(strategy);
      mpg.setTemplateEngine(new FreemarkerTemplateEngine());
      mpg.execute();
   }
}