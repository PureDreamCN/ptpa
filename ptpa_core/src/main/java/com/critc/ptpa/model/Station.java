/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.model;

/**
 * what:   车站类
 *
 * @author 郭飞 created on 2017/11/24
 */
public class Station {
  //车站代码
  private String czdm;
  //车站名称
  private String name;
  //路局名称
  private String bureauName;
  //拼音
  private String pinyin;
  //路局代码
  private String ljdm;

    public String getLjdm() {
        return ljdm;
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
    }

    @Override
    public String toString() {
        return "Station{" +
                "czdm='" + czdm + '\'' +
                ", name='" + name + '\'' +
                ", bureauName='" + bureauName + '\'' +
                ", pinyin='" + pinyin + '\'' +
                ", ljdm='" + ljdm + '\'' +
                '}';
    }

    public String getCzdm() {
        return czdm;
    }

    public void setCzdm(String czdm) {
        this.czdm = czdm;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBureauName() {
        return bureauName;
    }

    public void setBureauName(String bureauName) {
        this.bureauName = bureauName;
    }

    public String getPinyin() {
        return pinyin;
    }

    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }
}
