/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.model;

/**
 * 
 * what: 机辆部车底交路车次. <br/>
 * 
 *
 * @author 刘正荣 created on 2017年11月28日
 */
public class LvCdjlcc {

	// 主键
	private int id;

	// 机辆部车底交路ID，来源"机辆部车底交路"
	private Integer cdjlId;

	// 车次
	private String cc;

	// 起始站
	private String startEnd;

	// 车次里程
	private int mileage;

	public LvCdjlcc() {
	}

	/**
	 * 获取主键
	 * 
	 * @return 主键
	 */
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getCdjlId() {
		return this.cdjlId;
	}

	public void setCdjlId(Integer cdjlId) {
		this.cdjlId = cdjlId;
	}

	public String getCc() {
		return this.cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

	public int getMileage() {
		return this.mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public String getStartEnd() {
		return startEnd;
	}

	public void setStartEnd(String startEnd) {
		this.startEnd = startEnd;
	}

	@Override
	public String toString() {
		return "LvCdjlcc [id=" + id + ", cdjlId=" + cdjlId + ", cc=" + cc + ", startEnd=" + startEnd + ", mileage="
				+ mileage + "]";
	}

}