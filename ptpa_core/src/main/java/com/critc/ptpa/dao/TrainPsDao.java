/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.TrainPs;
import com.critc.ptpa.vo.TrainPsVO;
import com.critc.util.page.PageUtil;
import com.critc.util.string.StringUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:   客车统计
 *
 * @author 郭飞 created on 2017/12/1
 */
@Repository
public class TrainPsDao extends BaseDao<TrainPs, TrainPsVO> {

    /**
     * 获取旅客信息
     * @param trainPsVO 条件类
     * @return List
     * @author 郭飞 created on 2017/12/1
     */
    public List<TrainPs> list(TrainPsVO trainPsVO){
        String sql = "select id, cc,ddjmc,line_code,begin_end,mileage,railway_name,railway_level, " +
                " railway_ssjmc,locomotive_type,locomotive_psjmc,train_mileage,train_vehicle_mileage_sum,created_by," +
                " created_at,last_modified_by,last_modified_at from t_dr_trainstatistic where 1=1 ";
        sql+= createSearchSql(trainPsVO);
        sql = PageUtil.createOraclePageSQL(sql, trainPsVO.getPageIndex(),trainPsVO.getPageSize());
        return list(sql, trainPsVO);
    }

    /**
     * 根据车次获取list
     * @param cc 车次
     * @return List
     * @author 郭飞 created on 2017/12/12
     */
    public List<TrainPs> getTrainPsByCc(String cc){
        String sql = "select id, cc,ddjmc,line_code,begin_end,mileage,railway_name,railway_level, " +
                " railway_ssjmc,locomotive_type,locomotive_psjmc,train_mileage,train_vehicle_mileage_sum,created_by," +
                " created_at,last_modified_by,last_modified_at from t_dr_trainstatistic where cc=? ";
        return list(sql, cc);
    }
    /**
     * 生成查询url
     * @param trainPsVO 旅客统计查询条件类
     * @return String
     * @author 郭飞 created on 2017/12/01
     */
    private String createSearchSql(TrainPsVO trainPsVO) {
        String sql = "";
        if (StringUtil.isNotNullOrEmpty(trainPsVO.getCc())) {
            sql += " and cc = :cc";
        }

        if (StringUtil.isNotNullOrEmpty(trainPsVO.getDdjmc())) {
            sql += " and ddjmc = :ddjmc";
        }
        return sql;
    }

    /**
     * 客车统计信息总数
     * @return int
     * @author 郭飞 created on 2017/11/30
     */
    public  int count(TrainPsVO trainPsVO) {
        String sql = " select count(*) from  t_dr_trainstatistic  where 1=1 ";
        sql+= createSearchSql(trainPsVO);
        return count(sql, trainPsVO);
    }
}
