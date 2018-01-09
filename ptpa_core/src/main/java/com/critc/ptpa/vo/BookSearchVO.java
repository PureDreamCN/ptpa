/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;

/**
 * what:    客户账本条件类
 *
 * @author 郭飞 created on 2017/12/8
 */
public class BookSearchVO  extends PageSearchVO {

    //车次详情ID
    private Integer trainId;
    //查询开始时间日期
    private String startDate;
    //查询结束时间日期
    private String endDate;
    //车次名称
    private String cc;


    @Override
    public String toString() {
        return "BookSearchVO{" +
                "trainId=" + trainId +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", cc='" + cc + '\'' +
                '}';
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public Integer getTrainId() {
        return trainId;
    }

    public void setTrainId(Integer trainId) {
        this.trainId = trainId;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
