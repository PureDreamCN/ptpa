/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;

/**
 * what: 服务成本 SearchVO. <br/>
 * 
 * @author 刘正荣 created on 2017年11月24日
 */
public class PriceServiceSearchVO extends PageSearchVO {

	// 服务代码，来源系统字典"服务"
	private String serviceCode;

	// 铁路局代码，来源"铁路局"
	private String ljdm;

	public PriceServiceSearchVO() {
	}

	public String getServiceCode() {
		return serviceCode;
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}

	public String getLjdm() {
		return ljdm;
	}

	public void setLjdm(String ljdm) {
		this.ljdm = ljdm;
	}

	@Override
	public String toString() {
		return "PriceServiceSearchVO [serviceCode=" + serviceCode + ", ljdm=" + ljdm + "]";
	}

}
