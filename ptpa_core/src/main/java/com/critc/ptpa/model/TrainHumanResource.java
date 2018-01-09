/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

/**
 * what:  车次人力配置model
 *
 * @author 杨超凡 created on 2017/11/29
 */
public class TrainHumanResource {
    /**
     * 主键
     */
    private String id;
    /**
     * 所属车次
     */
    private Integer trainId;
    /**
     * 人力类型代码
     */
    private String humanResourceTypeCode;
    /**
     * 人力类型名称
     */
    private String humanResourceTypeName;
    /**
     * 铁路局代码
     */
    private String ljdm;
    /**
     * 平均人力支出
     */
    private Double price;
    /**
     * 人数
     */
    private Double rate;

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getTrainId() {
        return trainId;
    }

    public void setTrainId(Integer trainId) {
        this.trainId = trainId;
    }

    public String getHumanResourceTypeCode() {
        return humanResourceTypeCode;
    }

    public void setHumanResourceTypeCode(String humanResourceTypeCode) {
        this.humanResourceTypeCode = humanResourceTypeCode;
    }

    public String getHumanResourceTypeName() {
        return humanResourceTypeName;
    }

    public void setHumanResourceTypeName(String humanResourceTypeName) {
        this.humanResourceTypeName = humanResourceTypeName;
    }

    public String getLjdm() {
        return ljdm;
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double cost(){
        if(getPrice()==null||getRate()==null) {
            return 0d;
        } else {
            return getPrice()*getRate();
        }
    }
}
