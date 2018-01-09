/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_core
 */
package com.critc.ptpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.critc.ptpa.dao.VehicleMaintainDao;
import com.critc.ptpa.model.VehicleMaintain;

/**
 * what: 车辆类型维修Service
 * 
 *
 * @author 李红 created on 2017年11月27日
 */
@Service
public class VehicleMaintainService {
	/**
	 * 车辆类型维修Dao
	 */
	@Autowired
	private VehicleMaintainDao vehicleMaintainDao;
	/**
	 * 
	 * what: 根据vehicleId查询
	 * 
	 * @param vehicleId vehicleId
	 * @return list
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public List<VehicleMaintain> getByVehicleId(int vehicleId) {
		return vehicleMaintainDao.getByVehicleId(vehicleId);
	}

}
