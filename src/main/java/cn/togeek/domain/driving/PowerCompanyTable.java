package cn.togeek.domain.driving;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @author wangb
 * @description:
 * @create: 2019-10-11 16:32
 */
@Data
public class PowerCompanyTable  {
    @ApiModelProperty("唯一编号")
    private String id;
    @ApiModelProperty(value = "序号")
    private Integer indexNum;
    @ApiModelProperty(value = "发电企业名称")
    private String companyName;
    @ApiModelProperty(value = "所属发电集团")
    private String superCompany;
    @ApiModelProperty(value = "调度简称")
    private String scheduShortName;
    @ApiModelProperty(value = "机组容量(MW)")
    private BigDecimal unitCapacity;
    @ApiModelProperty(value = "机组数量（台）")
    private String unitsNumber;
    @ApiModelProperty(value = "统一社会信用代码")
    private String creditCode;
    @ApiModelProperty(value = "成立日期")
    private LocalDateTime establishDay;
    @ApiModelProperty(value = "营业执照编号")
    private String businessLicense;
    @ApiModelProperty(value = "注册成本")
    private String registrationCost;
    @ApiModelProperty(value = "公司性质")
    private String companyType;
    @ApiModelProperty(value = "企业注册地址")
    private String registrationAddress;
    @ApiModelProperty(value = "办公地点")
    private String officeLocation;
    @ApiModelProperty(value = "公司法人")
    private String corporate;
    @ApiModelProperty(value = "供电煤耗（g/kwh）")
    private BigDecimal elecCoalCost;
    @ApiModelProperty(value = "是否供热")
    private Boolean isHeating;
    @ApiModelProperty(value = "是否储能")
    private Boolean isEnergyStorage;
    @ApiModelProperty(value = "地理坐标（经度）")
    private String gisLongitude;
    @ApiModelProperty(value = "地理坐标（纬度）")
    private String gisLatitude;
    @ApiModelProperty(value = "地理区域")
    private String geographicalArea;
    @ApiModelProperty(value = "发电类型")
    private String poweGenerationType;
    //======================
    @ApiModelProperty(value = "发电公司id")
    private String proCompanyId;
    @ApiModelProperty(value = "日期")
    private LocalDateTime dayDate;
    @ApiModelProperty(value = "日发电量")
    private BigDecimal proElec;
    @ApiModelProperty(value = "日供电煤耗")
    private BigDecimal depleteCoal;
    @ApiModelProperty(value = "全省日发电量")
    private BigDecimal provinceTotlleProElec;
    @ApiModelProperty(value = "全省日供电煤耗")
    private BigDecimal provinceTotlleDepleteCoal;
    @ApiModelProperty(value = "火电装机容量（MW）")
    private BigDecimal fireElecInsertCap;
    @ApiModelProperty(value = "火电装机等级")
    private String fireElecInsertLevel;
    @ApiModelProperty(value = "水电装机容量（万千瓦）")
    private BigDecimal waterElecInsertCap;
    @ApiModelProperty(value = "水电装机等级")
    private String waterElecInsertLevel;
    @ApiModelProperty(value = "风电装机容量（万千瓦）")
    private BigDecimal windElecInsertCap;
    @ApiModelProperty(value = "风电装机等级")
    private String windElecInsertLevel;
    @ApiModelProperty(value = "光伏装机容量（万千瓦）")
    private BigDecimal sunElecInsertCap;
    @ApiModelProperty(value = "光伏装机容量等级")
    private String sunElecInsertLevel;
    @ApiModelProperty(value = "火电机组利用小时")
    private BigDecimal fireUseHour;
    @ApiModelProperty(value = "火电机组利用小时等级")
    private String fireUseHourLevel;
    @ApiModelProperty(value = "水电机组利用小时")
    private BigDecimal waterUseHour;
    @ApiModelProperty(value = "水电机组利用小时等级")
    private String waterUseHourLevel;
    @ApiModelProperty(value = "风电机组利用小时")
    private BigDecimal windUseHour;
    @ApiModelProperty(value = "风电机组利用小时等级")
    private String windUseHourLevel;
    @ApiModelProperty(value = "光伏机组利用小时")
    private BigDecimal sunUseHour;
    @ApiModelProperty(value = "光伏机组利用小时等级")
    private String sunUseHourLevel;
    //======================

  /*  @ApiModelProperty(value = "基础信息")
    private  PowerCompanyBasicInfo basicInfo;

    @ApiModelProperty(value = "日生产")
    private PowerCompanyDayProductStatus dayProductStatus;
*/
/*
    public PowerCompanyTable() {
    }
*/

  /*  public PowerCompanyTable(PowerCompanyBasicInfo basicInfo, PowerCompanyDayProductStatus dayProductStatus) {
        this.basicInfo = basicInfo;
        this.dayProductStatus = dayProductStatus;
    }*/
}