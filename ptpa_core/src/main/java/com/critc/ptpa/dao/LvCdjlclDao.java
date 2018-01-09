/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.LvCdjlcl;
import com.critc.ptpa.vo.LvCdjlclSearchVO;
import com.critc.util.page.PageUtil;

/**
 * what: 机辆部车底交路编组车辆 Dao. <br/>
 * 
 * @author 刘正荣 created on 2017年11月28日
 */

@Repository
public class LvCdjlclDao extends BaseDao<LvCdjlcl, LvCdjlclSearchVO> {

	/**
	 * 
	 * what: 查询机辆部车底交路编组车辆 . <br/>
	 * 
	 * @param lvCdjlclSearchVO lvCdjlclSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int count(LvCdjlclSearchVO lvCdjlclSearchVO) {
		String sql = "select count(*) from t_lv_cdjlcl where 1=1 ";
		return count(sql, lvCdjlclSearchVO);
	}

	/**
	 * 
	 * what: 查询机辆部车底交路. <br/>
	 * 
	 * @param lvCdjlclSearchVO lvCdjlclSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月28日
	 */
	public List<LvCdjlcl> list(LvCdjlclSearchVO lvCdjlclSearchVO) {
		String sql = "select t.* from t_lv_cdjlcl t where 1=1";
		sql += " order by t.cdjl_id,t.order_index asc";
		sql = PageUtil.createOraclePageSQL(sql, lvCdjlclSearchVO.getPageIndex());
		return list(sql, lvCdjlclSearchVO);
	}

	/**
	 * 
	 * what: 插入数据. <br/>
	 * 
	 * @param lvCdjlcl
	 * @return
	 *
	 * @author 刘正荣 created on 2017年12月7日
	 */
	public int insert(LvCdjlcl lvCdjlcl) {
		String sql = "insert into t_lv_cdjlcl values(:id,:cdjlId,:cxCode,:cxName,:czCode,:czName,:capacity,:orderIndex)";
		return insert(sql, lvCdjlcl);
	}

	/**
	 * 
	 * what: 根据车底id查询. <br/>
	 * 
	 * @param cdjlId
	 * @return
	 *
	 * @author 刘正荣 created on 2017年12月7日
	 */
	public List<LvCdjlcl> getByCdjlId(int cdjlId) {
		String sql = "select t.* from t_lv_cdjlcl t where t.cdjl_id=?";
		return list(sql, cdjlId);
	}

}
