/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_core
 */
package com.critc.ptpa.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.Vehicle;
import com.critc.ptpa.vo.VehicleSearchVO;
import com.critc.util.page.PageUtil;
import com.critc.util.string.StringUtil;

/**
 * what: 车辆类型Dao
 * 
 *
 * @author 李红 created on 2017年11月27日
 */
@Repository
public class VehicleDao extends BaseDao<Vehicle, VehicleSearchVO> {

	/**
	 * 
	 * what: 车辆类型列表
	 * 
	 * @return list
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public List<Vehicle> list(VehicleSearchVO vehicleSearchVO) {
		String sql = "select t.id,t.cx_code,t.cx_name,t.cz_code,t.cz_name,t.lx_code,t.lx_name,t.purchase_price,t.average_kilometer,t.depreciation_period,t.deperciation_residual_rate,t.deperciation_rate,"
				+ "t.deperciation_pk_rate,t.deperciation_price,maintain_advance_price,maintain_normal_price,(select WM_CONCAT(s.seat_type_name ||':'|| s.capacity) from t_vehicle_seat s where vehicle_id=t.id) seatTypeCapacity, "
				+ " (select SUM(capacity) from t_vehicle_seat s where vehicle_id = t.id) capacity "
				+ "from t_vehicle t where 1=1";
		sql += createSearchSql(vehicleSearchVO);
		sql += " order by t.cx_code";
		sql = PageUtil.createOraclePageSQL(sql, vehicleSearchVO.getPageIndex());
		return list(sql, vehicleSearchVO);
	}

	/**
	 * 
	 * what: 创建查询条件
	 *
	 * 
	 * @param vehicleSearchVO
	 * @return
	 *
	 * @author 李红 created on 2017年12月5日
	 */
	private String createSearchSql(VehicleSearchVO vehicleSearchVO) {
		String sql = "";
		if (StringUtil.isNotNullOrEmpty(vehicleSearchVO.getCxCode())) {
			sql += " and cx_code=:cxCode";
		}
		if (StringUtil.isNotNullOrEmpty(vehicleSearchVO.getCzCode())) {
			sql += " and cz_code=:czCode";
		}
		return sql;
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
		String sql = "select count(*) from t_vehicle t where 1=1 ";
		sql += createSearchSql(vehicleSearchVO);
		return count(sql, vehicleSearchVO);
	}
	/**
	 * 
	 * what: 根据车型和车种查询
	 * 
	 * @param vehicle 车辆
	 * @return int
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	/*public int getByCxCodeCzCode(Vehicle vehicle) {
		String sql = "select count(*) from t_vehicle where cx_code = ? and cz_code = ?";
		if (StringUtil.isNotNullOrEmpty(String.valueOf(vehicle.getId()))) {
			sql += " and id != ?";
		}
		Object[] objects = new Object[] { vehicle.getCxCode(), vehicle.getCzCode(), vehicle.getId() };
		return count(sql, objects);
	}*/

	/**
	 * 
	 * what: 根据车型和车种查询
	 * 
	 * @param cxCode 车型代码
	 * @param czCode 车辆代码
	 * @return
	 *
	 * @author 李红 created on 2017年12月11日
	 */
	public List<Vehicle> getByCxCodeCzCode(String cxCode, String czCode) {
		String sql = "select t.id,t.cx_code,t.cx_name,t.cz_code,t.cz_name,t.lx_code,t.lx_name,t.purchase_price,t.average_kilometer,t.depreciation_period,t.deperciation_residual_rate,t.deperciation_rate,"
				+ "t.deperciation_pk_rate,t.deperciation_price,maintain_advance_price,maintain_normal_price,(select WM_CONCAT(s.seat_type_name ||':'|| s.capacity) from t_vehicle_seat s where vehicle_id=t.id) seatTypeCapacity, "
				+ " (select SUM(capacity) from t_vehicle_seat s where vehicle_id = t.id) capacity "
				+ " from t_vehicle t where cx_code=? and cz_code=?";
		sql += " order by t.cx_code";
		Object[] objects = new Object[] { cxCode, czCode };
		return list(sql, objects);
	}

	/**
	 * 
	 * what: 根据id查询
	 * 
	 * @param id id
	 * @return vehicle
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public Vehicle getById(int id) {
		String sql = "select t.id,t.cx_code,t.cx_name,t.cz_code,t.cz_name,t.lx_code,t.lx_name,t.purchase_price,t.average_kilometer,t.depreciation_period,t.deperciation_residual_rate,t.deperciation_rate,"
				+ "t.deperciation_pk_rate,t.deperciation_price,maintain_advance_price,maintain_normal_price,(select WM_CONCAT(s.seat_type_name ||':'|| s.capacity) from t_vehicle_seat s where vehicle_id=t.id) seatTypeCapacity,"
				+ " (select SUM(capacity) from t_vehicle_seat s where vehicle_id = t.id) capacity "
				+ " from t_vehicle t where t.id = ?";
		return get(sql, id);
	}

	/**
	 * 
	 * what: 新增
	 * 
	 * @param vehicle 车辆
	 * @return int
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public int add(Vehicle vehicle) {
		String sql = "insert into t_vehicle(id,cx_code,cx_name,cz_code,cz_name,lx_code,lx_name,purchase_price,average_kilometer,depreciation_period,deperciation_residual_rate,deperciation_rate,deperciation_pk_rate,deperciation_price,maintain_advance_price,maintain_normal_price) "
				+ " values(seq_t_vehicle.nextval,:cxCode,:cxName,:czCode,:czName,:lxCode,:lxName,:purchasePrice,:averageKilometer,:depreciationPeriod,:deperciationResidualRate,:deperciationRate,:deperciationPkRate,:deperciationPrice,:maintainAdvancePrice,:maintainNormalPrice)";
		return insertForId(sql, vehicle, "id");

	}

	/**
	 * 
	 * what: 修改
	 * 
	 * @param vehicle 车辆
	 * @return int
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public int update(Vehicle vehicle) {
		String sql = "update t_vehicle set cx_code=:cxCode,cx_name=:cxName,cz_code=:czCode,cz_name=:czName,lx_code=:lxCode,lx_name=:lxName,purchase_price=:purchasePrice,average_kilometer=:averageKilometer,"
				+ "depreciation_period=:depreciationPeriod,deperciation_residual_rate=:deperciationResidualRate,deperciation_rate=:deperciationRate,"
				+ "deperciation_pk_rate=:deperciationPkRate,deperciation_price=:deperciationPrice,maintain_advance_price=:maintainAdvancePrice,maintain_normal_price=:maintainNormalPrice where id = :id";
		return update(sql, vehicle);
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
		String sql = "delete from t_vehicle where id = ?";
		return delete(sql, id);
	}
}
