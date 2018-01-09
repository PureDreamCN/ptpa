/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.model;

/**
 * what: 备品清算. <br/>
 * 
 * @author 刘正荣 created on 2017年11月24日
 */
public class PricePart {

	// 主键
	private int id;

	// 铁路局代码，来源"铁路局"
	private String ljdm;

	// 铁路局简称
	private String shortName;

	// 客运列车类型编码
	private String trainTypeCode;

	// 客运列车类型名称
	private String trainTypeName;

	// 平均年使用费用，单位：元/年辆，精确到小数点后2位
	private Double price;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLjdm() {
		return ljdm;
	}

	public void setLjdm(String ljdm) {
		this.ljdm = ljdm;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getTrainTypeCode() {
		return trainTypeCode;
	}

	public void setTrainTypeCode(String trainTypeCode) {
		this.trainTypeCode = trainTypeCode;
	}

	public String getTrainTypeName() {
		return trainTypeName;
	}

	public void setTrainTypeName(String trainTypeName) {
		this.trainTypeName = trainTypeName;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "PricePart [id=" + id + ", ljdm=" + ljdm + ", shortName=" + shortName + ", trainTypeCode="
				+ trainTypeCode + ", trainTypeName=" + trainTypeName + ", price=" + price + "]";
	}

}
