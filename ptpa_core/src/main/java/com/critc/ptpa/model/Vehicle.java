/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_core
 */
package com.critc.ptpa.model;

import java.util.List;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * what: 车辆类型实体类
 * 
 *
 * @author 李红 created on 2017年11月24日
 */
public class Vehicle {
	/**
	 * 主键
	 */
	private int id;
	/**
	 * 车型编码
	 */
	@NotEmpty
	@Size(max = 20)
	private String cxCode;
	/**
	 * 车型名称
	 */
	@NotEmpty
	@Size(max = 20)
	private String cxName;
	/**
	 * 车种编码
	 */
	@NotEmpty
	@Size(max = 20)
	private String czCode;
	/**
	 * 车种名称
	 */
	@NotEmpty
	@Size(max = 20)
	private String czName;
	/**
	 * 辆型编码
	 */
	@NotEmpty
	@Size(max = 20)
	private String lxCode;
	/**
	 * 辆型名称
	 */
	@NotEmpty
	@Size(max = 10)
	private String lxName;
	/**
	 * 购置成本
	 */
	@NotNull
	@Digits(integer = 13, fraction = 2)
	private double purchasePrice;
	/**
	 * 平均年走行公里
	 */
	@Digits(integer = 7, fraction = 0)
	private Integer averageKilometer;
	/**
	 * 折旧年限
	 */
	@Digits(integer = 2, fraction = 0)
	private Integer depreciationPeriod;
	/**
	 * 折旧残值率
	 */
	@Digits(integer = 5, fraction = 2)
	private Double deperciationResidualRate;
	/**
	 * 年折旧率
	 */
	@Digits(integer = 5, fraction = 2)
	private Double deperciationRate;
	/**
	 * 每公里折旧率
	 */
	@Digits(integer = 13, fraction = 10)
	private Double deperciationPkRate;
	/**
	 * 折旧清算单价
	 */
	@Digits(integer = 13, fraction = 2)
	private Double deperciationPrice = 0.00;
	/**
	 * 大修清算单价
	 */
	@Digits(integer = 13, fraction = 2)
	private Double maintainAdvancePrice;
	/**
	 * 日常修清算单价
	 */
	@Digits(integer = 13, fraction = 2)
	private Double maintainNormalPrice;
	/**
	 * 定员详情
	 */
	private String seatTypeCapacity;
	/**
	 * 席别配置
	 */
	private List<VehicleSeat> listVehicleSeat;
	/**
	 * 定员总数
	 */
	private Integer capacity;
	/**
	 * 维修类别
	 */
	// private List<VehicleMaintain> listVehicleMaintain;

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
	 * cxName.
	 *
	 * @return the cxName
	 */
	public String getCxName() {
		return cxName;
	}

