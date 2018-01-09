/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_core
 */
package com.critc.ptpa.dao;

import java.util.List;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.PriceStationService;
import com.critc.util.string.StringUtil;

import org.springframework.stereotype.Repository;

/**
 * what: 车站旅客服务清算单价Dao
 * 
 *
 * @author 李红 created on 2017年12月8日
 */
@Repository
public class PriceStationServiceDao extends BaseDao<PriceStationService, PriceStationService> {
	/**
	 * 
	 * what: 车站旅客服务清算单价列表
	 * 
	 * @return list
	 *
	 * @author 李红 created on 2017年12月8日
	 */
	public List<PriceStationService> list() {
		String sql = "select t.id,t.station_service_type_code,t.station_service_type_name,t.price from t_price_stationservice t";
		sql += " order by id desc";
		return list(sql);
	}

	/**
	 * 
	 * what: 根据id查询
	 * 
	 * @param id id
	 * @return priceStationService
	 *
	 * @author 李红 created on 2017年12月8日
	 */
	public PriceStationService getById(int id) {
		String sql = "select t.id,t.station_service_type_code,t.station_service_type_name,t.price from t_price_stationservice t";
		sql += " where id= ?";
		return get(sql, id);
	}
	/**
	 * 
	 * what: 根据车站旅客服务类别查询
	 * 
	 * @param stationServiceType 车站旅客服务类别代码
	 * @return priceStationService priceStationService
	 *
	 * @author 李红 created on 2017年12月8日
	 */
	public PriceStationService getByStationServiceType(String stationServiceType) {
		String sql = "select t.id,t.station_service_type_code,t.station_service_type_name,t.price from t_price_stationservice t";
		sql += " where station_service_type_code= ?";
		return get(sql, stationServiceType);
	}
	/**
	 * 
	 * what: 根据车站旅客服务类别查询
	 * 
	 * @param priceStationService priceStationService
	 * @return int 
	 *
	 * @author 李红 created on 2017年12月8日
	 */
	public int getByStationServiceType(PriceStationService priceStationService) {
		String sql = "select count(*) from t_price_stationservice t";
		sql += " where station_service_type_code = :stationServiceTypeCode";
		if (StringUtil.isNotNullOrEmpty(String.valueOf(priceStationService.getId()))) {
			sql += " and id != :id";
		}
		return count(sql, priceStationService);
	}
	/**
	 * 
	 * what: 新增
	 * 
	 * @param priceStationService 车站旅客服务清算单价
	 * @return int
	 *
	 * @author 李红 created on 2017年12月8日
	 */
	public int add(PriceStationService priceStationService) {
		String sql = "insert into t_price_stationservice(id,station_service_type_code,station_service_type_name,price) "
				+ " values(seq_t_price_stationservice.nextval,:stationServiceTypeCode,:stationServiceTypeName,:price)";
		return insert(sql, priceStationService);

	}

	/**
	 * 
	 * what: 修改
	 * 
	 * @param priceStationService 车站旅客服务清算单价
	 * @return int
	 *
	 * @author 李红 created on 2017年12月8日
	 */
	public int update(PriceStationService priceStationService) {
		String sql = "update t_price_stationservice set station_service_type_code=:stationServiceTypeCode,station_service_type_name=:stationServiceTypeName,price=:price"
				+ " where id = :id";
		return update(sql, priceStationService);
	}

	/**
	 * 
	 * what: 删除
	 * 
	 * @param id 车站旅客服务清算单价id
	 * @return int
	 *
	 * @author 李红 created on 2017年12月8日
	 */
	public int delete(int id) {
		String sql = "delete from t_price_stationservice where id = ?";
		return delete(sql, id);
	}
}
