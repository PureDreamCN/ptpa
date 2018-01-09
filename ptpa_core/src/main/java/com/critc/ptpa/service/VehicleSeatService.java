/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_core
 */
package com.critc.ptpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.critc.ptpa.dao.VehicleSeatDao;
import com.critc.ptpa.model.VehicleSeat;

/**
 * what: 车辆类型席位配置Service
 * 
 *
 * @author 李红 created on 2017年11月27日
 */
@Service
public class VehicleSeatService {
	/**
	 * 车辆类型席位配置Dao
	 */
	@Autowired
	private VehicleSeatDao vehicleSeatDao;

	/**
	 * 
	 * what: 根据vehicleId查询
	 * 
	 * @param vehicleId vehicleId
	 * @return list
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public List<VehicleSeat> getByVehicleId(int vehicleId) {
		return vehicleSeatDao.getByVehicleId(vehicleId);
	}
	
}
