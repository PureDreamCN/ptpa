/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.model;

import java.util.Date;

/**
 * what:   客车统计类
 *
 * @author 郭飞 created on 2017/11/30
 */
public class TrainPs {
    //主键
    private int id;
    //上报车次
    private String cc;
    //担当局名称
    private String ddjmc;
    //区段代码
    private String lineCode;
    //区段起讫点
    private String beginEnd;



    //区段里程
    private int mileage;
    //线路名
    private String railwayName;
    //线路等级
    private String railwayLevel;
    //线路所属局名称
    private String railwaySsjmc;
    //机车种类
    private String locomotiveType;
    //机车配属局名称
    private String locomotivePsjmc;
    //列车公里
    private double trainMileage;
    //客车车辆公里合计
    private double trainVehicleMileageSum;
    //创建人
    private String createdBy;
    //创建时间
    private Date createdAt;
    //上次修改人
    private String lastModifiedBy;
    //上次修改时间
    private Date lastModifiedAt;
    @Override
    public String toString() {
        return "TrainPs{" +
                "id=" + id +
                ", cc='" + cc + '\'' +
                ", ddjmc='" + ddjmc + '\'' +
                ", lineCode='" + lineCode + '\'' +
                ", beginEnd='" + beginEnd + '\'' +
                ", mileage=" + mileage +
                ", railwayName='" + railwayName + '\'' +
                ", railwayLevel='" + railwayLevel + '\'' +
                ", railwaySsjmc='" + railwaySsjmc + '\'' +
                ", locomotiveType='" + locomotiveType + '\'' +
                ", locomotivePsjmc='" + locomotivePsjmc + '\'' +
                ", trainMileage=" + trainMileage +
                ", trainVehicleMileageSum=" + trainVehicleMileageSum +
                ", createdBy='" + createdBy + '\'' +
                ", createdAt=" + createdAt +
                ", lastModifiedBy='" + lastModifiedBy + '\'' +
                ", lastModifiedAt=" + lastModifiedAt +
                '}';
    }
    public int getMileage() {
        return mileage;
    }
    public void setMileage(int mileage) {
        this.mileage = mileage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getDdjmc() {
        return ddjmc;
    }

    public void setDdjmc(String ddjmc) {
        this.ddjmc = ddjmc;
    }

    public String getLineCode() {
        return lineCode;
    }

    public void setLineCode(String lineCode) {
        this.lineCode = lineCode;
    }

    public String getBeginEnd() {
        return beginEnd;
    }

    public void setBeginEnd(String beginEnd) {
        this.beginEnd = beginEnd;
    }
    public String getRailwayName() {
        return railwayName;
    }

    public void setRailwayName(String railwayName) {
        this.railwayName = railwayName;
    }

    public String getRailwayLevel() {
        return railwayLevel;
    }

    public void setRailwayLevel(String railwayLevel) {
        this.railwayLevel = railwayLevel;
    }

    public String getRailwaySsjmc() {
        return railwaySsjmc;
    }

    public void setRailwaySsjmc(String railwaySsjmc) {
        this.railwaySsjmc = railwaySsjmc;
    }

    public String getLocomotiveType() {
        return locomotiveType;
    }

    public void setLocomotiveType(String locomotiveType) {
        this.locomotiveType = locomotiveType;
    }

    public String getLocomotivePsjmc() {
        return locomotivePsjmc;
    }

    public void setLocomotivePsjmc(String locomotivePsjmc) {
        this.locomotivePsjmc = locomotivePsjmc;
    }

    public double getTrainMileage() {
        return trainMileage;
    }

    public void setTrainMileage(double trainMileage) {
        this.trainMileage = trainMileage;
    }

    public double getTrainVehicleMileageSum() {
        return trainVehicleMileageSum;
    }

    public void setTrainVehicleMileageSum(double trainVehicleMileageSum) {
        this.trainVehicleMileageSum = trainVehicleMileageSum;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    public Date getLastModifiedAt() {
        return lastModifiedAt;
    }

    public void setLastModifiedAt(Date lastModifiedAt) {
        this.lastModifiedAt = lastModifiedAt;
    }



}
