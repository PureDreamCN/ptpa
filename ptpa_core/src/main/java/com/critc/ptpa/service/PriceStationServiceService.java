/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_core
 */
package com.critc.ptpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.critc.ptpa.dao.PriceStationServiceDao;
import com.critc.ptpa.model.PriceStationService;
import org.springframework.stereotype.Service;

/**
 * what: 车站旅客服务清算单价Service
 * 
 *
 * @author 李红 created on 2017年12月8日
 */
@Service
public class PriceStationServiceService {
	/**
	 * 车站旅客服务清算单价Dao
	 */
	@Autowired
	private PriceStationServiceDao priceStationServiceDao;

	/**
	 * 
	 * what: 车站旅客服务清算单价列表
	 * 
	 * @return list
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public List<PriceStationService> list() {
		return priceStationServiceDao.list();
	}

	/**
	 * 
	 * what: 根据id查询
	 * 
	 * @param id id
	 * @return priceStationService
	 *
	 * @author 李红 created on 2017年11月27日
	 */
	public PriceStationService getById(int id) {
		return priceStationServiceDao.getById(id);
	}

	/**
	 * 
	 * what: 根据车站旅客服务类别查询
	 * 
	 * 
	 * @param stationServiceType 车站旅客服务类别代码
	 * @return priceStationService priceStationService
	 *
	 * @author 李红 created on 2017年12月8日
	 */
	public PriceStationService getByStationServiceType(String stationServiceType) {
		return priceStationServiceDao.getByStationServiceType(stationServiceType);
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
		int flag = 0;
		int count = priceStationServiceDao.getByStationServiceType(priceStationService);
		if (count > 0) {
			flag = -1;
		} else {
			priceStationServiceDao.add(priceStationService);
			flag = 1;
		}
		return flag;

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
		int flag = 0;
		int count = priceStationServiceDao.getByStationServiceType(priceStationService);
		if (count > 0) {
			flag = -1;
		} else {
			priceStationServiceDao.update(priceStationService);
			flag = 1;
		}
		return flag;
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
		return priceStationServiceDao.delete(id);
	}
}
