/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.critc.ptpa.dao.PriceHumanResourceDao;
import com.critc.ptpa.model.PriceHumanResource;
import com.critc.ptpa.vo.PriceHumanResourceSearchVO;

/**
 * what: 人力清算单价 Service. <br/>
 * 
 *
 * @author 刘正荣 created on 2017年11月24日
 */

@Service
public class PriceHumanResourceService {

	@Autowired
	private PriceHumanResourceDao priceHumanResourceDao;

	/**
	 * 
	 * what: 新增人力清算单价. <br/>
	 * when: 新增页面点击保存.<br/>
	 * 
	 * @param priceHumanResource priceHumanResource
	 * @return 0表示失败，1表示成功
	 * @author 刘正荣 created on 2017年11月24日
	 *
	 */
	public int add(PriceHumanResource priceHumanResource) {
		return priceHumanResourceDao.add(priceHumanResource);
	}

	/**
	 * 
	 * what: 修改人力清算单价. <br/>
	 * when: 修改页面点击保存.<br/>
	 * 
	 * @return 0表示失败，1表示成功
	 * @param priceHumanResource priceHumanResource
	 * 
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int update(PriceHumanResource priceHumanResource) {
		return priceHumanResourceDao.update(priceHumanResource);
	}

	/**
	 * 
	 * what: 删除人力清算单价. <br/>
	 * when: 删除人力清算单价.<br/>
	 * 
	 * @param id 人力清算单价id
	 * @return 0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int delete(int id) {
		return priceHumanResourceDao.delete(id);
	}

	/**
	 * 
	 * what: 根据id获取人力清算单价. <br/>
	 * 
	 * @param id 人力清算单价id
	 * @return 返回结果集
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public PriceHumanResource get(int id) {
		return priceHumanResourceDao.get(id);
	}

	/**
	 * 
	 * what: 人力清算单价列表. <br/>
	 * 
	 * @param priceHumanResourceSearchVO priceHumanResourceSearchVO
	 * @return 返回结果集
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public List<PriceHumanResource> list(PriceHumanResourceSearchVO priceHumanResourceSearchVO) {
		return priceHumanResourceDao.list(priceHumanResourceSearchVO);
	}

	/**
	 * 
	 * what: 查询人力清算单价记录条数 <br/>
	 * when: 分页时.<br/>
	 * 
	 * @param priceHumanResourceSearchVO priceHumanResourceSearchVO
	 * @return 返回记录条数
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int count(PriceHumanResourceSearchVO priceHumanResourceSearchVO) {
		return priceHumanResourceDao.count(priceHumanResourceSearchVO);
	}

	/**
	 * 
	 * what: 根据路局代码和人力资源类型查询. <br/>
	 * 
	 * @param ljdm ljdm
	 * @param humanResourceTypeCode humanResourceTypeCode
	 * @return 返回
	 *
	 * @author 刘正荣 created on 2017年11月29日
	 */
	public List<PriceHumanResource> getByLjdmAndHumanResourceTypeCode(String ljdm, String humanResourceTypeCode) {
		return priceHumanResourceDao.getByLjdmAndHumanResourceTypeCode(ljdm, humanResourceTypeCode);
	}

}
