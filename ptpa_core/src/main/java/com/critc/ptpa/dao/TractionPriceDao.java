/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.TractionPrice;
import com.critc.ptpa.vo.TractionPriceSearchVo;
import com.critc.util.page.PageUtil;
import com.critc.util.string.StringUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:    牵引单价dao
 *
 * @author 马丽静 created on 2017/11/28
 */
@Repository
public class TractionPriceDao extends BaseDao<TractionPrice, TractionPriceSearchVo> {
    /**
     * what:    查询牵引单价列表
     *
     * @param tractionPriceSearchVo
     * @return
     * @author 马丽静 created on 2017/11/28
     */
    public List<TractionPrice> list(TractionPriceSearchVo tractionPriceSearchVo) {
        String sql = "select id,ljdm,traction_type_name,traction_type_code,locomotive_price,ce_price ," +
                "(select code from t_dic_bureau d where d.ljdm = t.ljdm) ljcode , (select name from t_dic_bureau d " +
                "where  d.ljdm = t.ljdm) lj_name from t_price_traction t where 1=1";
        sql += createSearchSql(tractionPriceSearchVo);
        sql += " order by ljcode+0 ";
        sql = PageUtil.createOraclePageSQL(sql, tractionPriceSearchVo.getPageIndex());
        return list(sql, tractionPriceSearchVo);
    }

    /**
     * what:    根据id查询单条tactionprice数据
     *
     * @param id
     * @return
     * @author 马丽静 created on 2017/12/4
     */
    public TractionPrice get(Integer id) {
        String sql = "select id,ljdm,traction_type_name,traction_type_code,locomotive_price,ce_price from " +
                "t_price_traction  where id = ?";
        return get(sql, id);
    }

    /**
     * what:  查询总数
     *
     * @param tractionPriceSearchVo
     * @return
     * @author 马丽静 created on 2017/11/28
     */
    public int count(TractionPriceSearchVo tractionPriceSearchVo) {
        String sql = "select count(*) from t_price_traction where 1=1 ";
        sql += createSearchSql(tractionPriceSearchVo);
        return count(sql, tractionPriceSearchVo);
    }

    /**
     * what:    创建查询条件
     *
     * @param tractionPriceSearchVo
     * @return
     * @author 马丽静 created on 2017/11/28
     */
    private String createSearchSql(TractionPriceSearchVo tractionPriceSearchVo) {
        String sql = "";
        if (StringUtil.isNotNullOrEmpty(tractionPriceSearchVo.getTractionTypeCode())) {
            sql += " and traction_type_code=:tractionTypeCode";
        }
        if (StringUtil.isNotNullOrEmpty(tractionPriceSearchVo.getLjdm())) {
            sql += " and ljdm = :ljdm";
        }
        return sql;
    }
    /**
     * what:   新增牵引单价方法
     *
     * @param tractionPrice 牵引单价实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int add(TractionPrice tractionPrice) {
        String sql = "insert into  t_price_traction(id,ljdm,traction_type_code,traction_type_name,locomotive_price," +
                "ce_price) values (seq_t_price_traction.nextval,:ljdm,:tractionTypeCode,:tractionTypeName,:locomotivePrice,:cePrice)";
        return insert(sql, tractionPrice);
    }
    /**
     * what:   更新牵引单价方法
     *
     * @param tractionPrice 牵引单价实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int update(TractionPrice tractionPrice) {
        String sql = "update t_price_traction set ljdm=:ljdm,traction_type_code=:tractionTypeCode," +
                "traction_type_name=:tractionTypeName,locomotive_price=:locomotivePrice," +
                "ce_price=:cePrice where id =:id";
        return update(sql, tractionPrice);
    }

    /**
     * what:   更新牵引单价方法
     *
     * @param id 牵引单价id
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int delete(int id) {
        String sql = "delete from t_price_traction where id=?";
        return delete(sql, id);
    }
}
