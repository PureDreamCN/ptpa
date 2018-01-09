/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.model;

/**
 * what:    线路实体类
 *
 * @author 郭飞 created on 2017/11/24
 */
public class Railway {

    //线路代码
    private String xldm;
    //线路名称
    private String name;
    //起始车站代码
    private String beginCzdm;
    //讫点车站代码
    private String endCzdm;
    //线路里程
    private int  mileage;
    //产权
    private String propertyRight ;
    @Override
    public String toString() {
        return "railway{" +
                "xldm='" + xldm + '\'' +
                ", name='" + name + '\'' +
                ", beginCzdm='" + beginCzdm + '\'' +
                ", endCzdm='" + endCzdm + '\'' +
                ", mileage=" + mileage +
                ", propertyRight='" + propertyRight + '\'' +
                '}';
    }

    public String getXldm() {
        return xldm;
    }

    public void setXldm(String xldm) {
        this.xldm = xldm;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBeginCzdm() {
        return beginCzdm;
    }

    public void setBeginCzdm(String beginCzdm) {
        this.beginCzdm = beginCzdm;
    }

    public String getEndCzdm() {
        return endCzdm;
    }

    public void setEndCzdm(String endCzdm) {
        this.endCzdm = endCzdm;
    }

    public int getMileage() {
        return mileage;
    }

    public void setMileage(int mileage) {
        this.mileage = mileage;
    }

    public String getPropertyRight() {
        return propertyRight;
    }

    public void setPropertyRight(String propertyRight) {
        this.propertyRight = propertyRight;
    }


}
