/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.CePrice;
import com.critc.ptpa.vo.CePriceSearchVo;
import com.critc.util.page.PageUtil;
import com.critc.util.string.StringUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:    (这里用一句话描述这个类的作用). <br/>
 * when:    (这里描述这个类的适用时机 – 可选).<br/>
 * how:     (这里描述这个类的使用方法 – 可选).<br/>
 * warning: (这里描述这个类的注意事项 – 可选).<br/>
 *
 * @author 马丽静 created on 2017/11/28
 */
@Repository
public class CePriceDao extends BaseDao<CePrice, CePriceSearchVo> {
    /**
     * what:    查询接触网和电费单价列表
     *
     * @param cePriceSearchVo
     * @return
     * @author 马丽静 created on 2017/11/28
     */
    public List<CePrice> list(CePriceSearchVo cePriceSearchVo) {
        String sql = "select id,ljdm,(select code from t_dic_bureau d where d.ljdm = t.ljdm) ljcode , (select " +
                "name from t_dic_bureau d where  d.ljdm = t.ljdm) lj_name," +
                "pse_code,pse_name,catenary_price,electricity_price from " +
                "t_price_ce t where 1=1";
        sql += createSearchSql(cePriceSearchVo);
        sql += " order by pse_code+0,ljcode+0 ";
        sql = PageUtil.createOraclePageSQL(sql, cePriceSearchVo.getPageIndex());
        return list(sql, cePriceSearchVo);
    }

    /**
     * what:   根据id查询单条ceprice数据
     *
     * @param id
     * @return
     * @author 马丽静 created on 2017/12/4
     */
    public CePrice get(Integer id) {
        String sql = "select id,ljdm,pse_code,pse_name,catenary_price,electricity_price from " +
                "t_price_ce where id = ?";
        return get(sql, id);
    }


    /**
     * what:  查询总数
     *
     * @param cePriceSearchVo
     * @return
     * @author 马丽静 created on 2017/11/28
     */
    public int count(CePriceSearchVo cePriceSearchVo) {
        String sql = "select count(*) from t_price_ce t where 1=1 ";
        sql += createSearchSql(cePriceSearchVo);
        return count(sql, cePriceSearchVo);
    }

    /**
     * what:    创建查询条件
     *
     * @param cePriceSearchVo
     * @return
     * @author 马丽静 created on 2017/11/28
     */
    private String createSearchSql(CePriceSearchVo cePriceSearchVo) {
        String sql = "";
        if (StringUtil.isNotNullOrEmpty(cePriceSearchVo.getLjdm())) {
            sql += " and ljdm=:ljdm";
        }
        if (StringUtil.isNotNullOrEmpty(cePriceSearchVo.getPseCode())) {
            sql += " and pse_code = :pseCode";
        }
        return sql;
    }

    /**
     * what:   新增接触网和电费单价方法
     *
     * @param cePrice 接触网和电费单价实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int add(CePrice cePrice) {
        String sql = "insert into  t_price_ce(id,ljdm,pse_code,pse_name,catenary_price,electricity_price) " +
                "values (seq_t_price_ce.nextval,:ljdm,:pseCode,:pseName,:catenaryPrice,:electricityPrice) ";
        return insert(sql, cePrice);
    }

    /**
     * what:   更新接触网和电费单价方法
     *
     * @param cePrice 接触网和电费单价实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int update(CePrice cePrice) {
        String sql = "update t_price_ce set ljdm=:ljdm,pse_code=:pseCode,pse_name=:pseName,catenary_price=:catenaryPrice," +
                "electricity_price=:electricityPrice where id =:id";
        return update(sql, cePrice);
    }

    /**
     * what:   更新接触网和电费单价方法
     *
     * @param id 接触网和电费单价id
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int delete(int id) {
        String sql = "delete from t_price_ce where id=?";
        return delete(sql, id);
    }
}
