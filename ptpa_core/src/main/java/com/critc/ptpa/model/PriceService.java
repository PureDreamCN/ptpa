/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.model;

/**
 * what: 服务费用清算单价. 服务费用清算单价包含的服务：<br/>
 * 进藏服务, 轮渡服务,软票费,卧定费,空调费,售票代理费 <br/>
 * 车站旅客服务费,上水服务费 <br/>
 *
 * @author 刘正荣 created on 2017年11月24日
 */
public class PriceService {

	// 主键
	private int id;

	// 服务代码，来源系统字典"服务"
	private String serviceCode;

	// 服务名称，来源系统字典"服务"
	private String serviceName;

	// 铁路局代码，来源"铁路局"
	private String ljdm;

	// 铁路局简称
	private String shortName;

	// 服务计量单位
	private String unit;

	// 清算单价，单位：元/计量单位，精确到小数点后2位
	private double price;

	public PriceService() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getServiceCode() {
		return this.serviceCode;
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}

	public String getServiceName() {
		return this.serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getLjdm() {
		return this.ljdm;
	}

	public void setLjdm(String ljdm) {
		this.ljdm = ljdm;
	}

	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public double getPrice() {
		return this.price;
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

	@Override
	public String toString() {
		return "PriceService [id=" + id + ", serviceCode=" + serviceCode + ", serviceName=" + serviceName + ", ljdm="
				+ ljdm + ", shortName=" + shortName + ", unit=" + unit + ", price=" + price + "]";
	}

}
