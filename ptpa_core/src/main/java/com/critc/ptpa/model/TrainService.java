/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

/**
 * what:  车次服务model
 *
 * @author 杨超凡 created on 2017/11/30
 */
public class TrainService {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 所属车次ID
     */
    private Integer trainId;
    /**
     * 服务代码
     */
    private String serviceCode;
    /**
     * 服务名称
     */
    private String serviceName;
    /**
     * 铁路局代码
     */
    private String ljdm;
    /**
     * 服务计量单位
     */
    private String unit;
    /**
     * 清算单价
     */
    private Double price;
    /**
     * 排序
     */
    private String orderIndex;
    /**
     * 服务次数
     */
    private float count;


    public float getCount() {
        return count;
    }

    public void setCount(float count) {
        this.count = count;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
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

    public String getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getLjdm() {
        return ljdm;
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getOrderIndex() {
        return orderIndex;
    }

    public void setOrderIndex(String orderIndex) {
        this.orderIndex = orderIndex;

    }
    public Double cost() {
        return getPrice()*getCount();
    }
}
