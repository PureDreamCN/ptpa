/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

/**
 * what:  车次编组车辆席位配置model <br/>
 *
 * @author 杨超凡 created on 2017/12/6
 */
public class TrainVehicleSeat {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 车次编组车辆ID
     */
    private Integer trainVehicleId;
    /**
     * 席别编码
     */
    private String seatTypeCode;
    /**
     * 席别名称
     */
    private String seatTypeName;
    /**
     * 定员
     */
    private Integer capacity;
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

    public String getSeatTypeCode() {
        return seatTypeCode;
    }

    public void setSeatTypeCode(String seatTypeCode) {
        this.seatTypeCode = seatTypeCode;
    }

    public String getSeatTypeName() {
        return seatTypeName;
    }

    public void setSeatTypeName(String seatTypeName) {
        this.seatTypeName = seatTypeName;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public Integer getOrderIndex() {
        return orderIndex;
    }

    public void setOrderIndex(Integer orderIndex) {
        this.orderIndex = orderIndex;
    }
}
