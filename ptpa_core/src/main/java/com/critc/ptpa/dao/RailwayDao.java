/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.Railway;
import com.critc.ptpa.vo.RailwaySearchVO;
import com.critc.util.page.PageUtil;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * what: 线路dao
 *
 * @author 郭飞 created on 2017/11/24
 */
@Repository
public class RailwayDao  extends BaseDao<Railway, RailwaySearchVO> {

    /**
     * 获取所有线路
     * @param railwaySearchVO 线路查询条件类
     * @return List
     * @author 郭飞 created on 2017/11/24
     */
    public List<Railway> list(RailwaySearchVO railwaySearchVO){
        String sql = " select xldm , name,begin_czdm,end_czdm,mileage,property_right  from t_dic_railway  where  1=1    ";
        sql+= createSearchSql(railwaySearchVO);
        sql+= " order by xldm ";
        sql = PageUtil.createOraclePageSQL(sql, railwaySearchVO.getPageIndex(),railwaySearchVO.getPageSize());
        return list(sql, railwaySearchVO);
    }

    /**
     * 线路总数
     * @return int
     * @author 郭飞 created on 2017/11/24
     */
    public  int count(RailwaySearchVO railwaySearchVO) {
        String sql = " select count(*) from  t_dic_railway where 1=1";
        sql+= createSearchSql(railwaySearchVO);
        return count(sql, railwaySearchVO);
    }
    /**
     * 生成查询url
     * @param railwaySearchVO 线路查询条件类
     * @return String
     * @author 郭飞 created on 2017/11/24
     */
    private String createSearchSql(RailwaySearchVO railwaySearchVO) {
        String sql = "";
        if (!railwaySearchVO.getXldm().equals("%null%")) {
            sql += " and xldm like :xldm";
        }
        if (!railwaySearchVO.getName().equals("%null%")) {
            sql += " and name like :name";
        }
        if (!railwaySearchVO.getBeginCzdm().equals("%null%")) {
            sql += " and begin_czdm like :beginCzdm";
        }
        if (!railwaySearchVO.getEndCzdm().equals("%null%")) {
            sql += " and end_czdm like :endCzdm";
        }

        return sql;
    }

    /**
     * 获取线路名称
     * @param xldm 线路代码
     * @return String
     * @author 郭飞 created on 2017/12/4
     */
    public String getNameByXldm(String xldm){
        String sql = "select name  from t_dic_railway where xldm = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{xldm} ,String.class);
    }

    /**
     * 新增线路
     * @param railway station
     * @return int
     */
    public int add(Railway railway){
        String sql = "insert into t_dic_railway( xldm ,name,begin_czdm,end_czdm,mileage,property_right) values(:xldm ,:name,:beginCzdm,:endCzdm,:mileage,:propertyRight) ";
        return insert(sql, railway);
    }

    /**
     * 修改线路
     * @param railway railway
     * @param xldm xldm
     * @return int
     */
    public int update(Railway railway, String xldm){
        String sql = "update t_dic_railway set xldm=? ,name=?,begin_czdm=?,end_czdm=?,mileage=?,property_right=? where xldm=?";
        return update(sql, railway.getXldm(), railway.getName(), railway.getBeginCzdm(), railway.getEndCzdm(), railway.getMileage(), railway.getPropertyRight(), xldm);
    }

    /**
     * 删除线路
     * @param xldm xldm
     * @return int
     */
    public int delete(String xldm){
        String sql = "delete from t_dic_railway where xldm=?";
        return delete(sql, xldm);
    }

    /**
     * 获得单个线路
     * @param xldm xldm
     * @return Railway
     */
    public  Railway getRailwayByXldm(String xldm){
        String sql = "select * from t_dic_railway where xldm=?";
        return get(sql, xldm);
    }


}
