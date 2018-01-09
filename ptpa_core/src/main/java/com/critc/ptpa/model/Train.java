/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:core
 */
package com.critc.ptpa.model;

import com.critc.ptpa.service.PricePartService;
import com.critc.ptpa.service.TrainHumanResourceService;
import com.critc.ptpa.service.TrainLineService;
import com.critc.ptpa.service.TrainService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * what:  客车详情model
 *
 * @author 杨超凡 created on 2017/11/24
 */
public class Train {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 列车详情名称
     */
    private String name;
    /**
     * 车次
     */
    private String cc;
    /**
     * 年度开放列数
     */
//    private Integer frequency;
    /**
     * 客运列车类型代码
     */
    private String trainTypeCode;
    /**
     * 客运列车类型名称
     */
    private String trainTypeName;
    /**
     * 客运列车等级编码
     */
    private String trainLevelCode;
    /**
     * 客运列车等级名称
     */
    private String trainLevelName;
    /**
     * 担当局代码
     */
    private String ljdm;
    /**
     * 始发站代码
     */
    private String beginCzdm;
    /**
     * 始发站名称
     */
    private String beginCzdmName;
    /**
     * 终到站代码
     */
    private String endCzdm;
    /**
     * 终到站名称
     */
    private String endCzdmName;
    /**
     * 客车编组类型代码
     */
    private String trainMarshallingTypeCode;
    /**
     * 客车编组类型名称
     */
    private String trainMarshallingTypeName;
    /**
     * 车底数
     */
    private Integer vehicleGroupSize;
    /**
     * 车底占用比例
     */
    private String vehicleGroupRate;
    /**
     * 备品购置成本
     */
    private String trainPartPrice;
    /**
     * 备品使用周期
     */
//    private String trainPartPeriod;
    /**
     * 创建人
     */
    private String createdBy;
    /**
     * 创建时间
     */
    private String createdAt;
    /**
     * 上次修改人
     */
    private String lastModifiedBy;
    /**
     * 上次修改时间
     */
    private String lastModifiedAt;
    /**
     * 机辆部车底交路ID，来源“机辆部车底交路”
     */
    private Integer lvJlId;
    /**
     * 机辆部车底交路交路总里程
     */
    private Integer lvJlMileage;
    /**
     * 机辆部车底交路交路车次里程
     */
    private Integer lvJlMileageCc;
    /**
     * 备品清算单价
     */
    private Double partPrice;
    /**
     * 线路成本
     */
    private Double lineCost;
    /**
     * 牵引成本
     */
    private Double tractionCost;
    /**
     * 接触网成本
     */
    private Double ceCost;
    /**
     * 车辆折旧费用
     */
    private Double depreciationCost;
    /**
     * 车辆大修费用
     */
    private Double maintainAdvanceCost;
    /**
     * 车辆日常修费
     */
    private Double maintainNormalCost;
    /**
     * 人力成本
     */
    private Double humanResourceCost;
    /**
     * 备品成本
     */
    private Double partCost;
    /**
     * 固定服务成本
     */
    private Double serviceCost;
    /**
     * 车站旅客服务类型代码
     */
    private String stationServiceTypeCode;
    /**
     * 车站旅客服务类型名称
     */
    private String stationServiceTypeName;
    /**
     * 车站旅客服务清算单价
     */
    private Integer stationServicePrice;
    /**
     * 列车吨数
     */
    private Integer ds;

    public Integer getDs() {
        return ds;
    }

    public void setDs(Integer ds) {
        this.ds = ds;
    }

    public Double getServiceCost() {
        return serviceCost;
    }

    public void setServiceCost(Double serviceCost) {
        this.serviceCost = serviceCost;
    }

    public String getStationServiceTypeCode() {
        return stationServiceTypeCode;
    }

    public void setStationServiceTypeCode(String stationServiceTypeCode) {
        this.stationServiceTypeCode = stationServiceTypeCode;
    }

    public String getStationServiceTypeName() {
        return stationServiceTypeName;
    }

    public void setStationServiceTypeName(String stationServiceTypeName) {
        this.stationServiceTypeName = stationServiceTypeName;
    }

    public Integer getStationServicePrice() {
        return stationServicePrice;
    }

    public void setStationServicePrice(Integer stationServicePrice) {
        this.stationServicePrice = stationServicePrice;
    }

    public String getBeginCzdmName() {
        return beginCzdmName;
    }

    public void setBeginCzdmName(String beginCzdmName) {
        this.beginCzdmName = beginCzdmName;
    }

    public String getEndCzdmName() {
        return endCzdmName;
    }

    public void setEndCzdmName(String endCzdmName) {
        this.endCzdmName = endCzdmName;
    }

    public Double getLineCost() {
        return lineCost;
    }

    public void setLineCost(Double lineCost) {
        this.lineCost = lineCost;
    }

