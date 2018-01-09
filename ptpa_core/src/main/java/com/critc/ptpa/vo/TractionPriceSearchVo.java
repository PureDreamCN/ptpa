/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;

/**
 * what:    牵引单价查询条件
 *
 * @author 马丽静 created on 2017/11/28
 */
public class TractionPriceSearchVo extends PageSearchVO {
    private String tractionTypeCode;//牵引类型代码
    private String tractionTypeName;//牵引类型名称
    private String ljdm;//铁路局代码

    @Override
    public String toString() {
        return "TractionPriceSearchVo{" +
                "tractionTypeCode='" + tractionTypeCode + '\'' +
                ", tractionTypeName='" + tractionTypeName + '\'' +
                ", ljdm='" + ljdm + '\'' +
                '}';
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
}
