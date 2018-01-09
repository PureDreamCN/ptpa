/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.model;

/**
 * what:    牵引单价实体类
 *
 * @author 马丽静 created on 2017/11/28
 */
public class TractionPrice {
    private int id;//主键
    private String tractionTypeCode;//牵引类型代码
    private String tractionTypeName;//牵引类型名称
    private String ljdm;//铁路局代码
    private String ljName;//铁路局名称
    private Double cePrice;//电力机车网电清算单价
    private Double locomotivePrice;//机车清算单价

    @Override
    public String toString() {
        return "TractionPrice{" +
                "id=" + id +
                ", tractionTypeCode='" + tractionTypeCode + '\'' +
                ", tractionTypeName='" + tractionTypeName + '\'' +
                ", ljdm='" + ljdm + '\'' +
                ", ljName='" + ljName + '\'' +
                ", cePrice=" + cePrice +
                ", locomotivePrice=" + locomotivePrice +
                '}';
    }

    public String getLjName() {
        return ljName;
    }

    public void setLjName(String ljName) {
        this.ljName = ljName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getLjdm() {
        return ljdm;
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
    }

    public Double getCePrice() {
        return cePrice;
    }

    public void setCePrice(Double cePrice) {
        this.cePrice = cePrice;
    }

    public Double getLocomotivePrice() {
        return locomotivePrice;
    }

    public void setLocomotivePrice(Double locomotivePrice) {
        this.locomotivePrice = locomotivePrice;
    }
}
