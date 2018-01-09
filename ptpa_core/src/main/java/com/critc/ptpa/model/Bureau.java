/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.model;

/**
 * what:    路局类
 *
 * @author 郭飞 created on 2017/11/24
 */
public class Bureau {
  //路局代码
  private String  ljdm;
  //全称
  private String  name;
  //简称
  private String shortName;
  //编码
  private int code;

    @Override
    public String toString() {
        return "Bureau{" +
                "ljdm='" + ljdm + '\'' +
                ", name='" + name + '\'' +
                ", shortName='" + shortName + '\'' +
                ", code=" + code +
                '}';
    }

    public String getLjdm() {
        return ljdm;
    }

    public void setLjdm(String ljdm) {
        this.ljdm = ljdm;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
