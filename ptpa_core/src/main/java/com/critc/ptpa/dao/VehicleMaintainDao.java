/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_core
 */
package com.critc.ptpa.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.VehicleMaintain;

/**
 * what: 车辆类型维修Dao
 * 
 *
 * @author 李红 created on 2017年11月27日
 */
@Repository
public class VehicleMaintainDao extends BaseDao<VehicleMaintain, VehicleMaintain> {
	/**
	 * 
	 * what: 新增
	 * 
	 * @param vehicleMaintain 车辆类型维修
	 * @return int
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public int add(VehicleMaintain vehicleMaintain) {
		String sql = "insert into t_vehicle_maintain(id,vehicle_id,vehicle_maintain_type_code,vehicle_maintain_type_name,charge,price,order_index) "
				+ " values(seq_t_vehicle_maintain.nextval,:vehicleId,:vehicleMaintainTypeCode,:vehicleMaintainTypeName,:charge,:price,:orderIndex)";
		return insert(sql, vehicleMaintain);
	}
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
		String sql = "select t.id,t.vehicle_id,t.vehicle_maintain_type_code,t.vehicle_maintain_type_name,t.charge,t.price,t.order_index from t_vehicle_maintain t where vehicle_id = ?";
		return list(sql, vehicleId);
	}
	/**
	 * 
	 * what: 修改
	 * 
	 * @param vehicleMaintain 车辆类型维修
	 * @return int
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public int update(VehicleMaintain vehicleMaintain) {
		String sql = "update t_vehicle_maintain set vehicle_id=:vehicleId,vehicle_maintain_type_code=:vehicleMaintainTypeCode,vehicle_maintain_type_name=:vehicleMaintainTypeName,"
				+ "charge=:charge,price=:price,order_index=:orderIndex where id = :id";
		return update(sql, vehicleMaintain);
	}
	/**
	 * 
	 * what: 根据vehicleId删除
	 * 
	 * @param vehicleId
	 * @return
	 *
	 * @author 李红 created on 2017年11月30日
	 */
	public int deleteByVehicleId(int vehicleId) {
		String sql = "delete from t_vehicle_maintain where vehicle_id = ?";
		return delete(sql, vehicleId);
	}
}
