/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

import java.util.List;

/**
 * what:   计算成本所需资源。<br/>
 *
 * @author 杨超凡 created on 2017/12/7
 */
public class CostResource {
    /**
     * 年度开行列数
     */
    private Integer frequency;
    /**
     * 备品清算单价 每列每公里
     */
    private Double partPrice;
    /**
     * 列车开行一趟需要的线路成本
     */
    private Double lineCost = 0d;
    /**
     * 列车开行一趟需要的牵引成本
     */
    private Double tractionCost = 0d;
    /**
     * 列车开行一趟需要的接触网成本
     */
    private Double tractionceCost = 0d;
    /**
     * 开行一趟需要的车辆成本
     */
//    private Double vehicleCost = 0d;
    /**
     * 开行一趟列车日常修成本
     */
    private Double maintainNormalCost = 0d;
    /**
     * 开行一趟列车大修成本
     */
    private Double maintainAdvanceCost = 0d;
    /**
     * 开行一趟列车折旧成本
     */
    private Double deperciationCost = 0d;

    /**
     * 列车开行一趟需要的人力成本
     */
    private Double humanCost = 0d;
    /**
     * 列车开行一趟需要的备品成本
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
     * 区段总里程
     */
    private Double totalMileage;
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
     * 列车服务列表
     */
    private List<TrainService> trainServiceList;
    /**
     * 车次编组车辆列表
     */
    private List<TrainVehicle> trainVehicleList;

    public List<TrainVehicle> getTrainVehicleList() {
        return trainVehicleList;
    }

    public void setTrainVehicleList(List<TrainVehicle> trainVehicleList) {
        this.trainVehicleList = trainVehicleList;
    }

    public Double getLineCost() {
        return lineCost;
    }

    public Double getPartPrice() {
        return partPrice;
    }

    public void setPartPrice(Double partPrice) {
        this.partPrice = partPrice;
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

//    public Double getVehicleCost() {
//        return vehicleCost;
//    }
//
//    public void setVehicleCost(Double vehicleCost) {
//        this.vehicleCost = vehicleCost;
//    }

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

    public void setTotalCost(Double totalCost) {
        this.totalCost = totalCost;
    }

    public Double getTotalMileage() {
        return totalMileage;
    }

    public void setTotalMileage(Double totalMileage) {
        this.totalMileage = totalMileage;
    }

    public List<TrainLine> getTrainLineList() {
        return trainLineList;
    }

    public void setTrainLineList(List<TrainLine> trainLineList) {
        this.trainLineList = trainLineList;
    }

    public List<TrainTraction> getTrainTractionList() {
        return trainTractionList;
    }

    public void setTrainTractionList(List<TrainTraction> trainTractionList) {
        this.trainTractionList = trainTractionList;
    }

    public List<TrainCe> getTrainCeList() {
        return trainCeList;
    }

    public void setTrainCeList(List<TrainCe> trainCeList) {
        this.trainCeList = trainCeList;
    }

    public List<TrainHumanResource> getTrainHumanResourceList() {
        return trainHumanResourceList;
    }

    public void setTrainHumanResourceList(List<TrainHumanResource> trainHumanResourceList) {
        this.trainHumanResourceList = trainHumanResourceList;
    }

    public List<TrainService> getTrainServiceList() {
        return trainServiceList;
    }

    public void setTrainServiceList(List<TrainService> trainServiceList) {
        this.trainServiceList = trainServiceList;
    }

//    public Integer getFrequency() {
//        return frequency;
//    }
//
//    public void setFrequency(Integer frequency) {
//        this.frequency = frequency;
//    }

    public Double getMaintainNormalCost() {
        return maintainNormalCost;
    }

    public void setMaintainNormalCost(Double maintainNormalCost) {
        this.maintainNormalCost = maintainNormalCost;
    }

    public Double getMaintainAdvanceCost() {
        return maintainAdvanceCost;
    }

    public void setMaintainAdvanceCost(Double maintainAdvanceCost) {
        this.maintainAdvanceCost = maintainAdvanceCost;
    }

    public Double getDeperciationCost() {
        return deperciationCost;
    }

    public void setDeperciationCost(Double deperciationCost) {
        this.deperciationCost = deperciationCost;
    }

    @Override
    public String toString() {
        return "CostResource{" +
                "lineCost=" + lineCost +
                ", tractionCost=" + tractionCost +
                ", tractionceCost=" + tractionceCost +
//                ", vehicleCost=" + vehicleCost +
                ", humanCost=" + humanCost +
                ", partCost=" + partCost +
                ", serviceCost=" + serviceCost +
                '}';
    }

}
