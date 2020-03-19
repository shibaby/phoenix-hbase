/*
 Navicat Premium Data Transfer

 Source Server         : 47.92.156.176
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : 47.92.156.176:3306
 Source Schema         : trade_analysis_data_demo

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 03/03/2020 22:28:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_area_supply_demand_month
-- ----------------------------
DROP TABLE IF EXISTS `t_area_supply_demand_month`;
CREATE TABLE `t_area_supply_demand_month`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NOT NULL COMMENT '月份',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名称',
  `market_supply` decimal(20, 4) NULL DEFAULT NULL COMMENT '市场供应量MW',
  `market_demand` decimal(20, 4) NULL DEFAULT NULL COMMENT '市场需求量MW',
  `market_sd_ratio` decimal(20, 4) NULL DEFAULT NULL COMMENT '市场供需比',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供需比分析',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区域月度供需情况' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_area_month_product_status
-- ----------------------------
DROP TABLE IF EXISTS `t_base_area_month_product_status`;
CREATE TABLE `t_base_area_month_product_status`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `area_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区名称',
  `month_time` date NOT NULL COMMENT '月份时间',
  `area_deplete_coal_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '地区累计煤耗',
  `area_pro_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '地区月发电量',
  `area_fire_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '地区火电月累计发电量',
  `area_water_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '地区水电月累计发电量',
  `area_wind_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '地区风电月累计发电量',
  `area_sun_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '地区光伏月累计发电量',
  `area_deplete_coal_month_avg` decimal(20, 4) NULL DEFAULT NULL COMMENT '地区月平均煤耗',
  `fire_use_hour_parea_mavg` decimal(20, 4) NULL DEFAULT NULL COMMENT '火电地区月平均利用小时数',
  `fire_use_hour_area_mtotle` decimal(20, 4) NULL DEFAULT NULL COMMENT '火电地区月累计利用小时数',
  `water_use_hour_area_mavg` decimal(20, 4) NULL DEFAULT NULL COMMENT '水电地区月平均利用小时数',
  `water_use_hour_area_mtotle` decimal(20, 4) NULL DEFAULT NULL COMMENT '水电地区月累计利用小时数',
  `wind_use_hour_area_mavg` decimal(20, 4) NULL DEFAULT NULL COMMENT '风电地区月平均利用小时数',
  `wind_use_hour_area_mtotle` decimal(20, 4) NULL DEFAULT NULL COMMENT '风电地区月累计利用小时数',
  `sun_use_hour_area_mavg` decimal(20, 4) NULL DEFAULT NULL COMMENT '光伏地区月平均利用小时数',
  `sun_use_hour_area_mtotle` decimal(20, 4) NULL DEFAULT NULL COMMENT '光伏地区月累计利用小时数',
  `totle_elec_insert_cap_area` decimal(20, 4) NULL DEFAULT NULL COMMENT '地区总装机容量（MW）',
  `fire_elec_insert_cap_area` decimal(20, 4) NULL DEFAULT NULL COMMENT '火电地区总装机容量（MW）',
  `water_elec_insert_cap_area` decimal(20, 4) NULL DEFAULT NULL COMMENT '水全地区总装机容量（万千瓦）',
  `wind_elec_insert_cap_area` decimal(20, 4) NULL DEFAULT NULL COMMENT '风电地区总装机容量（万千瓦）',
  `sun_elec_insert_cap_area` decimal(20, 4) NULL DEFAULT NULL COMMENT '光伏地区总装机容量（万千瓦）',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地区发电月度生产情况 t_base_area_month_product_status' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_department
-- ----------------------------
DROP TABLE IF EXISTS `t_base_department`;
CREATE TABLE `t_base_department`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门描述',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级部门ID',
  `organization_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_organization
-- ----------------------------
DROP TABLE IF EXISTS `t_base_organization`;
CREATE TABLE `t_base_organization`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织ID',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织名称',
  `alias` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织别名',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '组织状态',
  `type` int(11) NOT NULL COMMENT '组织类型',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级组织ID',
  `orderby` int(11) NOT NULL DEFAULT 0,
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_base_permission`;
CREATE TABLE `t_base_permission`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限编号',
  `label` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源url',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限描述',
  `parent_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父权限名称',
  `parent_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父权限url',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `orderby` int(10) NULL DEFAULT NULL COMMENT '排序字段',
  `filter` tinyint(1) NULL DEFAULT 0 COMMENT '过滤字段',
  `action` int(11) NULL DEFAULT NULL COMMENT '@see AccessMode',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_power_company_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `t_base_power_company_basic_info`;
CREATE TABLE `t_base_power_company_basic_info`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `index_num` int(11) NULL DEFAULT NULL COMMENT '序号',
  `company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发电企业名称',
  `super_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属发电集团',
  `schedu_short_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调度简称',
  `unit_capacity` decimal(20, 4) NULL DEFAULT NULL COMMENT '机组容量(MW)',
  `units_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机组数量（台）',
  `credit_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `establish_day` datetime(0) NULL DEFAULT NULL COMMENT '成立日期',
  `business_license` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照编号',
  `registration_cost` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册成本',
  `company_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司性质',
  `registration_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业注册地址',
  `office_location` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地点',
  `corporate` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司法人',
  `elec_coal_cost` decimal(20, 4) NULL DEFAULT NULL COMMENT '供电煤耗（g/kwh）',
  `is_heating` tinyint(1) NULL DEFAULT NULL COMMENT '是否供热',
  `is_energy_storage` tinyint(1) NULL DEFAULT NULL COMMENT '是否储能',
  `gis_longitude` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地理坐标（经度）',
  `gis_latitude` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地理坐标（纬度）',
  `geographical_area` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地理区域',
  `powe_generation_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发电类型',
  `fire_elec_insert_cap` decimal(20, 4) NULL DEFAULT NULL COMMENT '火电装机容量（MW）',
  `fire_elec_insert_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '火电装机等级',
  `water_elec_insert_cap` decimal(20, 4) NULL DEFAULT NULL COMMENT '水电装机容量（万千瓦）',
  `water_elec_insert_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水电装机等级',
  `wind_elec_insert_cap` decimal(20, 4) NULL DEFAULT NULL COMMENT '风电装机容量（万千瓦）',
  `wind_elec_insert_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '风电装机等级',
  `sun_elec_insert_cap` decimal(20, 4) NULL DEFAULT NULL COMMENT '光伏装机容量（万千瓦）',
  `sun_elec_insert_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '光伏装机容量等级',
  `fire_use_hour` decimal(20, 4) NULL DEFAULT NULL COMMENT '火电机组利用小时',
  `fire_use_hour_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '火电机组利用小时等级',
  `water_use_hour` decimal(20, 4) NULL DEFAULT NULL COMMENT '水电机组利用小时',
  `water_use_hour_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水电机组利用小时等级',
  `wind_use_hour` decimal(20, 4) NULL DEFAULT NULL COMMENT '风电机组利用小时',
  `wind_use_hour_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '风电机组利用小时等级',
  `sun_use_hour` decimal(20, 4) NULL DEFAULT NULL COMMENT '光伏机组利用小时',
  `sun_use_hour_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '光伏机组利用小时等级',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发电公司基础信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_power_company_month_product_status
-- ----------------------------
DROP TABLE IF EXISTS `t_base_power_company_month_product_status`;
CREATE TABLE `t_base_power_company_month_product_status`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `pro_company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发电公司id',
  `month_time` date NULL DEFAULT NULL COMMENT '月份时间',
  `deplete_coal_month_avg` decimal(20, 4) NULL DEFAULT NULL COMMENT '公司月平均煤耗',
  `deplete_coal_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '公司累计煤耗',
  `product_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '月累计发电量',
  `fire_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '火电月累计发电量',
  `water_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '水电月累计发电量',
  `wind_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '风电月累计发电量',
  `sun_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '光伏月累计发电量',
  `fire_use_hou_mavg` decimal(20, 4) NULL DEFAULT NULL COMMENT '火电公司月平均利用小时数',
  `fire_use_hou_mtotle` decimal(20, 4) NULL DEFAULT NULL COMMENT '火电公司月累计利用小时数',
  `water_use_hour_mavg` decimal(20, 4) NULL DEFAULT NULL COMMENT '水电公司月平均利用小时数',
  `water_use_hour_mtotle` decimal(20, 4) NULL DEFAULT NULL COMMENT '水电公司月累计利用小时数',
  `wind_use_hour_mavg` decimal(20, 4) NULL DEFAULT NULL COMMENT '风电公司月平均利用小时数',
  `wind_use_hour_mtotle` decimal(20, 4) NULL DEFAULT NULL COMMENT '风电公司月累计利用小时数',
  `sun_use_hour_mavg` decimal(20, 4) NULL DEFAULT NULL COMMENT '光伏公司月平均利用小时数',
  `sun_use_hour_mtotle` decimal(20, 4) NULL DEFAULT NULL COMMENT '光伏公司月累计利用小时数',
  `totle_elec_insert_cap` decimal(20, 4) NULL DEFAULT NULL COMMENT '总装机容量（万千瓦）',
  `fire_elec_insert_cap` decimal(20, 4) NULL DEFAULT NULL COMMENT '火电总装机容量（MW）',
  `water_elec_insert_cap` decimal(20, 4) NULL DEFAULT NULL COMMENT '水电总装机容量（万千瓦）',
  `wind_elec_insert_cap` decimal(20, 4) NULL DEFAULT NULL COMMENT '风电总装机容量（万千瓦）',
  `sun_elec_insert_cap` decimal(20, 4) NULL DEFAULT NULL COMMENT '光伏总装机容量（万千瓦）',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ind_t_base_power_month_plant_id`(`pro_company_id`) USING BTREE,
  INDEX `ind_t_base_power_month_time`(`month_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发电公司月度生产情况power_company_month_product_status' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_power_user_basic_information
-- ----------------------------
DROP TABLE IF EXISTS `t_base_power_user_basic_information`;
CREATE TABLE `t_base_power_user_basic_information`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `power_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电力用户名称',
  `industry_category` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产业类别',
  `voltage_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电压等级',
  `avg_elec_consumption` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年平均用电量',
  `user_nature` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户性质',
  `area` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属区域',
  `gis_longitude` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'gis经度',
  `gis_latitude` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'gis纬度',
  `credit_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业名称',
  `establishment_date` date NULL DEFAULT NULL COMMENT '成立日期',
  `business_license` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照',
  `registration_cost` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册成本',
  `company_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司性质',
  `regist_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业注册地址',
  `office_location` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地点',
  `corporate` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司法人',
  `corporate_doc_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人证件类型',
  `corporate_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人证件号',
  `contact` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `legal_identif` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人身份证明',
  `contact_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `contact_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系邮箱',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单个电力用户基础信息 t_base_power_user_basic_information' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_power_user_industry_category_voltage
-- ----------------------------
DROP TABLE IF EXISTS `t_base_power_user_industry_category_voltage`;
CREATE TABLE `t_base_power_user_industry_category_voltage`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NULL DEFAULT NULL COMMENT '月份',
  `pu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电力用户Id',
  `pu_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电力用户名称',
  `user_nature` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户性质',
  `industry_category_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电力用户产业类别id',
  `industry_category_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电力用户产业类别名称',
  `voltage_level_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电力用户电压等级Id',
  `voltage_level_value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电力用户电压等级值',
  `energy_used` decimal(20, 4) NULL DEFAULT NULL COMMENT '本月总用电量',
  `month_on_month` decimal(20, 4) NULL DEFAULT NULL COMMENT '本月用电量同比',
  `ring_ratio` decimal(20, 4) NULL DEFAULT NULL COMMENT '本月用电量环比',
  `growth_reduction_rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '用电量的增长减少率',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `category_total_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '本月同产业总用电量',
  `voltage_total_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '本月同电压等级总用电量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电力用户产业类别以及电压 t_base_power_user_industry_category_voltage  ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_province_month_product_status
-- ----------------------------
DROP TABLE IF EXISTS `t_base_province_month_product_status`;
CREATE TABLE `t_base_province_month_product_status`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month_time` date NOT NULL COMMENT '月份时间',
  `province_deplete_coal_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '全省累计煤耗',
  `province_pro_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '全省月发电量',
  `province_deplete_coal_month_avg` decimal(20, 4) NULL DEFAULT NULL COMMENT '全省月平均煤耗',
  `fire_use_hour_province_mavg` decimal(20, 4) NULL DEFAULT NULL COMMENT '火电全省月平均利用小时数',
  `fire_use_hour_province_mtotle` decimal(20, 4) NULL DEFAULT NULL COMMENT '火电全省月累计利用小时数',
  `water_use_hour_province_mavg` decimal(20, 4) NULL DEFAULT NULL COMMENT '水电全省月平均利用小时数',
  `water_use_hour_province_mtotle` decimal(20, 4) NULL DEFAULT NULL COMMENT '水电全省月累计利用小时数',
  `wind_use_hour_province_mavg` decimal(20, 4) NULL DEFAULT NULL COMMENT '风电全省月平均利用小时数',
  `wind_use_hour_province_mtotle` decimal(20, 4) NULL DEFAULT NULL COMMENT '风电全省月累计利用小时数',
  `sun_use_hour_province_mavg` decimal(20, 4) NULL DEFAULT NULL COMMENT '光伏全省月平均利用小时数',
  `sun_use_hour_province_mtotle` decimal(20, 4) NULL DEFAULT NULL COMMENT '光伏全省月累计利用小时数',
  `totle_elec_insert_cap_province` decimal(20, 4) NULL DEFAULT NULL COMMENT '全省总装机容量（MW）',
  `fire_elec_insert_cap_province` decimal(20, 4) NULL DEFAULT NULL COMMENT '火电全省总装机容量（MW）',
  `water_elec_insert_cap_province` decimal(20, 4) NULL DEFAULT NULL COMMENT '水全省电总装机容量（万千瓦）',
  `wind_elec_insert_cap_province` decimal(20, 4) NULL DEFAULT NULL COMMENT '风电全省总装机容量（万千瓦）',
  `sun_elec_insert_cap_province` decimal(20, 4) NULL DEFAULT NULL COMMENT '光伏全省总装机容量（万千瓦）',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `province_fire_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '全省火电月累计发电量',
  `province_water_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '全省水电月累计发电量',
  `province_wind_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '全省风电月累计发电量',
  `province_sun_elec_month_totle` decimal(20, 4) NULL DEFAULT NULL COMMENT '全省光伏月累计发电量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全省发电月度生产情况t_base_province_month_product_status' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_role
-- ----------------------------
DROP TABLE IF EXISTS `t_base_role`;
CREATE TABLE `t_base_role`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `department_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `depart_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `organization_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织ID',
  `orderby` int(11) NULL DEFAULT 0 COMMENT '顺序',
  `globaled` tinyint(1) NULL DEFAULT NULL COMMENT '是否公共权限组',
  `enabled` tinyint(1) NOT NULL COMMENT '是否禁用',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `level` int(8) NOT NULL DEFAULT 0 COMMENT '角色等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_sale_company_basic_information
-- ----------------------------
DROP TABLE IF EXISTS `t_base_sale_company_basic_information`;
CREATE TABLE `t_base_sale_company_basic_information`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `registe_classification` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册分类',
  `registe_capital` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册资本',
  `total_capital` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资本总额',
  `annual_sales_cap` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年售电上限',
  `social_credit_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统社会信用代码',
  `company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业名称',
  `establishment_date` date NULL DEFAULT NULL COMMENT '成立日期',
  `business_license` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照',
  `registration_cost` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册成本',
  `company_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司性质',
  `registe_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业注册地址',
  `office_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公地址',
  `corporate` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司法人',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `enterprise_scale` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业规模',
  `credit_level` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信用等级',
  `area_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '售电公司基本信息 t_base_sale_company_basic_information' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_sale_company_month_rating_industry_type
-- ----------------------------
DROP TABLE IF EXISTS `t_base_sale_company_month_rating_industry_type`;
CREATE TABLE `t_base_sale_company_month_rating_industry_type`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NULL DEFAULT NULL COMMENT '月份',
  `comp_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售电(被代理)公司id',
  `comp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售电(被代理)公司名称',
  `is_sale_comp` int(11) NULL DEFAULT NULL COMMENT '是否为售电公司（1售电公司；0被代理企业）',
  `industry_type_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本月产业类别id',
  `industry_type_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本月产业类别名称',
  `business_scale` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业规模',
  `number_proxy_users` int(11) NULL DEFAULT NULL COMMENT '代理用户数量',
  `total_power_generation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理总发电量（亿千瓦时）',
  `proxy_user_num_area` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理用户数占区域百分比',
  `proxy_user_num_province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理用户数占全省百分比',
  `proxy_elec_area` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理用电量占区域百分比',
  `proxy_elec_province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理用电量占全省百分比',
  `credit_rating` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信用等级',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `statistics_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计类型：01-统计全部产业，02-按产业类别统计',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '售电公司月度企业评级产业类别 t_base_sale_company_month_rating_industry_typ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_sale_company_proxy_user
-- ----------------------------
DROP TABLE IF EXISTS `t_base_sale_company_proxy_user`;
CREATE TABLE `t_base_sale_company_proxy_user`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `sale_company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售电公司id',
  `sale_company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售电公司名称',
  `proxy_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理用户名称',
  `proxy_user_indus_categ` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理用户产业类别',
  `proxy_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '代理电量（千瓦时）',
  `business_scale` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业规模（亿元）',
  `company_credit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司信用',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `month` date NOT NULL COMMENT '月份',
  `sale_company_area` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售电公司所在区域',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '售电公司代理企业信息t_base_sale_company_proxy_user' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_base_user
-- ----------------------------
DROP TABLE IF EXISTS `t_base_user`;
CREATE TABLE `t_base_user`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `nick_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '出生年月',
  `gender` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `phone_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `identity_card_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否禁用',
  `salt` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '加密盐值',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `has_orgn` tinyint(4) NOT NULL DEFAULT 1 COMMENT '组织信息是否完善',
  `position` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `yuan_jing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它系统用户ID',
  `registe_type` tinyint(4) NULL DEFAULT 1 COMMENT '注册方式 1 用户注册 2 系统注册',
  `wechat_open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信服务号open_id',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `phone_number`(`phone_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_info_publish_month
-- ----------------------------
DROP TABLE IF EXISTS `t_info_publish_month`;
CREATE TABLE `t_info_publish_month`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NOT NULL COMMENT '月份',
  `in_transaction_seq_count` int(11) NULL DEFAULT NULL COMMENT '正在组织次数',
  `start_transaction_seq_count` int(11) NULL DEFAULT NULL COMMENT '当月发布次数',
  `complete_transaction_seq_count` int(11) NULL DEFAULT NULL COMMENT '当年完成次数',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '当月交易序列信息发布情况统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_market_contract_power_distribution
-- ----------------------------
DROP TABLE IF EXISTS `t_market_contract_power_distribution`;
CREATE TABLE `t_market_contract_power_distribution`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `time_day` date NOT NULL COMMENT 'time_day',
  `out_transaction_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '省间交易电量',
  `in_transaction_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '省内交易电量',
  `out_bilateral_negotiation` decimal(20, 4) NULL DEFAULT NULL COMMENT '省间双边协商',
  `out_concentrated_bidding` decimal(20, 4) NULL DEFAULT NULL COMMENT '省间集中竞价',
  `out_listed_trading_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '省间挂牌交易电量',
  `in_bilateral_negotiation` decimal(20, 4) NULL DEFAULT NULL COMMENT '省内双边协商',
  `in_concentrated_bidding` decimal(20, 4) NULL DEFAULT NULL COMMENT '省内集中竞价',
  `in_listed_trading_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '省内挂牌交易电量',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 't_market_contract_power_distribution 市场运营合约电量分布' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_market_day_system_load_detection
-- ----------------------------
DROP TABLE IF EXISTS `t_market_day_system_load_detection`;
CREATE TABLE `t_market_day_system_load_detection`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `day_time` date NOT NULL COMMENT '日期',
  `max_load_growth` decimal(20, 4) NULL DEFAULT NULL COMMENT '最大负荷增长',
  `max_load_reduction` decimal(20, 4) NULL DEFAULT NULL COMMENT '最大负荷减少',
  `avg_load_change_rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '平均负荷变化率',
  `avg_load_growth` decimal(20, 4) NULL DEFAULT NULL COMMENT '平均负荷增长',
  `avg_load_reduction` decimal(20, 4) NULL DEFAULT NULL COMMENT '平均负荷减少',
  `min_load_change_rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '最小负荷变化率',
  `min_load_growth` decimal(20, 4) NULL DEFAULT NULL COMMENT '最小负荷增长',
  `min_load_reduction` decimal(20, 4) NULL DEFAULT NULL COMMENT '最小负荷减少',
  `max_load_change_rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '最大负荷变化率',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '市场可靠-日负荷监测 t_market_day_system_load_detection' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_market_driving_market_income
-- ----------------------------
DROP TABLE IF EXISTS `t_market_driving_market_income`;
CREATE TABLE `t_market_driving_market_income`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NOT NULL COMMENT '月份',
  `ecir_period_avg_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '用电成本改善率-本期平均购电价格',
  `ecir_lastyear_avg_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '用电成本改善率-去年同期平均购电价格',
  `ecir_improvement_rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '用电成本改善率-改善率',
  `ryoy_power_gene_last_earning` decimal(20, 4) NULL DEFAULT NULL COMMENT '收益同比=发电企业-上期收益',
  `ryoy_power_gene_period_earning` decimal(20, 4) NULL DEFAULT NULL COMMENT '收益同比=发电企业-本期收益',
  `ryoy_power_gene_period_increase_decrease` decimal(20, 4) NULL DEFAULT NULL COMMENT '收益同比=发电企业-收益同比增加或减小比',
  `ryoy_sales_gene_last_earning` decimal(20, 4) NULL DEFAULT NULL COMMENT '收益同比=售电公司-上期收益',
  `ryoy_sales_gene_period_earning` decimal(20, 4) NULL DEFAULT NULL COMMENT '收益同比=售电公司-本期收益',
  `ryoy_sales_gene_period_increase_decrease` decimal(20, 4) NULL DEFAULT NULL COMMENT '收益同比=售电公司-收益同比增加或减小比',
  `mdan_power_gene_grid_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '市场让利分配分析=发电让利-上网电价',
  `mdan_power_gene_transac_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '市场让利分配分析=发电让利-成交电价',
  `mdan_power_gene_let_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '市场让利分配分析=发电让利-让利',
  `mdan_power_user_grid_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '市场让利分配分析=用户让利-上网电价',
  `mdan_power_user_transac_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '市场让利分配分析=用户让利-成交电价',
  `mdan_power_user_let_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '市场让利分配分析=用户让利-让利',
  `new_energy_generation` decimal(20, 4) NULL DEFAULT NULL COMMENT '新能源占比-新能源发电量',
  `new_energy_totle_generation` decimal(20, 4) NULL DEFAULT NULL COMMENT '新能源占比-总发电量',
  `new_energy_proportion` decimal(20, 4) NULL DEFAULT NULL COMMENT '新能源占比-新能源占比',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '驾驶舱市场收益 t_market_driveing_market_income' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_market_market_reliable_all_data
-- ----------------------------
DROP TABLE IF EXISTS `t_market_market_reliable_all_data`;
CREATE TABLE `t_market_market_reliable_all_data`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month_time` date NOT NULL COMMENT '月份时间',
  `sys_max_load` decimal(20, 4) NULL DEFAULT NULL COMMENT '系统负荷监测=系统最高负荷',
  `sys_low_voltage_load` decimal(20, 4) NULL DEFAULT NULL COMMENT '系统负荷监测=系统低压负荷',
  `sys_avg_load` decimal(20, 4) NULL DEFAULT NULL COMMENT '系统负荷监测=系统平均负荷',
  `full_network_load` decimal(20, 4) NULL DEFAULT NULL COMMENT '全网负荷率及峰谷差率=全网负荷KW',
  `load_factor` decimal(20, 4) NULL DEFAULT NULL COMMENT '全网负荷率及峰谷差率=负荷率',
  `peak_valley_diff` decimal(20, 4) NULL DEFAULT NULL COMMENT '全网负荷率及峰谷差率=峰谷差率',
  `unit_max_generating_capacity` decimal(20, 4) NULL DEFAULT NULL COMMENT '系统剩余容量百分比=累积机组最大可发电容量',
  `unit_accumulate_capacity` decimal(20, 4) NULL DEFAULT NULL COMMENT '系统剩余容量百分比=累积机组实际发电容量',
  `sys_remaining_capacity_percentage` decimal(20, 4) NULL DEFAULT NULL COMMENT '系统剩余容量百分比=系统剩余容量百分比',
  `actual_power` decimal(20, 4) NULL DEFAULT NULL COMMENT '失负荷率=实际电量MWH',
  `power_outage` decimal(20, 4) NULL DEFAULT NULL COMMENT '失负荷率=停电电量MWH',
  `load_loss_rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '失负荷率=失负荷率%',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `declare_power` decimal(20, 4) NULL DEFAULT NULL COMMENT '新能源日前申报偏差=日前申报电量',
  `online_power` decimal(20, 4) NULL DEFAULT NULL COMMENT '新能源日前申报偏差=实际上网电量',
  `deviation` decimal(20, 4) NULL DEFAULT NULL COMMENT '新能源日前申报偏差=偏差',
  `medium_long_term_avg_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '电价波动指标=中长期合约加权价',
  `cash_sale_avg_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '电价波动指标=现货加权价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '市场可靠-驾驶舱数据  market_reliable_all_data' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_market_new_energy_bid_rate
-- ----------------------------
DROP TABLE IF EXISTS `t_market_new_energy_bid_rate`;
CREATE TABLE `t_market_new_energy_bid_rate`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'id',
  `time_day` date NULL DEFAULT NULL COMMENT '采集日期',
  `power_declare_elec` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '火电申报电量',
  `power_trans_elec` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '火电成交电量',
  `newenergy_declare_elec` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新能源申报电量',
  `newenergy_trans_elec` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新能源成交电量',
  `power_bid_rate` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '火电中标率',
  `newenergy_bid_rate` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新能源中标率',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '能源中标率 t_market_new_energy_bid_rate' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_market_operation_in_15minutes_data
-- ----------------------------
DROP TABLE IF EXISTS `t_market_operation_in_15minutes_data`;
CREATE TABLE `t_market_operation_in_15minutes_data`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `minute_time` datetime(0) NOT NULL COMMENT '时间',
  `high_quote_rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '高报价达线率',
  `low_quote_rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '低报价达线率',
  `high_quote_load_val` decimal(20, 4) NULL DEFAULT NULL COMMENT '高报价负荷值',
  `low_quote_load_val` decimal(20, 4) NULL DEFAULT NULL COMMENT '低报价负荷值',
  `units_number` int(11) NULL DEFAULT NULL COMMENT '机组数量',
  `contract_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '合约成交电价',
  `contract_volume` decimal(20, 4) NULL DEFAULT NULL COMMENT '合约成交电量',
  `c_medium_long_elec_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电企业—中长期电价',
  `c_recently_elec_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电企业—日前电价',
  `c_realtime_elec_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电企业—实时电价',
  `c_trading_contract_volume` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电企业—交易合约成交电量',
  `c_recently_market_turnover` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电企业—日前市场成交电量',
  `c_realtime_market_turnover` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电企业—实时市场成交电量',
  `u_medium_long_elec_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '直接交易用户—中长期电价',
  `u_recently_elec_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '直接交易用户—日前电价',
  `u_realtime_elec_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '直接交易用户—实时电价',
  `u_trading_contract_volume` decimal(20, 4) NULL DEFAULT NULL COMMENT '直接交易用户—交易合约成交电量',
  `u_recently_market_turnover` decimal(20, 4) NULL DEFAULT NULL COMMENT '直接交易用户—日前市场成交电量',
  `u_realtime_market_turnover` decimal(20, 4) NULL DEFAULT NULL COMMENT '直接交易用户—实时市场成交电量',
  `temp_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '临时时间坐标',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '市场运营15分钟数据集合表 market_operation_in_15minutes_data' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_market_power_company_hhi_top
-- ----------------------------
DROP TABLE IF EXISTS `t_market_power_company_hhi_top`;
CREATE TABLE `t_market_power_company_hhi_top`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NOT NULL COMMENT '月份',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发电企业名称',
  `online_power` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电企业上网电量',
  `hhi` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电企业HHI值',
  `hhi_proportion` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电企业hhi占比',
  `top` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电企业top值',
  `top_proportion` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电企业top占比',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发电企业HHI/TOP指数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_market_power_group_hhi_top
-- ----------------------------
DROP TABLE IF EXISTS `t_market_power_group_hhi_top`;
CREATE TABLE `t_market_power_group_hhi_top`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NOT NULL COMMENT '月份',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发电集团名称',
  `online_power` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电集团上网电量',
  `hhi` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电集团HHI值',
  `hhi_proportion` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电集团hhi占比',
  `top` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电集团top值',
  `top_proportion` decimal(20, 4) NULL DEFAULT NULL COMMENT '发电集团top占比',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发电集团HHI/TOP指数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_market_same_time
-- ----------------------------
DROP TABLE IF EXISTS `t_market_same_time`;
CREATE TABLE `t_market_same_time`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `day_time` date NOT NULL COMMENT '日期',
  `area` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域',
  `max_load_value` decimal(20, 4) NULL DEFAULT NULL COMMENT '最大负荷值',
  `max_network_load_value` decimal(20, 4) NULL DEFAULT NULL COMMENT '全网最大负荷值',
  `same_time` decimal(20, 0) NULL DEFAULT NULL COMMENT '同时率',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '市场可靠-同时率 t_market_same_time' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_market_structure_supply_demand
-- ----------------------------
DROP TABLE IF EXISTS `t_market_structure_supply_demand`;
CREATE TABLE `t_market_structure_supply_demand`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NOT NULL COMMENT '月份',
  `market_supply` decimal(20, 4) NULL DEFAULT NULL COMMENT '市场供应量MW',
  `market_demand` decimal(20, 4) NULL DEFAULT NULL COMMENT '市场需求量MW',
  `market_sd_ratio` decimal(20, 4) NULL DEFAULT NULL COMMENT '市场供需比',
  `index_supply` decimal(20, 4) NULL DEFAULT NULL COMMENT '供应侧HHI',
  `index_demand` decimal(20, 4) NULL DEFAULT NULL COMMENT '需求侧HHI',
  `un_hold_ratio` decimal(20, 4) NULL DEFAULT NULL COMMENT '机组持留比',
  `un_declarable_capacity` decimal(20, 4) NULL DEFAULT NULL COMMENT '机组可申报容量',
  `un_actual_declared_capacity` decimal(20, 4) NULL DEFAULT NULL COMMENT '机组实际申报容量',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '市场结构 structure_supply_demand' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_market_supply_demand_elasticity
-- ----------------------------
DROP TABLE IF EXISTS `t_market_supply_demand_elasticity`;
CREATE TABLE `t_market_supply_demand_elasticity`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NOT NULL COMMENT '月份',
  `total_electric` decimal(20, 4) NULL DEFAULT NULL COMMENT '总电量',
  `settle_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '结算价格',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别： 01-供应侧， 02-需求侧',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '市场供需弹性 market_supply_demand_elasticity' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_market_unplanned_outage_rate
-- ----------------------------
DROP TABLE IF EXISTS `t_market_unplanned_outage_rate`;
CREATE TABLE `t_market_unplanned_outage_rate`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month_time` date NOT NULL COMMENT '月份',
  `unit_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机组名称',
  `unplanned_outage_rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '非计划停运率',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '市场可靠-非计划停运率 t_market_unplanned_outage_rate' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_net_load
-- ----------------------------
DROP TABLE IF EXISTS `t_net_load`;
CREATE TABLE `t_net_load`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `time` datetime(0) NOT NULL COMMENT '时间，十五分钟一个点',
  `real_load` decimal(20, 4) NULL DEFAULT NULL COMMENT '实际负荷',
  `forecast_load` decimal(20, 4) NULL DEFAULT NULL COMMENT '预测负荷',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`, `time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全网96点负荷值和预测值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_province_out_power_month
-- ----------------------------
DROP TABLE IF EXISTS `t_province_out_power_month`;
CREATE TABLE `t_province_out_power_month`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NOT NULL COMMENT '月份',
  `to_yanhuai` decimal(20, 4) NULL DEFAULT NULL COMMENT '雁淮直流外送电量',
  `to_changnanjing` decimal(20, 4) NULL DEFAULT NULL COMMENT '长南荆外送电量',
  `to_dongsong` decimal(20, 4) NULL DEFAULT NULL COMMENT '东送通道外送电量',
  `in_total_elec_month` decimal(20, 4) NULL DEFAULT NULL COMMENT '省间当月累计外送电量',
  `in_total_elec_year` decimal(20, 4) NULL DEFAULT NULL COMMENT '省间当年累计外送电量',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '省间外送情况统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_province_transaction_mode_month
-- ----------------------------
DROP TABLE IF EXISTS `t_province_transaction_mode_month`;
CREATE TABLE `t_province_transaction_mode_month`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NOT NULL COMMENT '月份',
  `in_bilateral_negotiation_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '省内双边协商',
  `in_concentrated_bidding_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '省内集中竞价',
  `in_listed_trading_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '省内挂牌交易电量',
  `in_total_elec_year` decimal(20, 4) NULL DEFAULT NULL COMMENT '省内年度累计交易电量',
  `in_total_elec_month` decimal(20, 4) NULL DEFAULT NULL COMMENT '省内当月累计交易电量',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '省内月度交易方式情况统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_province_transaction_settle_month
-- ----------------------------
DROP TABLE IF EXISTS `t_province_transaction_settle_month`;
CREATE TABLE `t_province_transaction_settle_month`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NOT NULL COMMENT '月份',
  `out_province_transaction_total_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '省间外送累计交易电量',
  `out_province_settle_total_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '省间外送累计结算电量',
  `out_province_complete_ratio` decimal(20, 4) NULL DEFAULT NULL COMMENT '省间外送电量结算完成率',
  `in_province_transaction_total_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '省内累计交易电量',
  `in_province_settle_total_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '省间内累计结算电量',
  `in_province_complete_ratio` decimal(20, 4) NULL DEFAULT NULL COMMENT '省内交易电量结算完成率',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全省交易结算情况统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role_permission_mapping
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission_mapping`;
CREATE TABLE `t_role_permission_mapping`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一编号',
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `permission_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源ID',
  `access_mode` int(11) NULL DEFAULT NULL COMMENT '权限: C,R,U,D -> 1,2,4,8',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_transaction_member_day
-- ----------------------------
DROP TABLE IF EXISTS `t_transaction_member_day`;
CREATE TABLE `t_transaction_member_day`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `date` datetime(0) NOT NULL COMMENT '交易日期/天',
  `power_company_count` int(11) NULL DEFAULT NULL COMMENT '发电企业数量',
  `sale_company_count` int(11) NULL DEFAULT NULL COMMENT '售电公司数量',
  `retail_user_count` int(11) NULL DEFAULT NULL COMMENT '零售用户数量',
  `direct_user_count` int(11) NULL DEFAULT NULL COMMENT '直接交易用户数量',
  `total` int(11) NULL DEFAULT NULL COMMENT '参与交易市场主体总数量',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参与交易市场主体数量统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_transaction_month_totle_province_company_sales
-- ----------------------------
DROP TABLE IF EXISTS `t_transaction_month_totle_province_company_sales`;
CREATE TABLE `t_transaction_month_totle_province_company_sales`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `month` date NULL DEFAULT NULL COMMENT '月份',
  `power_users_province_numbe` int(11) NULL DEFAULT NULL COMMENT '全省电力用户数量',
  `power_comp_proxy_users_numbe` int(11) NULL DEFAULT NULL COMMENT '售电公司代理的电力用户数量',
  `power_users_province_electricity` decimal(20, 4) NULL DEFAULT NULL COMMENT '全省电力用户电量',
  `power_comp_proxy_users_electricity` decimal(20, 4) NULL DEFAULT NULL COMMENT '售电公司代理电力用户电量',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全省以及售电公司月度总交易情况transactions_month_totle_province_company_sal' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_transaction_power_company_realtimet_status
-- ----------------------------
DROP TABLE IF EXISTS `t_transaction_power_company_realtimet_status`;
CREATE TABLE `t_transaction_power_company_realtimet_status`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `pro_company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发电公司id',
  `transaction_time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `long_electricity` decimal(20, 4) NULL DEFAULT NULL COMMENT '中长期成交电量',
  `currently_electricity` decimal(20, 4) NULL DEFAULT NULL COMMENT '日前成交电量',
  `realtime_electricity` decimal(20, 4) NULL DEFAULT NULL COMMENT '实时成交电量',
  `long_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '中长期成交电价',
  `currently_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '日前成交电价',
  `realtime_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '实时成交电价',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发电公司实时交易情况（15min会更新一条交易数据）t_transaction_power_company_realti' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_transaction_power_user_cost_savings
-- ----------------------------
DROP TABLE IF EXISTS `t_transaction_power_user_cost_savings`;
CREATE TABLE `t_transaction_power_user_cost_savings`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `pu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电力用户id',
  `month` date NOT NULL COMMENT '月份',
  `energy_used` decimal(20, 4) NULL DEFAULT NULL COMMENT '总用电量',
  `benchmark_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '标杆电价',
  `settlement_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '结算电价',
  `cost_savings` decimal(20, 4) NULL DEFAULT NULL COMMENT '节省的电费',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `year_total_electric` decimal(20, 4) NULL DEFAULT NULL COMMENT '年累计电量',
  `year_avg_price` decimal(20, 2) NULL DEFAULT NULL COMMENT '年均电价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节约购电费用 t_transaction_power_user_cost_savings' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_transaction_power_user_realtimet_status
-- ----------------------------
DROP TABLE IF EXISTS `t_transaction_power_user_realtimet_status`;
CREATE TABLE `t_transaction_power_user_realtimet_status`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `pu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电力用户id',
  `transaction_time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `long_electricity` decimal(20, 4) NULL DEFAULT NULL COMMENT '中长期成交电量',
  `currently_electricity` decimal(20, 4) NULL DEFAULT NULL COMMENT '日前成交电量',
  `realtime_electricity` decimal(20, 4) NULL DEFAULT NULL COMMENT '实时成交电量',
  `long_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '中长期成交电价',
  `currently_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '日前成交电价',
  `realtime_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '实时成交电价',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电力用户实时交易情况（15min会更新一条交易数 t_transaction_power_user_realtimet_' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_transaction_price_day
-- ----------------------------
DROP TABLE IF EXISTS `t_transaction_price_day`;
CREATE TABLE `t_transaction_price_day`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `date` datetime(0) NOT NULL COMMENT '交易日期/天',
  `max_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '最高成交价',
  `max_price_time` datetime(0) NULL DEFAULT NULL COMMENT '最高成交价时间',
  `min_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '最低成交价',
  `min_price_time` datetime(0) NULL DEFAULT NULL COMMENT '最低成交价时间',
  `real_time_total_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '实时市场累计成交电量',
  `real_time_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '实时市场加权平均价',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '每日成交价统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_transaction_sale_elec_company_month_income_status
-- ----------------------------
DROP TABLE IF EXISTS `t_transaction_sale_elec_company_month_income_status`;
CREATE TABLE `t_transaction_sale_elec_company_month_income_status`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `sale_company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售电公司id',
  `month` date NULL DEFAULT NULL COMMENT '时间',
  `income` decimal(20, 4) NULL DEFAULT NULL COMMENT '现货收益',
  `long_income` decimal(20, 4) NULL DEFAULT NULL COMMENT '中长期收益',
  `same_comparison` decimal(20, 4) NULL DEFAULT NULL COMMENT '同比',
  `month_on_month_ratio` decimal(20, 4) NULL DEFAULT NULL COMMENT '环比',
  `tot_tran_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '累计成交电量',
  `tot_settlement_elec` decimal(20, 4) NULL DEFAULT NULL COMMENT '累计结算电量',
  `avg_transaction_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '平均成交电价',
  `avg_settlement_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '平均结算电价',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '售电公司月交易收益情况 t_transaction_sale_elec_company_month_income_sta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_transaction_sale_elec_company_realtimet_status
-- ----------------------------
DROP TABLE IF EXISTS `t_transaction_sale_elec_company_realtimet_status`;
CREATE TABLE `t_transaction_sale_elec_company_realtimet_status`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `sale_company_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售电公司id',
  `transaction_time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `long_electricity` decimal(20, 4) NULL DEFAULT NULL COMMENT '中长期成交电量',
  `currently_electricity` decimal(20, 4) NULL DEFAULT NULL COMMENT '日前成交电量',
  `realtime_electricity` decimal(20, 4) NULL DEFAULT NULL COMMENT '实时成交电量',
  `long_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '中长期成交电价',
  `currently_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '日前成交电价',
  `realtime_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '实时成交电价',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Id',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人Id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '售电公司实时交易情况（15min会更新一条交易数据t_transaction_sale_elec_company_rea' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_department_mapping
-- ----------------------------
DROP TABLE IF EXISTS `t_user_department_mapping`;
CREATE TABLE `t_user_department_mapping`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一编号',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `department_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门ID',
  `orderby` int(11) NOT NULL DEFAULT 0,
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_organization_mapping
-- ----------------------------
DROP TABLE IF EXISTS `t_user_organization_mapping`;
CREATE TABLE `t_user_organization_mapping`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一编号',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `organization_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织ID',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '用户状态',
  `internal` tinyint(1) NULL DEFAULT 0 COMMENT '是否为内部用户',
  `admin` tinyint(1) NULL DEFAULT 0 COMMENT '是否为管理员',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`, `organization_id`) USING BTREE,
  INDEX `department_id`(`organization_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和部门的关联关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_role_mapping
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role_mapping`;
CREATE TABLE `t_user_role_mapping`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一编号',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `organization_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modifier_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人ID',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色对应表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
