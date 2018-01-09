/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.TrainStatistic;
import com.critc.ptpa.vo.TrainStatisticVO;
import com.critc.util.page.PageUtil;
import com.critc.util.string.StringUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:   旅客统计dao
 *
 * @author 郭飞 created on 2017/11/30
 */
@Repository
public class TrainStatisticDao  extends BaseDao<TrainStatistic, TrainStatisticVO> {

    /**
     * 获取旅客统计信息
     * @param trainStatisticVO 条件类
     * @return List
     * @author 郭飞 created on 2017/11/30
     */
    public List<TrainStatistic>  list(TrainStatisticVO trainStatisticVO){
        String sql = "select id, jl_code,statistic_date,cc,passenger_volume,passenger_mileage," +
                "fare_sum,ljdm,created_by,created_at,last_modified_by,last_modified_at  " +
                " from t_dr_trainps  where 1=1  ";
        sql+= createSearchSql(trainStatisticVO);
        sql+= " order by statistic_date desc ,id desc ";
        sql = PageUtil.createOraclePageSQL(sql, trainStatisticVO.getPageIndex());

        return list(sql, trainStatisticVO);
     }


    /**
     * 旅客统计信息总数
     * @return int
     * @author 郭飞 created on 2017/11/30
     */
    public  int count(TrainStatisticVO trainStatisticVO) {
        String sql = " select count(*) from  t_dr_trainps  where 1=1 ";
        sql+= createSearchSql(trainStatisticVO);
        return count(sql, trainStatisticVO);
    }


    /**
     * 生成查询url
     * @param trainStatisticVO 旅客统计查询条件类
     * @return String
     * @author 郭飞 created on 2017/11/30
     */
    private String createSearchSql(TrainStatisticVO trainStatisticVO) {
        String sql = "";
        if (StringUtil.isNotNullOrEmpty(trainStatisticVO.getCc())) {
            sql += " and cc = :cc";
        }
        if (trainStatisticVO.getStatisticDate()!=null) {
            sql += " and statistic_date = :statisticDate";
        }

        if (StringUtil.isNotNullOrEmpty(trainStatisticVO.getId())) {
            sql += " and id = :id";
        }


        return sql;
    }

}
