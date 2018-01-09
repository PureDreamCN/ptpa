/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.critc.ptpa.dao.PriceServiceDao;
import com.critc.ptpa.model.PriceService;
import com.critc.ptpa.vo.PriceServiceSearchVO;

/**
 * what: 服务费成本. <br/>
 * 
 * @author 刘正荣 created on 2017年11月24日
 */

@Service
public class PriceServiceService {

	@Autowired
	private PriceServiceDao priceServiceDao;

	/**
	 * 
	 * what: 新增服务费成本. <br/>
	 * when: 新增页面点击保存.<br/>
	 * 
	 * @param priceService priceService
	 * @return 0表示失败，1表示成功
	 * @author 刘正荣 created on 2017年11月24日
	 *
	 */
	public int add(PriceService priceService) {
		return priceServiceDao.add(priceService);
	}

	/**
	 * 
	 * what: 修改服务费成本. <br/>
	 * when: 修改页面点击保存.<br/>
	 * 
	 * @param priceService priceService
	 * @return 0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int update(PriceService priceService) {
		return priceServiceDao.update(priceService);
	}

	/**
	 * 
	 * what: 删除服务费成本. <br/>
	 * when: 删除服务费成本.<br/>
	 * 
	 * @param id 服务费成本id
	 * @return 0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int delete(int id) {
		return priceServiceDao.delete(id);
	}

	/**
	 * 
	 * what: 根据id获取服务费成本. <br/>
	 * 
	 * @param id 服务费成本id
	 * @return 返回结果集
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public PriceService get(int id) {
		return priceServiceDao.get(id);
	}

	/**
	 * 
	 * what: 服务费成本列表. <br/>
	 * 
	 * @param priceServiceSearchVO priceServiceSearchVO
	 * @return 返回结果集
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public List<PriceService> list(PriceServiceSearchVO priceServiceSearchVO) {
		return priceServiceDao.list(priceServiceSearchVO);
	}

	/**
	 * 
	 * what: 查询服务费成本记录条数 <br/>
	 * when: 分页时.<br/>
	 * 
	 * @param priceServiceSearchVO priceServiceSearchVO
	 * @return 返回记录条数
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int count(PriceServiceSearchVO priceServiceSearchVO) {
		return priceServiceDao.count(priceServiceSearchVO);
	}

	/**
	 * what: 根据路局代码和服务代码查询. <br/>
	 * 
	 * @param ljdm ljdm
	 * @param serviceCode serviceCode
	 * @return 返回
	 *
	 * @author 刘正荣 created on 2017年11月29日
	 */
	public List<PriceService> getByLjdmAndServiceCode(String ljdm, String serviceCode) {
		return priceServiceDao.getByLjdmAndServiceCode(ljdm, serviceCode);
	}

}
