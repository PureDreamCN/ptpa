/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.model;

import javax.validation.constraints.Digits;

/**
 * what:  线路清算实体类
 *
 * @author 马丽静 created on 2017/11/24
 */
public class LinePrice {
    private int id;//主键
    private String linePriceLevelCode;//线路等级代码
    private String linePriceLevelName;//线路等级名称C
    private String trainTypeCode;//列车类型代码
    private String trainTypeName;//列车类型名称
    private String trainMarshallingTypeCode;//列车编组类型编码
    private String trainMarshallingTypeName;//列车编组类型名称
    private String lineBusyLevelCode;//线路繁忙程度编码
    private String lineBusyLevelName;//线路繁忙程度名称
    private String beforeDawn;//是否在22时至次日6时运行
    @Digits(integer = 13, fraction = 2)
    private Double beforeDawnRate;//在22时至次日6时运行折算比例
    @Digits(integer = 13, fraction = 2)
    private Double price;//在22时至次日6时运行折算比例

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getBeforeDawn() {
        return beforeDawn;
    }

    public void setBeforeDawn(String beforeDawn) {
        this.beforeDawn = beforeDawn;
    }

    public Double getBeforeDawnRate() {
        return beforeDawnRate;
    }

    public void setBeforeDawnRate(Double beforeDawnRate) {
        this.beforeDawnRate = beforeDawnRate;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "LinePrice{" +
                "id=" + id +
                ", linePriceLevelCode='" + linePriceLevelCode + '\'' +
                ", linePriceLevelName='" + linePriceLevelName + '\'' +
                ", trainTypeCode='" + trainTypeCode + '\'' +
                ", trainTypeName='" + trainTypeName + '\'' +
                ", trainMarshallingTypeCode='" + trainMarshallingTypeCode + '\'' +
                ", trainMarshallingTypeName='" + trainMarshallingTypeName + '\'' +
                ", lineBusyLevelCode='" + lineBusyLevelCode + '\'' +
                ", lineBusyLevelName='" + lineBusyLevelName + '\'' +
                ", beforeDawn='" + beforeDawn + '\'' +
                ", beforeDawnRate=" + beforeDawnRate +
                ", price=" + price +
                '}';
    }
}
