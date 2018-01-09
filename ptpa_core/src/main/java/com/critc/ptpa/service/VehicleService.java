/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_core
 */
package com.critc.ptpa.service;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.critc.ptpa.dao.VehicleDao;
import com.critc.ptpa.dao.VehicleSeatDao;
import com.critc.ptpa.model.Vehicle;
import com.critc.ptpa.model.VehicleSeat;
import com.critc.ptpa.vo.VehicleSearchVO;

/**
 * what: 车辆类型Service
 * 
 *
 * @author 李红 created on 2017年11月27日
 */
@Service
public class VehicleService {
	/**
	 * 车辆类型Dao
	 */
	@Autowired
	private VehicleDao vehicleDao;
	/**
	 * 车辆类型席位配置Dao
	 */
	@Autowired
	private VehicleSeatDao vehicleSeatDao;
	/**
	 * 车辆类型维修Dao
	 */
//	@Autowired
//	private VehicleMaintainDao vehicleMaintainDao;

	/**
	 * 
	 * what: 车辆类型列表
	 * 
	 * @return list
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public List<Vehicle> list(VehicleSearchVO vehicleSearchVO) {
		return vehicleDao.list(vehicleSearchVO);
	}
	
	/**
	 * 
	 * what: 计算数量
	 * 
	 * @param vehicleSearchVO vehicleSearchVO
	 * @return int
	 *
	 * @author 李红 created on 2017年12月13日
	 */
	public int count(VehicleSearchVO vehicleSearchVO) {
		return vehicleDao.count(vehicleSearchVO);
	}
	/**
	 * 
	 * what: 根据id查询
	 * 
	 * @param id id
	 * @return int
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public Vehicle getById(int id) {
		return vehicleDao.getById(id);
	}
	
	/**
	 * 
	 * what: 根据车型和车种查询
	 * 
	 * @param vehicle 车辆
	 * @return list
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public List<Vehicle> getByCxCodeCzCode(String cxCode, String czCode) {
		return vehicleDao.getByCxCodeCzCode(cxCode,czCode);
	}
	/**
	 * 
	 * what: 更新参数
	 * 
	 * @param vehicle vehicle
	 *
	 * @author 李红 created on 2017年11月30日
	 */
	public Vehicle updateVehicleParam(Vehicle vehicle) {
		if(vehicle.getMaintainAdvancePrice()==null){
			vehicle.setMaintainAdvancePrice(0.00);
		}
		if(vehicle.getMaintainNormalPrice()==null){
			vehicle.setMaintainNormalPrice(0.00);
		}
		if (vehicle.getAverageKilometer() != null && vehicle.getAverageKilometer() !=0 && vehicle.getDepreciationPeriod() != null && vehicle.getDepreciationPeriod() != 0) {
			vehicle.setDeperciationResidualRate(vehicle.getDeperciationResidualRate() / 100);
			BigDecimal dR =  new BigDecimal(1.0 / vehicle.getDepreciationPeriod() * (1 - vehicle.getDeperciationResidualRate()));  
			double deperciationRate = dR.setScale(4,   BigDecimal.ROUND_HALF_UP).doubleValue();  
			// 年均折旧率
			vehicle.setDeperciationRate(deperciationRate);
			// 每公里折旧率
			NumberFormat num = NumberFormat.getNumberInstance();
			num.setMaximumFractionDigits(10);
			String deperciationPkRate = num.format(vehicle.getDeperciationRate() / vehicle.getAverageKilometer());
			vehicle.setDeperciationPkRate(Double.valueOf(deperciationPkRate).doubleValue());
			// 折旧清算单价 = 购置成本*年均折旧率/每年平均走行公里=购置成本*每公里折旧率
			//BigDecimal dP = new BigDecimal(vehicle.getPurchasePrice() * vehicle.getDeperciationPkRate());
			BigDecimal dP = new BigDecimal(vehicle.getPurchasePrice() * vehicle.getDeperciationRate() / vehicle.getAverageKilometer());
			double deperciationPrice = dP.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			vehicle.setDeperciationPrice(deperciationPrice);
		}
		/*List<VehicleMaintain> list = vehicleMaintainDao.getByVehicleId(vehicle.getId());
		if (list != null) {
			for (VehicleMaintain vehicleMaintain : list) {
				vehicle.setMaintainPrice(vehicle.getMaintainPrice() + vehicleMaintain.getPrice());
			}
		}*/
		return vehicle;
	}

	/**
	 * 
	 * what: 新增
	 * 
	 * @param vehicle 车辆类型
	 * @return int
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public int add(Vehicle vehicle) {		
		return vehicleDao.add(updateVehicleParam(vehicle));

	}

	/**
	 * 
	 * what: 修改
	 * 
	 * @param vehicle 车辆类型
	 * @return int
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public int update(Vehicle vehicle) {		
		return vehicleDao.update(updateVehicleParam(vehicle));
	}

	/**
	 * 
	 * what: 删除
	 * 
	 * @param id 车辆id
	 * @return int
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public int delete(int id) {
		vehicleSeatDao.deleteByVehicleId(id);
//		vehicleMaintainDao.deleteByVehicleId(id);
		return vehicleDao.delete(id);
	}

	/**
	 * 
	 * what: 修改车辆类型有关的数据
	 * 
	 *
	 * @author 李红 created on 2017年11月30日
	 */
	public int updateVehicle(Vehicle vehicle, List<VehicleSeat> listVehicleSeat) {
		// 修改席别配置
		vehicleSeatDao.deleteByVehicleId(vehicle.getId());
		if (listVehicleSeat != null) {
			for (VehicleSeat vehicleSeat : listVehicleSeat) {
				vehicleSeat.setVehicleId(vehicle.getId());
				vehicleSeatDao.add(vehicleSeat);
			}
		}
	/*
		// 修改维修参数
		vehicleMaintainDao.deleteByVehicleId(vehicle.getId());
		if (listVehicleMaintain != null) {
			for (VehicleMaintain vehicleMaintain : listVehicleMaintain) {
				if (vehicle.getAverageKilometer() != 0) {
					// 维修清算单价 = 平均年维修费用/平均年度走行公里计算，单位：元/辆年，精确到小数点后2位
					BigDecimal p = new BigDecimal(vehicleMaintain.getCharge() / vehicle.getAverageKilometer());
					double price = p.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
					vehicleMaintain.setPrice(price);
				}
				vehicleMaintain.setVehicleId(vehicle.getId());
				vehicleMaintainDao.add(vehicleMaintain);
			}
		}*/
		// 修改车辆基本信息
		return update(vehicle);
	}
}
