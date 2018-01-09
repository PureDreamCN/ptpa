/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;

/**
 * what: 机辆部车底交路 SearchVO. <br/>
 * 
 * @author 刘正荣 created on 2017年11月28日
 */
public class LvCdjlSearchVO extends PageSearchVO {

	// 车底交路车次
	private String cc;

	// 客运列车类型
	private String trainTypeCode;

	public LvCdjlSearchVO() {
	}

	public String getCc() {
		return cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

	public String getCcStr() {
		return "%" + cc + "%";
	}

	public String getTrainTypeCode() {
		return trainTypeCode;
	}

	public void setTrainTypeCode(String trainTypeCode) {
		this.trainTypeCode = trainTypeCode;
	}

	@Override
	public String toString() {
		return "LvCdjlSearchVO [cc=" + cc + ", trainTypeCode=" + trainTypeCode + "]";
	}

}
