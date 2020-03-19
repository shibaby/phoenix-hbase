package cn.togeek.util;

public class Constants {
   /**
    * Organization status: 待审核
    */
   public static final int PENDING = 1;

   /**
    * Organization status: 审核未通过
    */
   public static final int NOT_PASS = 2;

   /**
    * Organization status: 审核通过
    */
   public static final int PASS = 4;

   /**
    * Organization status: 禁止交易
    */
   public static final int TRADING_PROHIBITION = 8;

   /**
    * Organization status: 允许交易
    */
   public static final int ALLOW_TRADING = 16;

   /**
    * Organization type: 集团公司
    */
   public static final int GROUP = 1;

   /**
    * Organization type: 区域组织
    */
   public static final int AREA = 2;

   /**
    * Organization type: 售电公司
    */
   public static final int SELL = 4;

   /**
    * Organization type: 发电企业/项目公司（电源商）
    */
   public static final int PROJECT = 8;

   /**
    * Organization type: 居间商
    */
   public static final int MIDDLEMAN = 16;

   /**
    * Organization type: 服务商
    */
   public static final int SERVICE_PROVIDER = 32;

   /**
    * Organization type: 运维商
    */
   public static final int PERATION_MAINTENACE = 64;

   /**
    * Organization type: 产品商
    */
   public static final int PRODUCT = 128;

   /**
    * Organization type: 电力用户
    */
   public static final int POWER_USER = 256;

   /**
    * 电源类型: 火电
    */
   public static final int COAL = 1;

   /**
    * 电源类型: 水电
    */
   public static final int HYDRO = 2;

   /**
    * 电源类型: 风电
    */
   public static final int WIND = 4;

   /**
    * 电源类型: 光伏
    */
   public static final int PHOTOVOLTAIC = 8;

   /**
    * 电源类型: 燃气
    */
   public static final int GAS = 16;

   /**
    * 电源类型: 热力
    */
   public static final int HOT = 32;

   /**
    * 电源类型: 生物质
    */
   public static final int BIOMASS = 64;

   /**
    * 电源类型: 其它
    */
   public static final int OTHER = 4096;

   /**
    * 服务商类型: 新能源运维
    */
   public static final int NEW_ENERGY_OPERATION = 1;

   /**
    * 服务商类型: 综合能源服务
    */
   public static final int INTEGRATED_ENERGY_SERVICE = 2;

   /**
    * 服务商类型: 检修公司
    */
   public static final int OVERHAUL = 4;

   /**
    * Description: 禁用
    */
   public static final byte FALSE = 0;

   /**
    * Description: 禁用
    */
   public static final byte FALSE2 = 2;

   /**
    * Description: 启用
    */
   public static final byte TRUE = 1;

   /**
    * Description: 完善(默认)
    */
   public static final byte TRUEORGN = 1;

   /**
    * Description: 不完善
    */
   public static final byte FALSEORGN = 0;

   /**
    * 企业注册审核（0表示未审核, 1表示审核通过，2表示审核未通过，空代表无需审核）
    */
   public static final int AUDIT_STATUS_ONE = 0;

   /**
    * 企业注册审核（0表示未审核, 1表示审核通过，2表示审核未通过，空代表无需审核）
    */
   public static final int REGISTER_AUDIT_MESSAGE_CODE = 13;

   /**
    * 系统消息（企业注册待审核）
    */
   public static final int AUDIT_MESSAGE_TYPE = 1;

   /**
    * 集团组织id
    */
   public static final String GROUP_ORG = "CRPH500";

   /**
    * 用户注册类型 用户注册
    */
   public static final Byte REGISTE_TYPE_USER = (byte) 1;

   /**
    * 用户注册类型 系统注册
    */
   public static final Byte REGISTE_TYPE_SYSTEM = (byte) 2;
}