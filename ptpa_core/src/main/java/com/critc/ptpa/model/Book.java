/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.model;

import java.util.Date;

/**
 * what:   客户账本类
 *
 * @author 郭飞 created on 2017/12/8
 */
public class Book {

    //主键
    private int id;
    //车次详情ID
    private int trainId;
    //车次
    private String cc;
    //车次编组信息
    private String name;
    //开行日期
    private Date startDate;
    //客运部票价收入
    private Double ptTickeIncoming = 0d;
    //客运部发送人数
    private Integer ptPersonCount =0;
    //发改部票价收入
    private Double drTickeIncoming = 0d;
    //发改部发送人数
    private Integer drPersonCount =0;
    //客运部售票服务成本
    private Double ptTicketServiceCost = 0d;
    //客运部车站服务成本
    private Double ptStationServiceCost = 0d;
    //发改部售票服务成本
    private Double drTicketServiceCost = 0d;
    //发改部车站服务成本
    private Double drStationServiceCost = 0d;
    //上水服务成本
    private Double waterServiceost = 0d;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTrainId() {
        return trainId;
    }

    public void setTrainId(int trainId) {
        this.trainId = trainId;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Double getPtTickeIncoming() {
        return ptTickeIncoming;
    }

    public void setPtTickeIncoming(Double ptTickeIncoming) {
        this.ptTickeIncoming = ptTickeIncoming;
    }

    public Integer getPtPersonCount() {
        return ptPersonCount;
    }

    public void setPtPersonCount(Integer ptPersonCount) {
        this.ptPersonCount = ptPersonCount;
    }

    public Double getDrTickeIncoming() {
        return drTickeIncoming;
    }

    public void setDrTickeIncoming(Double drTickeIncoming) {
        this.drTickeIncoming = drTickeIncoming;
    }

    public Integer getDrPersonCount() {
        return drPersonCount;
    }

    public void setDrPersonCount(Integer drPersonCount) {
        this.drPersonCount = drPersonCount;
    }

    public Double getPtTicketServiceCost() {
        return ptTicketServiceCost;
    }

    public void setPtTicketServiceCost(Double ptTicketServiceCost) {
        this.ptTicketServiceCost = ptTicketServiceCost;
    }

    public Double getPtStationServiceCost() {
        return ptStationServiceCost;
    }

    public void setPtStationServiceCost(Double ptStationServiceCost) {
        this.ptStationServiceCost = ptStationServiceCost;
    }

    public Double getDrTicketServiceCost() {
        return drTicketServiceCost;
    }

    public void setDrTicketServiceCost(Double drTicketServiceCost) {
        this.drTicketServiceCost = drTicketServiceCost;
    }

    public Double getDrStationServiceCost() {
        return drStationServiceCost;
    }

    public void setDrStationServiceCost(Double drStationServiceCost) {
        this.drStationServiceCost = drStationServiceCost;
    }

    public Double getWaterServiceost() {
        return waterServiceost;
    }

    public void setWaterServiceost(Double waterServiceost) {
        this.waterServiceost = waterServiceost;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", trainId=" + trainId +
                ", cc='" + cc + '\'' +
                ", name='" + name + '\'' +
                ", startDate=" + startDate +
                ", ptTickeIncoming=" + ptTickeIncoming +
                ", ptPersonCount=" + ptPersonCount +
                ", drTickeIncoming=" + drTickeIncoming +
                ", drPersonCount=" + drPersonCount +
                ", ptTicketServiceCost=" + ptTicketServiceCost +
                ", ptStationServiceCost=" + ptStationServiceCost +
                ", drTicketServiceCost=" + drTicketServiceCost +
                ", drStationServiceCost=" + drStationServiceCost +
                ", waterServiceost=" + waterServiceost +
                '}';
    }
}
