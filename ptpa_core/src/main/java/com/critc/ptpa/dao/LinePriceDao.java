/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.LinePrice;
import com.critc.ptpa.vo.LinePriceSearchVo;
import com.critc.util.page.PageUtil;
import com.critc.util.string.StringUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:    线路清算单价Dao
 *
 * @author 马丽静 created on 2017/11/24
 */
@Repository
public class LinePriceDao extends BaseDao<LinePrice, LinePriceSearchVo> {

    /**
     * what:    查询线路单价列表
     *
     * @param linePriceSearchVo 查询条件params
     * @return
     * @author 马丽静 created on 2017/11/28
     */
    public List<LinePrice> list(LinePriceSearchVo linePriceSearchVo) {
        String sql = "select id,line_price_level_code,line_price_level_name,train_type_code,train_type_name," +
                "train_marshalling_type_code,train_marshalling_type_name,line_busy_level_code,line_busy_level_name," +
                "before_dawn,before_dawn_rate,price from t_price_line where 1=1";
        sql += createSearchSql(linePriceSearchVo);
        sql += " order by line_price_level_code+0";
        sql = PageUtil.createOraclePageSQL(sql, linePriceSearchVo.getPageIndex());
        return list(sql, linePriceSearchVo);
    }

    /**
     * what:    根据id查询单条lineprice数据
     *
     * @param id
     * @return
     * @author 马丽静 created on 2017/12/4
     */
    public LinePrice get(Integer id) {
        String sql = "select id,line_price_level_code,line_price_level_name,train_type_code,train_type_name," +
                "train_marshalling_type_code,train_marshalling_type_name,line_busy_level_code,line_busy_level_name," +
                "before_dawn,before_dawn_rate,price from t_price_line  where id = ?";
        return get(sql, id);
    }

    /**
     * what:  查询总数
     *
     * @param linePriceSearchVo
     * @return
     * @author 马丽静 created on 2017/11/28
     */
    public int count(LinePriceSearchVo linePriceSearchVo) {
        String sql = "select count(*) from t_price_line where 1=1 ";
        sql += createSearchSql(linePriceSearchVo);
        return count(sql, linePriceSearchVo);
    }

    /**
     * what:  创建查询条件
     *
     * @param linePriceSearchVo
     * @return
     * @author 马丽静 created on 2017/11/28
     */
    private String createSearchSql(LinePriceSearchVo linePriceSearchVo) {
        String sql = "";
        if (StringUtil.isNotNullOrEmpty(linePriceSearchVo.getLinePriceLevelCode())) {
            sql += " and line_price_level_code=:linePriceLevelCode";
        }
        if (StringUtil.isNotNullOrEmpty(linePriceSearchVo.getTrainTypeCode())) {
            sql += " and train_type_code =:trainTypeCode";
        }
        if (StringUtil.isNotNullOrEmpty(linePriceSearchVo.getTrainMarshallingTypeCode())) {
            sql += " and train_marshalling_type_code=:trainMarshallingTypeCode";
        }
        if (StringUtil.isNotNullOrEmpty(linePriceSearchVo.getLineBusyLevelCode())) {
            sql += " and line_busy_level_code=:lineBusyLevelCode";
        }
        if (linePriceSearchVo.getBeforeDown() != null) {
            sql += " and before_down=:beforeDown";
        }
        return sql;
    }

    /**
     * what:   新增线路单价方法
     *
     * @param linePrice 线路单价实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int add(LinePrice linePrice) {
        String sql = "insert into  t_price_line(id,line_price_level_code,line_price_level_name,train_type_code," +
                "train_type_name," +
                "train_marshalling_type_code,train_marshalling_type_name,line_busy_level_code,line_busy_level_name," +
                "before_dawn,before_dawn_rate,price) values (seq_t_price_line.nextval,:linePriceLevelCode," +
                ":linePriceLevelName,:trainTypeCode,:trainTypeName,:trainMarshallingTypeCode," +
                ":trainMarshallingTypeName,:lineBusyLevelCode,:lineBusyLevelName,:beforeDawn,:beforeDawnRate/100," +
                ":price) ";
        return insert(sql, linePrice);
    }
    /**
     * what:   更新线路单价方法
     *
     * @param linePrice 线路单价实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int update(LinePrice linePrice){
        String sql  ="update t_price_line set line_price_level_code=:linePriceLevelCode, " +
                "line_price_level_name=:linePriceLevelName,train_type_code=:trainTypeCode," +
                "train_type_name=:trainTypeName,train_marshalling_type_code=:trainMarshallingTypeCode," +
                "train_marshalling_type_name=:trainMarshallingTypeName,line_busy_level_code=:lineBusyLevelCode," +
                "line_busy_level_name=:lineBusyLevelName,before_dawn=:beforeDawn," +
                "before_dawn_rate=:beforeDawnRate/100," +
                "price=:price  where id =:id";
        return update(sql,linePrice);
    }
    /**
     * what:   更新线路单价方法
     *
     * @param id 线路单价id
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    public int delete(int id){
        String sql  ="delete from t_price_line where id=?";
        return delete(sql, id);
    }
}
