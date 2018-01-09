/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * what:   旅客统计查询类
 * @author 郭飞 created on 2017/11/30
 */
public class TrainStatisticVO  extends PageSearchVO {
    //车次
    private String cc;
    //日期
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date statisticDate;
    //路局代码
    private String ljdm;
    //主键
    private String id ;

    @Override
    public String toString() {
        return "TrainStatisticVO{" +
                "cc='" + cc + '\'' +
                ", statisticDate=" + statisticDate +
                ", ljdm='" + ljdm + '\'' +
                ", id='" + id + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLjdm() {
        return ljdm;
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
    }


    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public Date getStatisticDate() {
        return statisticDate;
    }

    public void setStatisticDate(Date statisticDate) {
        this.statisticDate = statisticDate;
    }
}
