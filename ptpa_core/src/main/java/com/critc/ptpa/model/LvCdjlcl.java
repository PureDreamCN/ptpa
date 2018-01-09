/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.model;

/**
 * 
 * what: 机辆部车底交路编组车辆. <br/>
 * 
 * @author 刘正荣 created on 2017年11月28日
 */
public class LvCdjlcl {

	// 主键
	private int id;

	// 机辆部车底交路ID，来源"机辆部车底交路"
	private int cdjlId;

	// 车型编码：来源于系统字典"车型"
	private String cxCode;

	// 车型名称：来源于系统字典"车型"
	private String cxName;

	// 车种编码：来源于系统字典"车种"
	private String czCode;

	// 车种名称：来源于系统字典"车种"
	private String czName;

	// 定员
	private int capacity;

	// 排序
	private int orderIndex;

	public LvCdjlcl() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCdjlId() {
		return this.cdjlId;
	}

	public void setCdjlId(int cdjlId) {
		this.cdjlId = cdjlId;
	}

	public String getCxCode() {
		return this.cxCode;
	}

	public void setCxCode(String cxCode) {
		this.cxCode = cxCode;
	}

	public String getCxName() {
		return this.cxName;
	}

	public void setCxName(String cxName) {
		this.cxName = cxName;
	}

	public String getCzCode() {
		return this.czCode;
	}

	public void setCzCode(String czCode) {
		this.czCode = czCode;
	}

	public String getCzName() {
		return this.czName;
	}

	public void setCzName(String czName) {
		this.czName = czName;
	}

	public int getCapacity() {
		return this.capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getOrderIndex() {
		return this.orderIndex;
	}

	public void setOrderIndex(int orderIndex) {
		this.orderIndex = orderIndex;
	}

	@Override
	public String toString() {
		return "LvCdjlcl [id=" + id + ", cdjlId=" + cdjlId + ", cxCode=" + cxCode + ", cxName=" + cxName + ", czCode="
				+ czCode + ", czName=" + czName + ", capacity=" + capacity + ", orderIndex=" + orderIndex + "]";
	}

}