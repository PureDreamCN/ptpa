/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:core
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;

/**
 * what:  客车详情VO
 *
 * @author 杨超凡 created on 2017/11/24
 */
public class TrainSearchVO extends PageSearchVO{
    /**
     * 主键
     */
    private Integer id;
    /**
     * 车次
     */
    private String cc;



    public String getSearchCc() {
        return cc.toUpperCase()+"%";
    }
    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
