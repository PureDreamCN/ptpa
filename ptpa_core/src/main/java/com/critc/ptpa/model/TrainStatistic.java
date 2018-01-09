/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.model;

import java.util.Date;

/**
 * what:    旅客统计类

 *
 * @author 郭飞  created on 2017/11/30
 */
public class TrainStatistic {
    //主键
    private int id;
    //交路号
    private int jlCode;
    //日期

    private Date statisticDate;
    //车次
    private String cc;
    //旅客发送量（人）
    private int passengerVolume;
    //全程周转量（人公里）
    private int passengerMileage;
    //票价合计（元）
    private int fareSum;
    //路局
    private String ljdm;
    //创建人
    private String createdBy;
    //创建时间
    private Date createdAt;
    //上次修改人


    @Override
    public String toString() {
        return "TrainStatistic{" +
                "id=" + id +
                ", jlCode=" + jlCode +
                ", statisticDate=" + statisticDate +
                ", cc='" + cc + '\'' +
                ", passengerVolume=" + passengerVolume +
                ", passengerMileage=" + passengerMileage +
                ", fareSum=" + fareSum +
                ", ljdm='" + ljdm + '\'' +
                ", createdBy='" + createdBy + '\'' +
                ", createdAt=" + createdAt +
                ", lastModifiedBy='" + lastModifiedBy + '\'' +
                ", lastModifiedAt=" + lastModifiedAt +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getJlCode() {
        return jlCode;
    }

    public void setJlCode(int jlCode) {
        this.jlCode = jlCode;
    }

    public Date getStatisticDate() {
        return statisticDate;
    }

    public void setStatisticDate(Date statisticDate) {
        this.statisticDate = statisticDate;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public int getPassengerVolume() {
        return passengerVolume;
    }

    public void setPassengerVolume(int passengerVolume) {
        this.passengerVolume = passengerVolume;
    }

    public int getPassengerMileage() {
        return passengerMileage;
    }

    public void setPassengerMileage(int passengerMileage) {
        this.passengerMileage = passengerMileage;
    }

    public int getFareSum() {
        return fareSum;
    }

    public void setFareSum(int fareSum) {
        this.fareSum = fareSum;
    }

    public String getLjdm() {
        return ljdm;
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
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

    private String lastModifiedBy;
    //上次修改时间
    private Date lastModifiedAt;










}
