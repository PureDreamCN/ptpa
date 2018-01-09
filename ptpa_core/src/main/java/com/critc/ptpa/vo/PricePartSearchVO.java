/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;

/**
 * what: 备品成本 SearchVO. <br/>
 * 
 * @author 刘正荣 created on 2017年11月24日
 */
public class PricePartSearchVO extends PageSearchVO {

	// 铁路局代码，来源"铁路局"
	private String ljdm;

	// 客运列车类型编码
	private String trainTypeCode;

	public PricePartSearchVO() {
	}

	public String getLjdm() {
		return ljdm;
	}

	public void setLjdm(String ljdm) {
		this.ljdm = ljdm;
	}

	public String getTrainTypeCode() {
		return trainTypeCode;
	}

	public void setTrainTypeCode(String trainTypeCode) {
		this.trainTypeCode = trainTypeCode;
	}

	@Override
	public String toString() {
		return "PricePartSearchVO [ljdm=" + ljdm + ", trainTypeCode=" + trainTypeCode + "]";
	}

}
