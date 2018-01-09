/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;

/**
 * what:   车站查询类
 *
 * @author 郭飞 created on 2017/11/24
 */
public class StationSearchVO  extends PageSearchVO {
    //车站代码
    private String czdm;
    //车站名称
    private String name;
    //路局代码
    private String ljdm;
    //拼音

    @Override
    public String toString() {
        return "StationSearchVo{" +
                "czdm='" + czdm + '\'' +
                ", name='" + name + '\'' +
                ", ljdm='" + ljdm + '\'' +
                ", pinyin='" + pinyin + '\'' +
                '}';
    }

    public String getCzdm() {
        return "%"+czdm+"%";
    }

    public void setCzdm(String czdm) {
        this.czdm = czdm;
    }

    public String getName() {
        return "%"+name+"%";
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLjdm() {
        return "%"+ljdm+"%";
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
    }

    public String getPinyin() {
        return "%"+pinyin+"%";
    }

    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }

    private String pinyin;
}
