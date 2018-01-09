/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.LvCdjl;
import com.critc.ptpa.vo.LvCdjlSearchVO;
import com.critc.util.page.PageUtil;
import com.critc.util.string.StringUtil;

/**
 * what: 机辆部车底交路 Dao. <br/>
 * 
 * @author 刘正荣 created on 2017年11月28日
 */

@Repository
public class LvCdjlDao extends BaseDao<LvCdjl, LvCdjlSearchVO> {

	/**
	 * 
	 * what: 查询机辆部车底交路 . <br/>
	 * 
	 * @param lvCdjlSearchVO lvCdjlSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int count(LvCdjlSearchVO lvCdjlSearchVO) {
		String sql = "select count(*) from t_lv_cdjl where 1=1 ";
		sql += createSearchSql(lvCdjlSearchVO);
		return count(sql, lvCdjlSearchVO);
	}

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
		String sql = "select t.*,(select short_name from t_dic_bureau  where ljdm=t.ljdm) as short_name from t_lv_cdjl t  where 1=1";
		sql += createSearchSql(lvCdjlSearchVO);
		sql += " order by t.ljdm,t.cc asc";
		sql = PageUtil.createOraclePageSQL(sql, lvCdjlSearchVO.getPageIndex());
		return list(sql, lvCdjlSearchVO);
	}

	/**
	 * 
	 * what: 查询所有的车底记录
	 * 
	 * @return
	 *
	 * @author 刘正荣 created on 2017年12月12日
	 */
	public List<LvCdjl> listAll() {
		String sql = "select t.*,(select short_name from t_dic_bureau  where ljdm=t.ljdm) as short_name from t_lv_cdjl t";
		return list(sql);
	}

	/**
	 * 
	 * what: 插入数据. <br/>
	 * 
	 * @param lvcdjl
	 * @return
	 *
	 * @author 刘正荣 created on 2017年12月7日
	 */
	public int insert(LvCdjl lvcdjl) {
		String sql = "insert into t_lv_cdjl(id,cc,name,ljdm,speed_level,"
				+ "train_type_code,train_type_name,line,mileage,group_count,time_cost)"
				+ " values(:id,:cc,:name,:ljdm,:speedLevel,"
				+ ":trainTypeCode,:trainTypeName,:line,:mileage,:groupCount,:timeCost)";

		return insert(sql, lvcdjl);
	}

	/**
	 * 
	 * what: 查询时使用拼接url. <br/>
	 * when: 点击查询时使用.<br/>
	 * 
	 * @param lvCdjlSearchVO lvCdjlSearchVO
	 * @return 返回拼接的查询sql
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	private String createSearchSql(LvCdjlSearchVO lvCdjlSearchVO) {
		String sql = "";
		if (StringUtil.isNotNullOrEmpty(lvCdjlSearchVO.getCc())) {
			sql += " and cc like :ccStr";
		}

		if (StringUtil.isNotNullOrEmpty(lvCdjlSearchVO.getTrainTypeCode())) {
			sql += " and train_type_code=:trainTypeCode";
		}

		return sql;
	}

}
