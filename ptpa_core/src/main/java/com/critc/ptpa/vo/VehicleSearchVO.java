/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_core
 */
package com.critc.ptpa.vo;

import com.critc.util.page.PageSearchVO;

/**
 * what: 车辆类型VO
 * 
 *
 * @author 李红 created on 2017年12月5日
 */
public class VehicleSearchVO extends PageSearchVO{
	/**
	 * 车型编码
	 */
	private String cxCode;
	/**
	 * 车种编码
	 */
	private String czCode;

	/**
	 * cxCode.
	 *
	 * @return the cxCode
	 */
	public String getCxCode() {
		return cxCode;
	}

	/**
	 * cxCode.
	 *
	 * @param cxCode the cxCode to set
	 */
	public void setCxCode(String cxCode) {
		this.cxCode = cxCode;
	}

	/**
	 * czCode.
	 *
	 * @return the czCode
	 */
	public String getCzCode() {
		return czCode;
	}

	/**
	 * czCode.
	 *
	 * @param czCode the czCode to set
	 */
	public void setCzCode(String czCode) {
		this.czCode = czCode;
	}

	/**
	 * why: toString()
	 * 
	 * @see java.lang.Object#toString()
	 *
	 * @return
	 *
	 * @author 李红 created on 2017年12月5日
	 */
	@Override
	public String toString() {
		return "VehicleSearchVO [cxCode=" + cxCode + ", czCode=" + czCode + "]";
	}

}
