/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.critc.ptpa.dao.PricePartDao;
import com.critc.ptpa.model.PricePart;
import com.critc.ptpa.vo.PricePartSearchVO;

/**
 * what: 备品成本 Service. <br/>
 * 
 *
 * @author 刘正荣 created on 2017年11月24日
 */
@Service
public class PricePartService {

	@Autowired
	private PricePartDao pricePartDao;

	/**
	 * 
	 * what: 新增备品成本. <br/>
	 * when: 新增页面点击保存.<br/>
	 * 
	 * @return 0表示失败，1表示成功
	 * @param pricePart pricePart
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 *
	 */
	public int add(PricePart pricePart) {
		return pricePartDao.add(pricePart);
	}

	/**
	 * 
	 * what: 修改备品成本. <br/>
	 * when: 修改页面点击保存.<br/>
	 * 
	 * @param pricePart pricePart
	 * @return 0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int update(PricePart pricePart) {
		return pricePartDao.update(pricePart);
	}

	/**
	 * 
	 * what: 删除备品成本. <br/>
	 * when: 删除备品成本.<br/>
	 * 
	 * @param id 备品成本id
	 * @return 0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int delete(int id) {
		return pricePartDao.delete(id);
	}

	/**
	 * 
	 * what: 根据id获取备品成本. <br/>
	 * 
	 * @param id 备品成本id
	 * @return 返回结果集
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public PricePart get(int id) {
		return pricePartDao.get(id);
	}

	/**
	 * 
	 * what: 备品成本列表. <br/>
	 * 
	 * @param pricePartSearchVO pricePartSearchVO
	 * @return 返回结果集
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public List<PricePart> list(PricePartSearchVO pricePartSearchVO) {
		return pricePartDao.list(pricePartSearchVO);
	}

	/**
	 * 
	 * what: 查询备品成本记录条数 <br/>
	 * when: 分页时.<br/>
	 * 
	 * @param pricePartSearchVO pricePartSearchVO
	 * @return 返回记录条数
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int count(PricePartSearchVO pricePartSearchVO) {
		return pricePartDao.count(pricePartSearchVO);
	}

	/**
	 * 
	 * what: 根据路局，辆型，车种查询. <br/>
	 * 
	 * 
	 * @param ljdm
	 * @param lx
	 * @param cz
	 * @return
	 *
	 * @author 刘正荣 created on 2017年12月4日
	 */
	public PricePart getByLjdmAndTrainTypeCode(String ljdm, String trainTypeCode) {
		return pricePartDao.getByLjdmAndTrainType(ljdm, trainTypeCode);
	}

}
