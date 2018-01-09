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
 * what: 车辆类型席别配置实体类
 * 
 *
 * @author 李红 created on 2017年11月24日
 */
public class VehicleSeat {
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
	 * 席别编码
	 */
	@NotEmpty
	@Size(max = 20)
	private String seatTypeCode;
	/**
	 * 席别名称
	 */
	@NotEmpty
	@Size(max = 10)
	private String seatTypeName;
	/**
	 * 定员
	 */
	@NotNull
	@Digits(integer = 3, fraction = 0)
	private int capacity;
	/**
	 * 排序
	 */
	@NotEmpty
	@Size(max = 20)
	private String orderIndex;

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
	 * seatTypeCode.
	 *
	 * @return the seatTypeCode
	 */
	public String getSeatTypeCode() {
		return seatTypeCode;
	}

	/**
	 * seatTypeCode.
	 *
	 * @param seatTypeCode the seatTypeCode to set
	 */
	public void setSeatTypeCode(String seatTypeCode) {
		this.seatTypeCode = seatTypeCode;
	}

	/**
	 * seatTypeName.
	 *
	 * @return the seatTypeName
	 */
	public String getSeatTypeName() {
		return seatTypeName;
	}

	/**
	 * seatTypeName.
	 *
	 * @param seatTypeName the seatTypeName to set
	 */
	public void setSeatTypeName(String seatTypeName) {
		this.seatTypeName = seatTypeName;
	}

	/**
	 * capacity.
	 *
	 * @return the capacity
	 */
	public int getCapacity() {
		return capacity;
	}

	/**
	 * capacity.
	 *
	 * @param capacity the capacity to set
	 */
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	/**
	 * orderIndex.
	 *
	 * @return the orderIndex
	 */
	public String getOrderIndex() {
		return orderIndex;
	}

	/**
	 * orderIndex.
	 *
	 * @param orderIndex the orderIndex to set
	 */
	public void setOrderIndex(String orderIndex) {
		this.orderIndex = orderIndex;
	}

	/**
	 * why: toString()
	 * 
	 * @see java.lang.Object#toString()
	 *
	 * @return
	 *
	 * @author 李红 created on 2017年12月3日
	 */
	@Override
	public String toString() {
		return "VehicleSeat [id=" + id + ", vehicleId=" + vehicleId + ", seatTypeCode=" + seatTypeCode
				+ ", seatTypeName=" + seatTypeName + ", capacity=" + capacity + ", orderIndex=" + orderIndex + "]";
	}

}
