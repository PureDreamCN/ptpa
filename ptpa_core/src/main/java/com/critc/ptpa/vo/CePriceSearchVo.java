/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;

/**
 * what:   接触网清算单价实体类
 */
public class CePriceSearchVo extends PageSearchVO {

    private String pseCode;//客专企业代码
    private String pseName;//客专企业名称
    private String ljdm;//铁路局代码

    @Override
    public String toString() {
        return "CePriceSearchVo{" +
                "pseCode='" + pseCode + '\'' +
                ", pseName='" + pseName + '\'' +
                ", ljdm='" + ljdm + '\'' +
                '}';
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
}
