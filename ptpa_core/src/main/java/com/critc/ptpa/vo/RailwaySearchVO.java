/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;

/**
 * what:    线路查询条件类
 *
 * @author 郭飞 created on 2017/11/24
 */
public class RailwaySearchVO  extends PageSearchVO {
    //线路代码
    private String xldm;
    //线路名称
    private String name;
    //起始车站代码
    private String beginCzdm;
    //讫点车站代码
    private String endCzdm;

    @Override
    public String toString() {
        return "RailwaySearchVO{" +
                "xldm='" + xldm + '\'' +
                ", name='" + name + '\'' +
                ", beginCzdm='" + beginCzdm + '\'' +
                ", endCzdm='" + endCzdm + '\'' +
                '}';
    }

    public String getXldm() {
        return "%"+xldm+"%";
    }

    public void setXldm(String xldm) {
        this.xldm = xldm;
    }

    public String getName() {
        return "%"+name+"%";
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBeginCzdm() {
        return "%"+beginCzdm+"%";
    }

    public void setBeginCzdm(String beginCzdm) {
        this.beginCzdm = beginCzdm;
    }

    public String getEndCzdm() {
        return "%"+endCzdm+"%";
    }

    public void setEndCzdm(String endCzdm) {
        this.endCzdm = endCzdm;
    }
}
