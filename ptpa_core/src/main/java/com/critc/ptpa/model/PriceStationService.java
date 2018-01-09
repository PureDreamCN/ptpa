/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_core
 */
package com.critc.ptpa.model;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * what: 车站旅客服务清算单价实体类
 * 
 *
 * @author 李红 created on 2017年12月8日
 */
public class PriceStationService {
	/**
	 * 主键
	 */
	private int id;
	/**
	 * 车站旅客服务类别代码
	 */
	@NotEmpty
	@Size(max = 20)
	private String stationServiceTypeCode;
	/**
	 * 车站旅客服务类别名称
	 */
	@NotEmpty
	@Size(max = 25)
	private String stationServiceTypeName;
	/**
	 * 清算单价
	 */
	@NotNull
	@Digits(integer = 2, fraction = 0)
	private int price;

	/**
	 * id.
	 *
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * id.
	 *
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * stationServiceTypeCode.
	 *
	 * @return the stationServiceTypeCode
	 */
	public String getStationServiceTypeCode() {
		return stationServiceTypeCode;
	}

	/**
	 * stationServiceTypeCode.
	 *
	 * @param stationServiceTypeCode the stationServiceTypeCode to set
	 */
	public void setStationServiceTypeCode(String stationServiceTypeCode) {
		this.stationServiceTypeCode = stationServiceTypeCode;
	}

	/**
	 * stationServiceTypeName.
	 *
	 * @return the stationServiceTypeName
	 */
	public String getStationServiceTypeName() {
		return stationServiceTypeName;
	}

	/**
	 * stationServiceTypeName.
	 *
	 * @param stationServiceTypeName the stationServiceTypeName to set
	 */
	public void setStationServiceTypeName(String stationServiceTypeName) {
		this.stationServiceTypeName = stationServiceTypeName;
	}

	/**
	 * price.
	 *
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}

	/**
	 * price.
	 *
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}

	/**
	 * why: toString()
	 * 
	 * @see java.lang.Object#toString()
	 *
	 * @return
	 *
	 * @author 李红 created on 2017年12月8日
	 */
	@Override
	public String toString() {
		return "PriceStationService [id=" + id + ", stationServiceTypeCode=" + stationServiceTypeCode
				+ ", stationServiceTypeName=" + stationServiceTypeName + ", price=" + price + "]";
	}

}
