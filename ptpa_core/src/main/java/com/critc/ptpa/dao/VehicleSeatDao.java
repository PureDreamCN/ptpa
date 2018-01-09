/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_core
 */
package com.critc.ptpa.dao;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.VehicleSeat;

/**
 * what: 车辆类型席位配置Dao
 * 
 *
 * @author 李红 created on 2017年11月27日
 */
@Repository
public class VehicleSeatDao extends BaseDao<VehicleSeat, VehicleSeat> {
	/**
	 * 
	 * what: 新增
	 * 
	 * @param vehicleSeat 车辆类型席位配置
	 * @return int
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public int add(@Valid VehicleSeat vehicleSeat) {
		String sql = "insert into t_vehicle_seat(id,vehicle_id,seat_type_code,seat_type_name,capacity,order_index) "
				+ " values(seq_t_vehicle_seat.nextval,:vehicleId,:seatTypeCode,:seatTypeName,:capacity,:orderIndex)";
		return insert(sql, vehicleSeat);
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
	public List<VehicleSeat> getByVehicleId(int vehicleId) {
		String sql = "select t.id,t.vehicle_id,t.seat_type_code,t.seat_type_name,t.capacity,t.order_index from t_vehicle_seat t where vehicle_id = ?";
		return list(sql, vehicleId);
	}

	/**
	 * 
	 * what: 修改
	 * 
	 * @param vehicleSeat 车辆类型席位配置
	 * @return int
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public int update(@Valid VehicleSeat vehicleSeat) {
		String sql = "update t_vehicle_seat set vehicle_id=:vehicleId,seat_type_code=:seatTypeCode,seat_type_name=:seatTypeName,capacity=:capacity,order_index=:orderIndex) "
				+ " where id =:id";
		return update(sql, vehicleSeat);
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
		String sql = "delete from t_vehicle_seat where vehicle_id = ?";
		return delete(sql, vehicleId);
	}
}
