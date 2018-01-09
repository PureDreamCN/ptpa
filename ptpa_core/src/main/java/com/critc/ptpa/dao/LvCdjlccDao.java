/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.LvCdjlcc;
import com.critc.ptpa.vo.LvCdjlccSearchVO;
import com.critc.util.page.PageUtil;

/**
 * what: 机辆部车底交路车次表 Dao. <br/>
 * 
 * @author 刘正荣 created on 2017年11月28日
 */

@Repository
public class LvCdjlccDao extends BaseDao<LvCdjlcc, LvCdjlccSearchVO> {

	/**
	 * 
	 * what: 查询机辆部车底交路车次表 . <br/>
	 * 
	 * @param lvCdjlccSearchVO
	 *            lvCdjlccSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int count(LvCdjlccSearchVO lvCdjlccSearchVO) {
		String sql = "select count(*) from t_lv_cdjlcc where 1=1 ";
		return count(sql, lvCdjlccSearchVO);
	}

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
		String sql = "select t.* from t_lv_cdjlcc t  where 1=1";
		sql += " order by t.cc";
		sql = PageUtil.createOraclePageSQL(sql, lvCdjlccSearchVO.getPageIndex());
		return list(sql, lvCdjlccSearchVO);
	}

	/**
	 * what: 根据车次查询
	 * 
	 * @param cc 车次
	 * @return
	 *
	 * @author 刘正荣 created on 2017年12月11日
	 */
	public LvCdjlcc getByCc(String cc) {
		String sql = "select t.* from t_lv_cdjlcc t  where cc=?";
		return get(sql, cc);
	}

}
