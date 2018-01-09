/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

/**
 * what:  车次车辆类型维修model <br/>
 *
 * @author 杨超凡 created on 2017/12/6
 */
public class TrainVehicleMaintain {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 车次编组ID
     */
    private Integer trainVehicleId;
    /**
     * 维修类别代码
     */
    private String vehicleMaintainTypeCode;
    /**
     * 维修类别名称
     */
    private String vehicleMaintainTypeName;
    /**
     * 平均年使用费用
     */
    private Double charge;
    /**
     * 清算单价
     */
    private Double price;
    /**
     * 排序
     */
    private Integer orderIndex;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTrainVehicleId() {
        return trainVehicleId;
    }

    public void setTrainVehicleId(Integer trainVehicleId) {
        this.trainVehicleId = trainVehicleId;
    }

    public String getVehicleMaintainTypeCode() {
        return vehicleMaintainTypeCode;
    }

    public void setVehicleMaintainTypeCode(String vehicleMaintainTypeCode) {
        this.vehicleMaintainTypeCode = vehicleMaintainTypeCode;
    }

    public String getVehicleMaintainTypeName() {
        return vehicleMaintainTypeName;
    }

    public void setVehicleMaintainTypeName(String vehicleMaintainTypeName) {
        this.vehicleMaintainTypeName = vehicleMaintainTypeName;
    }

    public Double getCharge() {
        return charge;
    }

    public void setCharge(Double charge) {
        this.charge = charge;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getOrderIndex() {
        return orderIndex;
    }

    public void setOrderIndex(Integer orderIndex) {
        this.orderIndex = orderIndex;
    }
}
