/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Web
 */
package com.critc.ptpa.model;

/**
 * what: 车次各席别全程售票收入清算单价 <br/>
 *
 * @author 杨超凡 created on 2017/12/4
 */
public class TrainTicketprice {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 所属车次
     */
    private Integer trainId;
    /**
     * 席别编码
     */
    private String seatTypeCode;
    /**
     * 席别名称
     */
    private String seatTypeName;
    /**
     * 清算单价
     */
    private Double price;
    /**
     * 排序
     */
    private Integer orderIndex;

    public Integer getOrderIndex() {
        return orderIndex;
    }

    public void setOrderIndex(Integer orderIndex) {
        this.orderIndex = orderIndex;
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
