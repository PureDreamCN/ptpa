/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;

/**
 * what: 人力清算SearchVO. <br/>
 * 
 * @author 刘正荣 created on 2017年11月24日
 */
public class PriceHumanResourceSearchVO extends PageSearchVO {

	// 人力类型代码
	private String humanResourceTypeCode;

	// 铁路局代码
	private String ljdm;

	public String getHumanResourceTypeCode() {
		return humanResourceTypeCode;
	}

	public void setHumanResourceTypeCode(String humanResourceTypeCode) {
		this.humanResourceTypeCode = humanResourceTypeCode;
	}

	public String getLjdm() {
		return ljdm;
	}

	public void setLjdm(String ljdm) {
		this.ljdm = ljdm;
	}

	@Override
	public String toString() {
		return "PriceHumanResourceSearchVO [humanResourceTypeCode=" + humanResourceTypeCode + ", ljdm=" + ljdm + "]";
	}

}
