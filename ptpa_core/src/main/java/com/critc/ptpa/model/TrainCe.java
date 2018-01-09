/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

/**
 * what:  车次接触网区段model
 *
 * @author 杨超凡 created on 2017/12/3
 */
public class TrainCe {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 所属车次
     */
    private Integer  trainId;
    /**
     * 线路代码
     */
    private String xldm;
    /**
     * 线路名称
     */
    private String xldmName;
    /**
     * 区段起点站
     */
    private String beginCzdm;
    /**
     * 区段起始站名称
     */
    private String beginCzdmName;
    /**
     * 区段讫点站
     */
    private String endCzdm;
    /**
     * 区段讫点站名称
     */
    private String endCzdmName;
    /**
     * 客专企业代码
     */
    private String pseCode;
    /**
     * 客专企业代码名称
     */
    private String pseName;
    /**
     * 铁路局
     */
    private String ljdm;
    /**
     * 里程
     */
    private Integer mileage;
    /**
     * 接触网清算单价
     */
    private Double catenaryPrice;
    /**
     * 电费清算单价
     */
    private Double electricityPrice;
    /**
     * 排序
     */
    private Integer orderIndex;
    private Integer rownum;

    public Integer getRownum() {
        return rownum;
    }

    public void setRownum(Integer rownum) {
        this.rownum = rownum;
    }

    public String getLjdm() {
        return ljdm;
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
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

    public String getXldm() {
        return xldm;
    }

    public void setXldm(String xldm) {
        this.xldm = xldm;
    }

    public String getXldmName() {
        return xldmName;
    }

    public void setXldmName(String xldmName) {
        this.xldmName = xldmName;
    }

    public String getBeginCzdm() {
        return beginCzdm;
    }

    public void setBeginCzdm(String beginCzdm) {
        this.beginCzdm = beginCzdm;
    }

    public String getBeginCzdmName() {
        return beginCzdmName;
    }

    public void setBeginCzdmName(String beginCzdmName) {
        this.beginCzdmName = beginCzdmName;
    }

    public String getEndCzdm() {
        return endCzdm;
    }

    public void setEndCzdm(String endCzdm) {
        this.endCzdm = endCzdm;
    }

    public String getEndCzdmName() {
        return endCzdmName;
    }

    public void setEndCzdmName(String endCzdmName) {
        this.endCzdmName = endCzdmName;
    }

    public String getPseCode() {
        return pseCode;
    }

    public void setPseCode(String pseCode) {
        this.pseCode = pseCode;
    }

    public String getPseName() {
        return pseName;
    }

    public void setPseName(String pseName) {
        this.pseName = pseName;
    }

    public Integer getMileage() {
        return mileage;
    }

    public void setMileage(Integer mileage) {
        this.mileage = mileage;
    }

    public Double getCatenaryPrice() {
        return catenaryPrice;
    }

    public void setCatenaryPrice(Double catenaryPrice) {
        this.catenaryPrice = catenaryPrice;
    }

    public Double getElectricityPrice() {
        return electricityPrice;
    }

    public void setElectricityPrice(Double electricityPrice) {
        this.electricityPrice = electricityPrice;
    }

    public Integer getOrderIndex() {
        return orderIndex;
    }

    public void setOrderIndex(Integer orderIndex) {
        this.orderIndex = orderIndex;
    }
    public Double cost(){
        return (getElectricityPrice()+getCatenaryPrice()) * getMileage();

    }
}
