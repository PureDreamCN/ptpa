/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

/**
 * what:  车次编组车辆model
 *
 * @author 杨超凡 created on 2017/12/3
 */
public class TrainVehicle {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 所属车次ID
     */
    private Integer trainId;
    /**
     * 车型编码
     */
    private String cxCode;
    /**
     * 车型名称
     */
    private String cxName;
    /**
     * 车种编码
     */
    private String czCode;
    /**
     * 车种名称
     */
    private String czName;
    /**
     * 辆型编码
     */
    private String lxCode;
    /**
     * 辆型名称
     */
    private String lxName;
    /**
     * 购置成本
     */
    private Double purchasePrice;
    /**
     * 平均年走行公里
     */
    private Integer averageKilometer;
    /**
     * 折旧年限
     */
    private Integer depreciationPeriod;
    /**
     * 折旧残值率
     */
    private Double deperciationResidualRate;
    /**
     * 年折旧率
     */
    private Double deperciationRate;
    /**
     * 每公里折旧率
     */
    private Double deperciationPkRate;
    /**
     * 折旧清算单价
     */
    private Double deperciationPrice;
    /**
     * 维修清算单价
     */
//    private Double maintainPrice;
    /**
     * 排序
     */
    private Integer orderIndex;
    /**
     * 大修清算单价
     */
    private Double maintainAdvancePrice;
    /**
     * 日常修清算单价
     */
    private Double maintainNormalPrice;

    public Double getMaintainAdvancePrice() {
        return maintainAdvancePrice;
    }

    public void setMaintainAdvancePrice(Double maintainAdvancePrice) {
        this.maintainAdvancePrice = maintainAdvancePrice;
    }

    public Double getMaintainNormalPrice() {
        return maintainNormalPrice;
    }

    public void setMaintainNormalPrice(Double maintainNormalPrice) {
        this.maintainNormalPrice = maintainNormalPrice;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTrainId() {
        return trainId;
    }

    public void setTrainId(Integer trainId) {
        this.trainId = trainId;
    }

    public String getCxCode() {
        return cxCode;
    }

    public void setCxCode(String cxCode) {
        this.cxCode = cxCode;
    }

    public String getCxName() {
        return cxName;
    }

    public void setCxName(String cxName) {
        this.cxName = cxName;
    }

    public String getCzCode() {
        return czCode;
    }

    public void setCzCode(String czCode) {
        this.czCode = czCode;
    }

    public String getCzName() {
        return czName;
    }

    public void setCzName(String czName) {
        this.czName = czName;
    }

    public String getLxCode() {
        return lxCode;
    }

    public void setLxCode(String lxCode) {
        this.lxCode = lxCode;
    }

    public String getLxName() {
        return lxName;
    }

    public void setLxName(String lxName) {
        this.lxName = lxName;
    }

    public Double getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(Double purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    public Integer getAverageKilometer() {
        return averageKilometer;
    }

    public void setAverageKilometer(Integer averageKilometer) {
        this.averageKilometer = averageKilometer;
    }

    public Integer getDepreciationPeriod() {
        return depreciationPeriod;
    }

    public void setDepreciationPeriod(Integer depreciationPeriod) {
        this.depreciationPeriod = depreciationPeriod;
    }

    public Double getDeperciationResidualRate() {
        return deperciationResidualRate;
    }

    public void setDeperciationResidualRate(Double deperciationResidualRate) {
        this.deperciationResidualRate = deperciationResidualRate;
    }

    public Double getDeperciationRate() {
        return deperciationRate;
    }

    public void setDeperciationRate(Double deperciationRate) {
        this.deperciationRate = deperciationRate;
    }

    public Double getDeperciationPkRate() {
        return deperciationPkRate;
    }

    public void setDeperciationPkRate(Double deperciationPkRate) {
        this.deperciationPkRate = deperciationPkRate;
    }

    public Double getDeperciationPrice() {
        return deperciationPrice;
    }

    public void setDeperciationPrice(Double deperciationPrice) {
        this.deperciationPrice = deperciationPrice;
    }

//    public Double getMaintainPrice() {
//        return maintainPrice;
//    }
//
//    public void setMaintainPrice(Double maintainPrice) {
//        this.maintainPrice = maintainPrice;
//    }

    public Integer getOrderIndex() {
        return orderIndex;
    }

    public void setOrderIndex(Integer orderIndex) {
        this.orderIndex = orderIndex;
    }

}