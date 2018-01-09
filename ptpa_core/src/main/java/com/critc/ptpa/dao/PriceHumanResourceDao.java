/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.PriceHumanResource;
import com.critc.ptpa.vo.PriceHumanResourceSearchVO;
import com.critc.util.page.PageUtil;
import com.critc.util.string.StringUtil;

/**
 * what: 人力清算单价 Dao. <br/>
 * 
 * @author 刘正荣 created on 2017年11月24日
 */
@Repository
public class PriceHumanResourceDao extends BaseDao<PriceHumanResource, PriceHumanResourceSearchVO> {

	/**
	 * what: 添加人力清算单价. <br/>
	 * 
	 * @param priceHumanResource priceHumanResource
	 * @return 返回结果，0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int add(PriceHumanResource priceHumanResource) {
		String sql = "insert into t_price_humanresource(id,human_resource_type_code,human_resource_type_name,ljdm,price,rate)"
				+ " values(seq_t_price_humanresource.nextval,:humanResourceTypeCode,:humanResourceTypeName,:ljdm,:price,:rate)";
		return insert(sql, priceHumanResource);
	}

	/**
	 * 
	 * what: 查询人力清算单价. <br/>
	 * 
	 * @param priceHumanResourceSearchVO priceHumanResourceSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int count(PriceHumanResourceSearchVO priceHumanResourceSearchVO) {
		String sql = "select count(*) from t_price_humanresource where 1=1 ";
		sql += createSearchSql(priceHumanResourceSearchVO);
		return count(sql, priceHumanResourceSearchVO);
	}

	/**
	 * 
	 * what: 查询人力清算单价. <br/>
	 * 
	 * @param priceHumanResourceSearchVO priceHumanResourceSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public List<PriceHumanResource> list(PriceHumanResourceSearchVO priceHumanResourceSearchVO) {
		String sql = "select t.id,t.human_resource_type_code,t.human_resource_type_name,t.ljdm,t.price,t.rate,(select short_name from t_dic_bureau  where ljdm=t.ljdm) as short_name from t_price_humanresource t  where 1=1";
		sql += createSearchSql(priceHumanResourceSearchVO);
		sql += " order by t.ljdm,t.human_resource_type_code asc";
		sql = PageUtil.createOraclePageSQL(sql, priceHumanResourceSearchVO.getPageIndex());
		return list(sql, priceHumanResourceSearchVO);
	}

	/**
	 * 
	 * what: 查询时使用拼接url. <br/>
	 * when: 点击查询时使用.<br/>
	 * 
	 * @param priceHumanResourceSearchVO priceHumanResourceSearchVO
	 * @return 返回拼接的查询sql
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	private String createSearchSql(PriceHumanResourceSearchVO priceHumanResourceSearchVO) {
		String sql = "";
		if (StringUtil.isNotNullOrEmpty(priceHumanResourceSearchVO.getHumanResourceTypeCode())) {
			sql += " and human_resource_type_code=:humanResourceTypeCode";
		}

		if (StringUtil.isNotNullOrEmpty(priceHumanResourceSearchVO.getLjdm())) {
			sql += " and ljdm=:ljdm";
		}

		return sql;
	}

	/**
	 * 
	 * what: 修改人力清算单价. <br/>
	 * when: 修改页面点击保存.<br/>
	 * 
	 * @param priceHumanResource priceHumanResource
	 * @return 返回结果，0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int update(PriceHumanResource priceHumanResource) {
		String sql = "update t_price_humanresource set human_resource_type_code=:humanResourceTypeCode,human_resource_type_name=:humanResourceTypeName,ljdm=:ljdm,price=:price,rate=:rate where id=:id";
		return update(sql, priceHumanResource);
	}

	/**
	 * 
	 * what: 删除人力清算单价. <br/>
	 * when: 点击删除.<br/>
	 * 
	 * @param id 删除的id
	 * @return 返回结果，0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int delete(int id) {
		String sql = "delete from t_price_humanresource where id=? ";
		return delete(sql, id);
	}

	/**
	 * 
	 * what: 根据id获取人力清算单价. <br/>
	 * when: 修改人力清算单价.<br/>
	 * 
	 * @param id 人力清算单价的id
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public PriceHumanResource get(int id) {
		String sql = "select t.id,t.human_resource_type_code,t.human_resource_type_name,t.ljdm,t.price,t.rate from t_price_humanresource t  where id=?";
		return get(sql, id);
	}

	/**
	 * 
	 * what: 根据路局代码和人力资源类型查询. <br/>
	 * 
	 * @param ljdm ljdm
	 * @param humanResourceTypeCode humanResourceTypeCode
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月29日
	 */
	public List<PriceHumanResource> getByLjdmAndHumanResourceTypeCode(String ljdm, String humanResourceTypeCode) {
		String sql = "select t.id,t.human_resource_type_code,t.human_resource_type_name,t.ljdm,t.price,t.rate from t_price_humanresource t  where ljdm=? and human_resource_type_code=?";
		return list(sql, ljdm, humanResourceTypeCode);
	}

}
