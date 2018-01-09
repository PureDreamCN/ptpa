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
import com.critc.ptpa.dao.LvCdjlclDao;
import com.critc.ptpa.model.LvCdjlcl;
import com.critc.ptpa.vo.LvCdjlclSearchVO;

/**
 * what: 机辆部车底交路编组车辆 Dao. <br/>
 * 
 * @author 刘正荣 created on 2017年11月28日
 */

@Service
public class LvCdjlclService extends BaseDao<LvCdjlcl, LvCdjlclSearchVO> {

	@Autowired
	private LvCdjlclDao lvCdjlclDao;

	/**
	 * 
	 * what: 查询机辆部车底交路. <br/>
	 * 
	 * @param LvCdjlclSearchVO lvCdjlclSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月28日
	 */
	public List<LvCdjlcl> list(LvCdjlclSearchVO lvCdjlclSearchVO) {
		return lvCdjlclDao.list(lvCdjlclSearchVO);
	}

	/**
	 * 
	 * what: 查询记录的总条数 .<br/>
	 * 
	 * @param lvCdjlclSearchVO
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月29日
	 */
	public int count(LvCdjlclSearchVO lvCdjlclSearchVO) {
		return lvCdjlclDao.count(lvCdjlclSearchVO);
	}

	public List<LvCdjlcl> getByCdjlId(int cdjlId) {
		return lvCdjlclDao.getByCdjlId(cdjlId);
	}

}
