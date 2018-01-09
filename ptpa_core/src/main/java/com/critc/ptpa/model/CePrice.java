/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.model;

/**
 * what:   接触网清算单价实体类
 */
public class CePrice {
    private int id;//主键
    private String pseCode;//客专企业代码
    private String pseName;//客专企业名称
    private String ljdm;//铁路局代码
    private String ljName;//铁路局代码
    private Double catenaryPrice;//接触网单价
    private Double electricityPrice;//电费清算单价

    @Override
    public String toString() {
        return "CePrice{" +
                "id=" + id +
                ", pseCode='" + pseCode + '\'' +
                ", pseName='" + pseName + '\'' +
                ", ljdm='" + ljdm + '\'' +
                ", ljName='" + ljName + '\'' +
                ", catenaryPrice=" + catenaryPrice +
                ", electricityPrice=" + electricityPrice +
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

    public String getPseCode() {
        return pseCode;
    }

    public void setPseCode(String pseCode) {
        this.pseCode = pseCode;
    }

    public String getPseName() {
        return pseName;
    }

    public void setPseName(String pseName) {
        this.pseName = pseName;
    }

    public String getLjdm() {
        return ljdm;
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
    }

    public Double getCatenaryPrice() {
        return catenaryPrice;
    }

    public void setCatenaryPrice(Double catenaryPrice) {
        this.catenaryPrice = catenaryPrice;
    }

    public Double getElectricityPrice() {
        return electricityPrice;
    }

    public void setElectricityPrice(Double electricityPrice) {
        this.electricityPrice = electricityPrice;
    }
}
