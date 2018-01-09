/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.PricePart;
import com.critc.ptpa.vo.PricePartSearchVO;
import com.critc.util.page.PageUtil;
import com.critc.util.string.StringUtil;

/**
 * what: 备品成本 Dao. <br/>
 * 
 * @author 刘正荣 created on 2017年11月24日
 */

@Repository
public class PricePartDao extends BaseDao<PricePart, PricePartSearchVO> {

	/**
	 * what: 添加备品成本. <br/>
	 * 
	 * @param priceHumanResource priceHumanResource
	 * @return 返回结果，0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int add(PricePart pricePart) {
		String sql = "insert into t_price_part(id,ljdm,train_type_code,train_type_name,price)"
				+ " values(seq_t_price_part.nextval,:ljdm,:trainTypeCode,:trainTypeName,:price)";
		return insert(sql, pricePart);
	}

	/**
	 * 
	 * what: 查询备品成本. <br/>
	 * 
	 * @param pricePartSearchVO pricePartSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int count(PricePartSearchVO pricePartSearchVO) {
		String sql = "select count(*) from t_price_part where 1=1 ";
		sql += createSearchSql(pricePartSearchVO);
		return count(sql, pricePartSearchVO);
	}

	/**
	 * 
	 * what: 查询备品成本. <br/>
	 * 
	 * @param pricePartSearchVO pricePartSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public List<PricePart> list(PricePartSearchVO pricePartSearchVO) {
		String sql = "select t.id,t.ljdm,t.train_type_code,t.train_type_name,t.price,(select short_name from t_dic_bureau  where ljdm=t.ljdm) as short_name from t_price_part t  where 1=1";
		sql += createSearchSql(pricePartSearchVO);
		sql += " order by t.ljdm asc";
		sql = PageUtil.createOraclePageSQL(sql, pricePartSearchVO.getPageIndex());
		return list(sql, pricePartSearchVO);
	}

	/**
	 * 
	 * what: 查询时使用拼接url. <br/>
	 * when: 点击查询时使用.<br/>
	 * 
	 * @param pricePartSearchVO pricePartSearchVO
	 * @return 返回拼接的查询sql
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	private String createSearchSql(PricePartSearchVO pricePartSearchVO) {
		String sql = "";
		if (StringUtil.isNotNullOrEmpty(pricePartSearchVO.getLjdm())) {
			sql += " and ljdm=:ljdm";
		}

		if (StringUtil.isNotNullOrEmpty(pricePartSearchVO.getTrainTypeCode())) {
			sql += " and train_type_code=:trainTypeCode";
		}

		return sql;
	}

	/**
	 * 
	 * what: 修改备品成本. <br/>
	 * when: 修改页面点击保存.<br/>
	 * 
	 * @param pricePart pricePart
	 * @return 返回结果，0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int update(PricePart pricePart) {
		String sql = "update t_price_part set ljdm=:ljdm,train_type_code=:trainTypeCode,train_type_name=:trainTypeName,price=:price where id=:id";
		return update(sql, pricePart);
	}

	/**
	 * 
	 * what: 删除备品成本. <br/>
	 * when: 点击删除.<br/>
	 * 
	 * @param id 删除的id
	 * @return 返回结果，0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int delete(int id) {
		String sql = "delete from t_price_part where id=? ";
		return delete(sql, id);
	}

	/**
	 * 
	 * what: 根据id获取备品成本. <br/>
	 * when: 修改备品成本.<br/>
	 * 
	 * @param id 备品成本的id
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public PricePart get(int id) {
		String sql = "select t.id,t.ljdm,t.train_type_code,t.train_type_name,t.price from t_price_part t  where id=?";
		return get(sql, id);
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
	public PricePart getByLjdmAndTrainType(String ljdm, String trainType) {
		String sql = "select t.id,t.ljdm,t.train_type_code,t.t.train_type_name,t.price from t_price_part t where ljdm=? and train_type_code=?";
		return get(sql, ljdm, trainType);
	}
}
