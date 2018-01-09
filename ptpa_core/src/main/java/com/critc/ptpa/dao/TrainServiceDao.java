/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.dao;
import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.TrainService;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:  车次服务Dao
 *
 * @author 杨超凡 created on 2017/11/30
 */
@Repository
public class TrainServiceDao extends BaseDao<TrainService,TrainService>{
    /**
     * what: 车次服务新增
     *
     * @param trainService 车次服务model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainService trainService) {
        String sql = "insert into t_train_service VALUES (seq_t_train_service.nextval,:trainId,:serviceCode,:serviceName,:ljdm,:unit,:price,:orderIndex,:count)";
        return insert(sql,trainService);
    }

    /**
     * what: 车次服务删除
     *
     * @param id 车次服务id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int delete(Integer id){
        String sql = "delete from t_train_service where id = ?";
        return delete(sql,id);
    }

    /**
     * what: 车次服务修改
     *
     * @param trainService 车次服务model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int update(TrainService trainService){
        String sql = "update t_train_service set TRAIN_ID=:trainId,SERVICE_CODE=:serviceCode,SERVICE_NAME=:serviceName,LJDM=:ljdm,UNIT=:unit,PRICE=:price,COUNT=:count,ORDER_INDEX=:orderIndex where id=:id";
        return update(sql,trainService);
    }

    /**
     * what: 车次服务列表
     *
     * @return 车次服务列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public List<TrainService> lsitAll(Integer trainId){
        String sql = "select ID,TRAIN_ID,SERVICE_CODE,SERVICE_NAME,UNIT,PRICE,ORDER_INDEX,COUNT," +
                "(select b.NAME from t_dic_bureau b where b.LJDM=t.LJDM) ljdm" +
                " from t_train_service t where TRAIN_ID=?";
        sql += " order by order_index desc";
        return list(sql,trainId);
    }

    public int deleteByTrainId(int trainId) {
        String sql = "delete from t_train_service where train_id = ?";
        return delete(sql,trainId);
    }

    public List<TrainService> copy(Integer trainId){
        String sql = "select * from t_train_service t where TRAIN_ID=?";
        sql += " order by order_index desc";
        return list(sql,trainId);
    }
}
