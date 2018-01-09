/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Web
 */
package com.critc.ptpa.model;

/**
 * what: 车次牵引区段model
 *
 * @author 杨超凡 created on 2017/12/3
 */
public class TrainTraction {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 所属车次
     */
    private Integer  trainId;
    /**
     * 铁路局
     */
    private String ljdm;
    /**
     * 线路代码
     */
    private String xldm;
    /**
     * 线路名称
     */
    private String xldmName;
    /**
     * 区段起点站
     */
    private String beginCzdm;
    /**
     * 区段起始站名称
     */
    private String beginCzdmName;
    /**
     * 区段讫点站
     */
    private String endCzdm;
    /**
     * 区段讫点站名称
     */
    private String endCzdmName;
    /**
     * 牵引类型代码
     */
    private String tractionTypeCode;
    /**
     * 牵引类型名称
     */
    private String tractionTypeName;
    /**
     * 里程
     */
    private Integer mileage;
    /**
     * 机车清算单价
     */
    private Double locomotivePrice;
    /**
     * 电力机车使用接触网和电费清算单价
     */
    private Double cePrice;
    /**
     * 排序
     */
    private Integer orderIndex;
    private Integer rownum;

    public Integer getRownum() {

        return rownum;
    }

    public void setRownum(Integer rownum) {
        this.rownum = rownum;
    }

    public String getLjdm() {
        return ljdm;
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
    }

    public Integer getTrainId() {
        return trainId;
    }

    public void setTrainId(Integer trainId) {
        this.trainId = trainId;
    }

    public String getXldm() {
        return xldm;
    }

    public void setXldm(String xldm) {
        this.xldm = xldm;
    }

    public String getXldmName() {
        return xldmName;
    }

    public void setXldmName(String xldmName) {
        this.xldmName = xldmName;
    }

    public String getBeginCzdm() {
        return beginCzdm;
    }

    public void setBeginCzdm(String beginCzdm) {
        this.beginCzdm = beginCzdm;
    }

    public String getBeginCzdmName() {
        return beginCzdmName;
    }

    public void setBeginCzdmName(String beginCzdmName) {
        this.beginCzdmName = beginCzdmName;
    }

    public String getEndCzdm() {
        return endCzdm;
    }

    public void setEndCzdm(String endCzdm) {
        this.endCzdm = endCzdm;
    }

    public String getEndCzdmName() {
        return endCzdmName;
    }

    public void setEndCzdmName(String endCzdmName) {
        this.endCzdmName = endCzdmName;
    }

    public String getTractionTypeCode() {
        return tractionTypeCode;
    }

    public void setTractionTypeCode(String tractionTypeCode) {
        this.tractionTypeCode = tractionTypeCode;
    }

    public String getTractionTypeName() {
        return tractionTypeName;
    }

    public void setTractionTypeName(String tractionTypeName) {
        this.tractionTypeName = tractionTypeName;
    }

    public Integer getMileage() {
        return mileage;
    }

    public void setMileage(Integer mileage) {
        this.mileage = mileage;
    }

    public Double getLocomotivePrice() {
        return locomotivePrice;
    }

    public void setLocomotivePrice(Double locomotivePrice) {
        this.locomotivePrice = locomotivePrice;
    }

    public Double getCePrice() {
        return cePrice;
    }

    public void setCePrice(Double cePrice) {
        this.cePrice = cePrice;
    }

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
    public Double cost(){
        //内燃
        if(getTractionTypeCode().equals("1")){
            return getLocomotivePrice()*getMileage();
        //电力
        }else if(getTractionTypeCode().equals("2")){
            return (getLocomotivePrice()+getCePrice())*getMileage();
        }else{
            System.out.println("牵引费用计算逻辑有误！");
            return 0d;
        }
    }
}
