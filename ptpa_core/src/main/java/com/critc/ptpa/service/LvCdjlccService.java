/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.critc.ptpa.dao.LvCdjlccDao;
import com.critc.ptpa.model.LvCdjlcc;
import com.critc.ptpa.vo.LvCdjlccSearchVO;

/**
 * what: 机辆部车底交路车次表 Service. <br/>
 * 
 * @author 刘正荣 created on 2017年11月28日
 */

@Service
public class LvCdjlccService {

	@Autowired
	private LvCdjlccDao lvCdjlccDao;

	/**
	 * 
	 * what: 查询机辆部车底交路. <br/>
	 * 
	 * @param lvCdjlccSearchVO
	 *            lvCdjlclSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月28日
	 */
	public List<LvCdjlcc> list(LvCdjlccSearchVO lvCdjlccSearchVO) {
		return lvCdjlccDao.list(lvCdjlccSearchVO);
	}

	/**
	 * 
	 * what: 查询机辆部车底交路记录数. <br/>
	 * 
	 * @param lvCdjlccSearchVO
	 *            lvCdjlccSearchVO
	 * @return 返回记录数
	 *
	 * @author 刘正荣 created on 2017年11月29日
	 */
	public int count(LvCdjlccSearchVO lvCdjlccSearchVO) {
		return lvCdjlccDao.count(lvCdjlccSearchVO);
	}

	/**
	 * 
	 * what: 根据车次查询
	 * 
	 * @param cc
	 * @return
	 *
	 * @author 刘正荣 created on 2017年12月11日
	 */
	public LvCdjlcc getByCc(String cc) {
		return lvCdjlccDao.getByCc(cc);
	}

}
