/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.dao.LvCdjlDao;
import com.critc.ptpa.model.LvCdjl;
import com.critc.ptpa.vo.LvCdjlSearchVO;

/**
 * what: 机辆部车底交路 Dao. <br/>
 * 
 * @author 刘正荣 created on 2017年11月28日
 */

@Service
public class LvCdjlService extends BaseDao<LvCdjl, LvCdjlSearchVO> {

	@Autowired
	private LvCdjlDao lvCdjlDao;

	/**
	 * 
	 * what: 查询机辆部车底交路. <br/>
	 * 
	 * @param lvCdjlSearchVO lvCdjlSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月28日
	 */
	public List<LvCdjl> list(LvCdjlSearchVO lvCdjlSearchVO) {
		return lvCdjlDao.list(lvCdjlSearchVO);
	}

	/**
	 * 
	 * what: 查询记录总条数. <br/>
	 * 
	 * @param lvCdjlSearchVO lvCdjlSearchVO
	 * @return 记录总条数
	 *
	 * @author 刘正荣 created on 2017年11月29日
	 */
	public int count(LvCdjlSearchVO lvCdjlSearchVO) {
		return lvCdjlDao.count(lvCdjlSearchVO);
	}

	/**
	 * 
	 * what: 查询所有车底交路信息
	 * 
	 * @return
	 *
	 * @author 刘正荣 created on 2017年12月12日
	 */
	public List<LvCdjl> listAll() {
		return lvCdjlDao.listAll();
	}

}
