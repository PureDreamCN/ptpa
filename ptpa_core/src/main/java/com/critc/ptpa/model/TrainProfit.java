/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Web
 */
package com.critc.ptpa.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * what:
 *
 * @author 杨超凡 created on 2017/12/5
 */
public class TrainProfit {
    /**
     * 线路成本
     */
    private Double lineCost = 0d;
    /**
     * 牵引成本
     */
    private Double tractionCost = 0d;
    /**
     * 接触网成本
     */
    private Double tractionceCost = 0d;
    /**
     * 车辆成本
     */
    private Double vehicleCost = 0d;
    /**
     * 人力成本
     */
    private Double humanCost = 0d;
    /**
     * 备品成本
     */
    private Double partCost = 0d;
    /**
     * 服务成本
     */
    private Double serviceCost = 0d;
    /**
     * 税收成本
     */
    private Double taxCost = 0d;
    /**
     * 总成本
     */
    private Double totalCost = 0d;
    /**
     * 线路区段list
     */
    private List<TrainLine> trainLineList;
    /**
     * 牵引区段list
     */
    private List<TrainTraction> trainTractionList;
    /**
     * 接触网区段list
     */
    private List<TrainCe> trainCeList;
    /**
     * 人力配置list
     */
    private List<TrainHumanResource> trainHumanResourceList;
    /**
     * 区段总里程
     */
    private Double totalMileage;

    


    public Double getLineCost() {
        return lineCost;
    }

    public void setLineCost(Double lineCost) {
        this.lineCost = lineCost;
    }

    public Double getTractionCost() {
        return tractionCost;
    }

    public void setTractionCost(Double tractionCost) {
        this.tractionCost = tractionCost;
    }

    public Double getTractionceCost() {
        return tractionceCost;
    }

    public void setTractionceCost(Double tractionceCost) {
        this.tractionceCost = tractionceCost;
    }

    public Double getVehicleCost() {
        return vehicleCost;
    }

    public void setVehicleCost(Double vehicleCost) {
        this.vehicleCost = vehicleCost;
    }

    public Double getHumanCost() {
        return humanCost;
    }

    public void setHumanCost(Double humanCost) {
        this.humanCost = humanCost;
    }

    public Double getPartCost() {
        return partCost;
    }

    public void setPartCost(Double partCost) {
        this.partCost = partCost;
    }

    public Double getServiceCost() {
        return serviceCost;
    }

    public void setServiceCost(Double serviceCost) {
        this.serviceCost = serviceCost;
    }

    public Double getTaxCost() {
        return taxCost;
    }

    public void setTaxCost(Double taxCost) {
        this.taxCost = taxCost;
    }

    public Double getTotalCost() {
        return totalCost;
    }

    @Override
    public String toString() {
        return "TrainProfit{" +
                "lineCost=" + lineCost +
                ", tractionCost=" + tractionCost +
                ", tractionceCost=" + tractionceCost +
                ", VehicleCost=" + vehicleCost +
                ", humanCost=" + humanCost +
                ", partCost=" + partCost +
                ", serviceCost=" + serviceCost +
                ", taxCost=" + taxCost +
                ", totalCost=" + totalCost +
                '}';
    }

    public void setTotalCost(Double totalCost) {
        this.totalCost = totalCost;
    }
    public Double totalCost(){
        return lineCost+tractionCost+tractionceCost+vehicleCost+humanCost+partCost+serviceCost;
    }
}
