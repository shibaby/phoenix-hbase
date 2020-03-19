package cn.togeek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.liquibase.LiquibaseAutoConfiguration;
import org.springframework.cloud.openfeign.EnableFeignClients;

import javax.annotation.PostConstruct;

@SpringBootApplication(scanBasePackages = {"cn.togeek"}, exclude = LiquibaseAutoConfiguration.class)
@EnableFeignClients
public class Application {
   @Autowired
   private CodeGenerator codeGenerator;

   @PostConstruct
   public void generate() {
     // generateCode();
   }

   private void generateCode() {
      codeGenerator.generate();
      System.exit(0);
   }

   public static void main(String[] args) {
      SpringApplication.run(Application.class, args);
   }
}