/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.model;

/**
 * what: 人力清算单价表 . <br/>
 *
 * 
 * @author 刘正荣 created on 2017年11月24日
 */
public class PriceHumanResource {

	// 主键
	private int id;

	// 人力类型代码，来源系统字典"人力资源类型"
	private String humanResourceTypeCode;

	// 人力类型名称，来源系统字典"人力资源类型"
	private String humanResourceTypeName;

	// 铁路局代码，来源"铁路局"
	private String ljdm;

	// 铁路局简称
	private String shortName;

	// 平均人力支出，单位：元/人年，精确到小数点后2位
	private double price;

	private Double rate;

	public PriceHumanResource() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHumanResourceTypeCode() {
		return humanResourceTypeCode;
	}

	public void setHumanResourceTypeCode(String humanResourceTypeCode) {
		this.humanResourceTypeCode = humanResourceTypeCode;
	}

	public String getHumanResourceTypeName() {
		return humanResourceTypeName;
	}

	public void setHumanResourceTypeName(String humanResourceTypeName) {
		this.humanResourceTypeName = humanResourceTypeName;
	}

	public String getLjdm() {
		return ljdm;
	}

	public void setLjdm(String ljdm) {
		this.ljdm = ljdm;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	@Override
	public String toString() {
		return "PriceHumanResource [id=" + id + ", humanResourceTypeCode=" + humanResourceTypeCode
				+ ", humanResourceTypeName=" + humanResourceTypeName + ", ljdm=" + ljdm + ", shortName=" + shortName
				+ ", price=" + price + ", rate=" + rate + "]";
	}

}
