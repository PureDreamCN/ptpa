/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_core
 */
package com.critc.ptpa.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.PriceService;
import com.critc.ptpa.vo.PriceServiceSearchVO;
import com.critc.util.page.PageUtil;
import com.critc.util.string.StringUtil;

/**
 * what: 服务成本 Dao. <br/>
 * 
 * @author 刘正荣 created on 2017年11月24日
 */

@Repository
public class PriceServiceDao extends BaseDao<PriceService, PriceServiceSearchVO> {
	/**
	 * what: 添加服务成本. <br/>
	 * 
	 * @param priceService
	 *            priceService
	 * @return 返回结果，0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int add(PriceService priceService) {
		String sql = "insert into t_price_service(id,service_code,service_name,ljdm,unit,price)"
				+ " values(seq_t_price_service.nextval,:serviceCode,:serviceName,:ljdm,:unit,:price)";
		return insert(sql, priceService);
	}

	/**
	 * 
	 * what: 查询服务成本. <br/>
	 * 
	 * @param priceServiceSearchVO
	 *            priceServiceSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int count(PriceServiceSearchVO priceServiceSearchVO) {
		String sql = "select count(*) from t_price_service where 1=1 ";
		sql += createSearchSql(priceServiceSearchVO);
		return count(sql, priceServiceSearchVO);
	}

	/**
	 * 
	 * what: 查询服务成本. <br/>
	 * 
	 * @param priceServiceSearchVO
	 *            priceServiceSearchVO
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public List<PriceService> list(PriceServiceSearchVO priceServiceSearchVO) {
		String sql = "select t.id,t.service_code,t.service_name,t.ljdm,t.unit,t.price,(select short_name from t_dic_bureau  where ljdm=t.ljdm) as short_name from t_price_service t  where 1=1";
		sql += createSearchSql(priceServiceSearchVO);
		sql += " order by t.ljdm,t.service_code asc";
		sql = PageUtil.createOraclePageSQL(sql, priceServiceSearchVO.getPageIndex());
		return list(sql, priceServiceSearchVO);
	}

	/**
	 * 
	 * what: 查询时使用拼接url. <br/>
	 * when: 点击查询时使用.<br/>
	 * 
	 * @param priceServiceSearchVO
	 *            priceServiceSearchVO
	 * @return 返回拼接的查询sql
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	private String createSearchSql(PriceServiceSearchVO priceServiceSearchVO) {
		String sql = "";
		if (StringUtil.isNotNullOrEmpty(priceServiceSearchVO.getLjdm())) {
			sql += " and ljdm=:ljdm";
		}

		if (StringUtil.isNotNullOrEmpty(priceServiceSearchVO.getServiceCode())) {
			sql += " and service_code=:serviceCode";
		}

		return sql;
	}

	/**
	 * 
	 * what: 修改服务成本. <br/>
	 * when: 修改页面点击保存.<br/>
	 * 
	 * @param priceService
	 *            priceService
	 * @return 返回结果，0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int update(PriceService priceService) {
		String sql = "update t_price_service set service_code=:serviceCode,service_name=:serviceName,ljdm=:ljdm,unit=:unit,price=:price where id=:id";
		return update(sql, priceService);
	}

	/**
	 * 
	 * what: 删除服务成本. <br/>
	 * when: 点击删除.<br/>
	 * 
	 * @param id
	 *            删除的id
	 * @return 返回结果，0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public int delete(int id) {
		String sql = "delete from t_price_service where id=? ";
		return delete(sql, id);
	}

	/**
	 * 
	 * what: 根据id获取服务成本. <br/>
	 * when: 修改服务成本.<br/>
	 * 
	 * @param id
	 *            服务成本的id
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	public PriceService get(int id) {
		String sql = "select t.id,t.service_code,t.service_name,t.ljdm,t.unit,t.price from t_price_service t  where id=?";
		return get(sql, id);
	}

	/**
	 * what: 根据路局代码和服务代码查询. <br/>
	 * 
	 * @param ljdm
	 *            ljdm
	 * @param serviceCode
	 *            serviceCode
	 * @return 返回结果
	 *
	 * @author 刘正荣 created on 2017年11月29日
	 */
	public List<PriceService> getByLjdmAndServiceCode(String ljdm, String serviceCode) {
		String sql = "select t.id,t.service_code,t.service_name,t.ljdm,t.unit,t.price from t_price_service t  where ljdm=? and service_code=?";
		return list(sql, ljdm, serviceCode);
	}

}
