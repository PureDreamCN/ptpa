/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Web
 */
package com.critc.ptpa.model;

/**
 * what:  车次备品配置
 *
 * @author 杨超凡 created on 2017/12/4
 */
public class TrainPart {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 所属车次
     */
    private String trainId;
    /**
     * 铁路局
     */
    private String ljdm;
    /**
     * 辆型编码
     */
    private String lxCode;
    /**
     * 辆型编码名称
     */
    private String lxName;
    /**
     * 车种编码
     */
    private String czCode;
    /**
     * 车种名称
     */
    private String czName;
    /**
     * 平均年使用费用
     */
    private Double price;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTrainId() {
        return trainId;
    }

    public void setTrainId(String trainId) {
        this.trainId = trainId;
    }

    public String getLjdm() {
        return ljdm;
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
    }

    public String getLxCode() {
        return lxCode;
    }

    public void setLxCode(String lxCode) {
        this.lxCode = lxCode;
    }

    public String getLxName() {
        return lxName;
    }

    public void setLxName(String lxName) {
        this.lxName = lxName;
    }

    public String getCzCode() {
        return czCode;
    }

    public void setCzCode(String czCode) {
        this.czCode = czCode;
    }

    public String getCzName() {
        return czName;
    }

    public void setCzName(String czName) {
        this.czName = czName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double cost(){
        return getPrice();
    }
}
