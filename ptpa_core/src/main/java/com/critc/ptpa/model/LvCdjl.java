/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.model;

import java.util.Date;

/**
 * 
 * what: 机辆部车底交路 . <br/>
 *
 * @author 刘正荣 created on 2017年11月28日
 */
public class LvCdjl {

	// 主键
	private int id;

	// 车底交路名称
	private String name;

	// 车底交路车次，车次间用"-"分割
	private String cc;

	// 配属局代码，来源铁路局
	private String ljdm;

	// 配属局简称，来源铁路局
	private String shortName;

	// 速度等级，表示为："200-250"
	private String speedLevel;

	// 客运列车类型代码，来源系统字典"客运列车类型"
	private String trainTypeCode;

	// 客运列车类型名称，来源系统字典"客运列车类型"
	private String trainTypeName;

	// 交路运行区段
	private String line;

	// 交路总里程
	private int mileage;

	// 车底组数
	private int groupCount;

	// 交路总时间，表示为："小时：分钟"
	private String timeCost;

	// 创建人
	private String createdBy;

	// 创建时间
	private Date createdAt;

	// 上次修改人
	private String lastModifiedBy;

	// 上次修改时间
	private Date lastModifiedAt;

	public LvCdjl() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCc() {
		return cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
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

	public String getSpeedLevel() {
		return speedLevel;
	}

	public void setSpeedLevel(String speedLevel) {
		this.speedLevel = speedLevel;
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

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public int getGroupCount() {
		return groupCount;
	}

	public void setGroupCount(int groupCount) {
		this.groupCount = groupCount;
	}

	public String getTimeCost() {
		return timeCost;
	}

	public void setTimeCost(String timeCost) {
		this.timeCost = timeCost;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getLastModifiedBy() {
		return lastModifiedBy;
	}

	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public Date getLastModifiedAt() {
		return lastModifiedAt;
	}

	public void setLastModifiedAt(Date lastModifiedAt) {
		this.lastModifiedAt = lastModifiedAt;
	}

	@Override
	public String toString() {
		return "LvCdjl [id=" + id + ", name=" + name + ", cc=" + cc + ", ljdm=" + ljdm + ", shortName=" + shortName
				+ ", speedLevel=" + speedLevel + ", trainTypeCode=" + trainTypeCode + ", trainTypeName=" + trainTypeName
				+ ", line=" + line + ", mileage=" + mileage + ", groupCount=" + groupCount + ", timeCost=" + timeCost
				+ ", createdBy=" + createdBy + ", createdAt=" + createdAt + ", lastModifiedBy=" + lastModifiedBy
				+ ", lastModifiedAt=" + lastModifiedAt + "]";
	}

}