	/**
	 * cxName.
	 *
	 * @param cxName the cxName to set
	 */
	public void setCxName(String cxName) {
		this.cxName = cxName;
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
	 * czName.
	 *
	 * @return the czName
	 */
	public String getCzName() {
		return czName;
	}

	/**
	 * czName.
	 *
	 * @param czName the czName to set
	 */
	public void setCzName(String czName) {
		this.czName = czName;
	}

	/**
	 * lxCode.
	 *
	 * @return the lxCode
	 */
	public String getLxCode() {
		return lxCode;
	}

	/**
	 * lxCode.
	 *
	 * @param lxCode the lxCode to set
	 */
	public void setLxCode(String lxCode) {
		this.lxCode = lxCode;
	}

	/**
	 * lxName.
	 *
	 * @return the lxName
	 */
	public String getLxName() {
		return lxName;
	}

	/**
	 * lxName.
	 *
	 * @param lxName the lxName to set
	 */
	public void setLxName(String lxName) {
		this.lxName = lxName;
	}

	/**
	 * purchasePrice.
	 *
	 * @return the purchasePrice
	 */
	public double getPurchasePrice() {
		return purchasePrice;
	}

	/**
	 * purchasePrice.
	 *
	 * @param purchasePrice the purchasePrice to set
	 */
	public void setPurchasePrice(double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	/**
	 * averageKilometer.
	 *
	 * @return the averageKilometer
	 */
	public Integer getAverageKilometer() {
		return averageKilometer;
	}

	/**
	 * averageKilometer.
	 *
	 * @param averageKilometer the averageKilometer to set
	 */
	public void setAverageKilometer(Integer averageKilometer) {
		this.averageKilometer = averageKilometer;
	}

	/**
	 * depreciationPeriod.
	 *
	 * @return the depreciationPeriod
	 */
	public Integer getDepreciationPeriod() {
		return depreciationPeriod;
	}

	/**
	 * depreciationPeriod.
	 *
	 * @param depreciationPeriod the depreciationPeriod to set
	 */
	public void setDepreciationPeriod(Integer depreciationPeriod) {
		this.depreciationPeriod = depreciationPeriod;
	}

	/**
	 * deperciationResidualRate.
	 *
	 * @return the deperciationResidualRate
	 */
	public Double getDeperciationResidualRate() {
		return deperciationResidualRate;
	}

	/**
	 * deperciationResidualRate.
	 *
	 * @param deperciationResidualRate the deperciationResidualRate to set
	 */
	public void setDeperciationResidualRate(Double deperciationResidualRate) {
		this.deperciationResidualRate = deperciationResidualRate;
	}

	/**
	 * deperciationRate.
	 *
	 * @return the deperciationRate
	 */
	public Double getDeperciationRate() {
		return deperciationRate;
	}

	/**
	 * deperciationRate.
	 *
	 * @param deperciationRate the deperciationRate to set
	 */
	public void setDeperciationRate(Double deperciationRate) {
		this.deperciationRate = deperciationRate;
	}

	/**
	 * deperciationPkRate.
	 *
	 * @return the deperciationPkRate
	 */
	public Double getDeperciationPkRate() {
		return deperciationPkRate;
	}

	/**
	 * deperciationPkRate.
	 *
	 * @param deperciationPkRate the deperciationPkRate to set
	 */
	public void setDeperciationPkRate(Double deperciationPkRate) {
		this.deperciationPkRate = deperciationPkRate;
	}

	/**
	 * deperciationPrice.
	 *
	 * @return the deperciationPrice
	 */
	public Double getDeperciationPrice() {
		return deperciationPrice;
	}

	/**
	 * deperciationPrice.
	 *
	 * @param deperciationPrice the deperciationPrice to set
	 */
	public void setDeperciationPrice(Double deperciationPrice) {
		this.deperciationPrice = deperciationPrice;
	}

	/**
	 * maintainAdvancePrice.
	 *
	 * @return the maintainAdvancePrice
	 */
	public Double getMaintainAdvancePrice() {
		return maintainAdvancePrice;
	}

	/**
	 * maintainAdvancePrice.
	 *
	 * @param maintainAdvancePrice the maintainAdvancePrice to set
	 */
	public void setMaintainAdvancePrice(Double maintainAdvancePrice) {
		this.maintainAdvancePrice = maintainAdvancePrice;
	}

	/**
	 * maintainNormalPrice.
	 *
	 * @return the maintainNormalPrice
	 */
	public Double getMaintainNormalPrice() {
		return maintainNormalPrice;
	}

	/**
	 * maintainNormalPrice.
	 *
	 * @param maintainNormalPrice the maintainNormalPrice to set
	 */
	public void setMaintainNormalPrice(Double maintainNormalPrice) {
		this.maintainNormalPrice = maintainNormalPrice;
	}

	/**
	 * seatTypeCapacity.
	 *
	 * @return the seatTypeCapacity
	 */
	public String getSeatTypeCapacity() {
		return seatTypeCapacity;
	}

	/**
	 * seatTypeCapacity.
	 *
	 * @param seatTypeCapacity the seatTypeCapacity to set
	 */
	public void setSeatTypeCapacity(String seatTypeCapacity) {
		this.seatTypeCapacity = seatTypeCapacity;
	}

	/**
	 * listVehicleSeat.
	 *
	 * @return the listVehicleSeat
	 */
	public List<VehicleSeat> getListVehicleSeat() {
		return listVehicleSeat;
	}

	/**
	 * listVehicleSeat.
	 *
	 * @param listVehicleSeat the listVehicleSeat to set
	 */
	public void setListVehicleSeat(List<VehicleSeat> listVehicleSeat) {
		this.listVehicleSeat = listVehicleSeat;
	}

	/**
	 * capacity.
	 *
	 * @return the capacity
	 */
	public Integer getCapacity() {
		return capacity;
	}

	/**
	 * capacity.
	 *
	 * @param capacity the capacity to set
	 */
	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	/**
	 * why: toString()
	 * 
	 * @see java.lang.Object#toString()
	 *
	 * @return
	 *
	 * @author 李红 created on 2017年12月7日
	 */

	@Override
	public String toString() {
		return "Vehicle [id=" + id + ", cxCode=" + cxCode + ", cxName=" + cxName + ", czCode=" + czCode + ", czName="
				+ czName + ", lxCode=" + lxCode + ", lxName=" + lxName + ", purchasePrice=" + purchasePrice
				+ ", averageKilometer=" + averageKilometer + ", depreciationPeriod=" + depreciationPeriod
				+ ", deperciationResidualRate=" + deperciationResidualRate + ", deperciationRate=" + deperciationRate
				+ ", deperciationPkRate=" + deperciationPkRate + ", deperciationPrice=" + deperciationPrice
				+ ", maintainAdvancePrice=" + maintainAdvancePrice + ", maintainNormalPrice=" + maintainNormalPrice
				+ ", seatTypeCapacity=" + seatTypeCapacity + ", listVehicleSeat=" + listVehicleSeat + ", capacity="
				+ capacity + "]";
	}

}
