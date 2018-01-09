/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;

/**
 * what:   客车统计条件类
 * @author 郭飞 created on 2017/12/1
 */
public class TrainPsVO  extends PageSearchVO {

    //主键
    private String id;



    //上报车次
    private String cc;
    // //担当局名称
    private String ddjmc;

    @Override
    public String toString() {
        return "TrainPsVO{" +
                "id='" + id + '\'' +
                ", cc='" + cc + '\'' +
                ", ddjmc='" + ddjmc + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getDdjmc() {
        return ddjmc;
    }

    public void setDdjmc(String ddjmc) {
        this.ddjmc = ddjmc;
    }
}