    public Double getTractionCost() {
        return tractionCost;
    }

    public void setTractionCost(Double tractionCost) {
        this.tractionCost = tractionCost;
    }

    public Double getCeCost() {
        return ceCost;
    }

    public void setCeCost(Double ceCost) {
        this.ceCost = ceCost;
    }

    public Double getDepreciationCost() {
        return depreciationCost;
    }

    public void setDepreciationCost(Double depreciationCost) {
        this.depreciationCost = depreciationCost;
    }

    public Double getMaintainAdvanceCost() {
        return maintainAdvanceCost;
    }

    public void setMaintainAdvanceCost(Double maintainAdvanceCost) {
        this.maintainAdvanceCost = maintainAdvanceCost;
    }

    public Double getMaintainNormalCost() {
        return maintainNormalCost;
    }

    public void setMaintainNormalCost(Double maintainNormalCost) {
        this.maintainNormalCost = maintainNormalCost;
    }

    public Double getHumanResourceCost() {
        return humanResourceCost;
    }

    public void setHumanResourceCost(Double humanResourceCost) {
        this.humanResourceCost = humanResourceCost;
    }

    public Double getPartCost() {
        return partCost;
    }

    public void setPartCost(Double partCost) {
        this.partCost = partCost;
    }

    public Double getPartPrice() {
        return partPrice;
    }

    public void setPartPrice(Double partPrice) {
        this.partPrice = partPrice;
    }

    public Integer getLvJlId() {
        return lvJlId;
    }

    public void setLvJlId(Integer lvJlId) {
        this.lvJlId = lvJlId;
    }

    public Integer getLvJlMileage() {
        return lvJlMileage;
    }

    public void setLvJlMileage(Integer lvJlMileage) {
        this.lvJlMileage = lvJlMileage;
    }

    public Integer getLvJlMileageCc() {
        return lvJlMileageCc;
    }

    public void setLvJlMileageCc(Integer lvJlMileageCc) {
        this.lvJlMileageCc = lvJlMileageCc;
    }

    public Integer getVehicleGroupSize() {
        return vehicleGroupSize;
    }

    public void setVehicleGroupSize(Integer vehicleGroupSize) {
        this.vehicleGroupSize = vehicleGroupSize;
    }

    public String getVehicleGroupRate() {
        return vehicleGroupRate;
    }

    public void setVehicleGroupRate(String vehicleGroupRate) {
        this.vehicleGroupRate = vehicleGroupRate;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

/*    public Integer getFrequency() {
        return frequency;
    }

    public void setFrequency(Integer frequency) {
        this.frequency = frequency;
    }*/

    public String getTrainTypeCode() {
        return trainTypeCode;
    }

    public void setTrainTypeCode(String trainTypeCode) {
        this.trainTypeCode = trainTypeCode;
    }

    public String getTrainTypeName() {
        return trainTypeName;
    }

    public void setTrainTypeName(String trainTypeName) {
        this.trainTypeName = trainTypeName;
    }

    public String getTrainLevelCode() {
        return trainLevelCode;
    }

    public void setTrainLevelCode(String trainLevelCode) {
        this.trainLevelCode = trainLevelCode;
    }

    public String getTrainLevelName() {
        return trainLevelName;
    }

    public void setTrainLevelName(String trainLevelName) {
        this.trainLevelName = trainLevelName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLjdm() {
        return ljdm;
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
    }

    public String getBeginCzdm() {
        return beginCzdm;
    }

    public void setBeginCzdm(String beginCzdm) {
        this.beginCzdm = beginCzdm;
    }

    public String getEndCzdm() {
        return endCzdm;
    }

    public void setEndCzdm(String endCzdm) {
        this.endCzdm = endCzdm;
    }

    public String getTrainMarshallingTypeCode() {
        return trainMarshallingTypeCode;
    }

    public void setTrainMarshallingTypeCode(String trainMarshallingTypeCode) {
        this.trainMarshallingTypeCode = trainMarshallingTypeCode;
    }

    public String getTrainMarshallingTypeName() {
        return trainMarshallingTypeName;
    }

    public void setTrainMarshallingTypeName(String trainMarshallingTypeName) {
        this.trainMarshallingTypeName = trainMarshallingTypeName;
    }

    public String getTrainPartPrice() {
        return trainPartPrice;
    }

    public void setTrainPartPrice(String trainPartPrice) {
        this.trainPartPrice = trainPartPrice;
    }

   /* public String getTrainPartPeriod() {
        return trainPartPeriod;
    }*/

   /* public void setTrainPartPeriod(String trainPartPeriod) {
        this.trainPartPeriod = trainPartPeriod;
    }*/

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    public String getLastModifiedAt() {
        return lastModifiedAt;
    }

    public void setLastModifiedAt(String lastModifiedAt) {
        this.lastModifiedAt = lastModifiedAt;
    }

}
