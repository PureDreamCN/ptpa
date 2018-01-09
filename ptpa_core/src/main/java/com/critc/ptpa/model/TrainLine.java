/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

import org.springframework.stereotype.Repository;

/**
 * what:  车次线路区段model
 *
 * @author 杨超凡 created on 2017/11/29
 */
@Repository
public class TrainLine {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 所属车次
     */
    private Integer trainId;
    /**
     * 线路代码
     */
    private String xldm;
    /**
     * 线路名称
     */
    private String xldmName;
    /**
     * 区段起始站
     */
    private String beginCzdm;
    /**
     * 区段起始站名称
     */
    private String beginCzdmName;
    /**
     * 区段终点站
     */
    private String endCzdm;
    /**
     * 区段起始站名称
     */
    private String endCzdmName;
    /**
     * 里程
     */
    private Integer mileage;
    /**
     * 线路清算等级代码
     */
    private String linePriceLevelCode;
    /**
     * 线路清算等级名称
     */
    private String linePriceLevelName;
    /**
     * 列车类型代码
     */
    private String trainTypeCode;
    /**
     * 列车类型名称
     */
    private String trainTypeName;
    /**
     * 列车编组类型编码
     */
    private String trainMarshallingTypeCode;
    /**
     * 列车编组类型名称
     */
    private String trainMarshallingTypeName;
    /**
     * 线路繁忙程度编码
     */
    private String lineBusyLevelCode;
    /**
     * 线路繁忙程度名称
     */
    private String lineBusyLevelName;
    /**
     *是否在22时至次日6时运行
     */
    private Integer beforeDawn;
    /**
     * 在22时至次日6时运行折算比例
     */
    private Double beforeDawnRate;
    /**
     * 清算单价
     */
    private Double price;
    /**
     * 排序
     */
    private Integer orderIndex;

    private Integer rownum;

    public Integer getOrderIndex() {
        return orderIndex;
    }

    public void setOrderIndex(Integer orderIndex) {
        this.orderIndex = orderIndex;
    }

    public Integer getRownum() {
        return rownum;
    }

    public void setRownum(Integer rownum) {
        this.rownum = rownum;
    }

    public Double getBeforeDawnRate() {
        return beforeDawnRate;
    }

    public void setBeforeDawnRate(Double beforeDawnRate) {
        this.beforeDawnRate = beforeDawnRate;
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

    public Integer getMileage() {
        return mileage;
    }

    public void setMileage(Integer mileage) {
        this.mileage = mileage;
    }

    public String getLinePriceLevelCode() {
        return linePriceLevelCode;
    }

    public void setLinePriceLevelCode(String linePriceLevelCode) {
        this.linePriceLevelCode = linePriceLevelCode;
    }

    public String getLinePriceLevelName() {
        return linePriceLevelName;
    }

    public void setLinePriceLevelName(String linePriceLevelName) {
        this.linePriceLevelName = linePriceLevelName;
    }

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

    public String getLineBusyLevelCode() {
        return lineBusyLevelCode;
    }

    public void setLineBusyLevelCode(String lineBusyLevelCode) {
        this.lineBusyLevelCode = lineBusyLevelCode;
    }

    public String getLineBusyLevelName() {
        return lineBusyLevelName;
    }

    public void setLineBusyLevelName(String lineBusyLevelName) {
        this.lineBusyLevelName = lineBusyLevelName;
    }

    public Integer getBeforeDawn() {
        return beforeDawn;
    }

    public void setBeforeDawn(Integer beforeDawn) {
        this.beforeDawn = beforeDawn;
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double cost(){
        return getPrice()*getMileage();
    }
}
