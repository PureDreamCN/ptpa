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
 * what: 车辆类型维修实体类
 * 
 *
 * @author 李红 created on 2017年11月24日
 */
public class VehicleMaintain {
	/**
	 * 主键
	 */
	private int id;
	/**
	 * 车辆类型ID
	 */
	@NotNull
	private int vehicleId;
	/**
	 * 维修类别代码
	 */
	@NotEmpty
	@Size(max = 20)
	private String vehicleMaintainTypeCode;
	/**
	 * 维修类别名称
	 */
	@NotEmpty
	@Size(max = 10)
	private String vehicleMaintainTypeName;
	/**
	 * 平均年维修费用
	 */
	@NotNull
	@Digits(integer = 13, fraction = 2)
	private double charge;
	/**
	 * 维修清算单价
	 */
	@NotNull
	@Digits(integer = 13, fraction = 2)
	private double price;
	/**
	 * 排序
	 */
	@NotEmpty
	@Size(max = 20)
	private Integer orderIndex;

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
	 * vehicleId.
	 *
	 * @return the vehicleId
	 */
	public int getVehicleId() {
		return vehicleId;
	}

	/**
	 * vehicleId.
	 *
	 * @param vehicleId the vehicleId to set
	 */
	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}

	/**
	 * vehicleMaintainTypeCode.
	 *
	 * @return the vehicleMaintainTypeCode
	 */
	public String getVehicleMaintainTypeCode() {
		return vehicleMaintainTypeCode;
	}

	/**
	 * vehicleMaintainTypeCode.
	 *
	 * @param vehicleMaintainTypeCode the vehicleMaintainTypeCode to set
	 */
	public void setVehicleMaintainTypeCode(String vehicleMaintainTypeCode) {
		this.vehicleMaintainTypeCode = vehicleMaintainTypeCode;
	}

	/**
	 * vehicleMaintainTypeName.
	 *
	 * @return the vehicleMaintainTypeName
	 */
	public String getVehicleMaintainTypeName() {
		return vehicleMaintainTypeName;
	}

	/**
	 * vehicleMaintainTypeName.
	 *
	 * @param vehicleMaintainTypeName the vehicleMaintainTypeName to set
	 */
	public void setVehicleMaintainTypeName(String vehicleMaintainTypeName) {
		this.vehicleMaintainTypeName = vehicleMaintainTypeName;
	}

	/**
	 * charge.
	 *
	 * @return the charge
	 */
	public double getCharge() {
		return charge;
	}

	/**
	 * charge.
	 *
	 * @param charge the charge to set
	 */
	public void setCharge(double charge) {
		this.charge = charge;
	}

	/**
	 * price.
	 *
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * price.
	 *
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	public Integer getOrderIndex() {
		return orderIndex;
	}

	public void setOrderIndex(Integer orderIndex) {
		this.orderIndex = orderIndex;
	}

	/**
	 * why: toStrig()
	 * 
	 * @see java.lang.Object#toString()
	 *
	 * @return
	 *
	 * @author 李红 created on 2017年11月24日
	 */
	@Override
	public String toString() {
		return "VehicleMaintain [id=" + id + ", vehicleId=" + vehicleId + ", vehicleMaintainTypeCode="
				+ vehicleMaintainTypeCode + ", vehicleMaintainTypeName=" + vehicleMaintainTypeName + ", charge="
				+ charge + ", price=" + price + ", orderIndex=" + orderIndex + "]";
	}

}
