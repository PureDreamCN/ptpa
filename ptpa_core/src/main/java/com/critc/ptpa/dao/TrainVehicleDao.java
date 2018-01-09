/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.TrainVehicle;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:  列车编组Dao<br/>
 *
 * @author 杨超凡 created on 2017/12/6
 */
@Repository
public class TrainVehicleDao extends BaseDao<TrainVehicle,TrainVehicle> {
    /**
     * what: 列车编组新增
     *
     * @param trainVehicle 列车编组model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainVehicle trainVehicle) {
        String sql = "insert into t_train_vehicle VALUES (seq_t_train_vehicle.nextval,:trainId,:cxCode,:cxName,:czCode,:czName,:lxCode,:lxName,:purchasePrice,:averageKilometer,:depreciationPeriod,:deperciationResidualRate" +
                ",:deperciationRate,:deperciationPkRate,:deperciationPrice,:orderIndex,:maintainAdvancePrice,:maintainNormalPrice)";
        return insertForId(sql,trainVehicle,"id");
    }

    /**
     * what: 列车编组删除
     *
     * @param id 列车编组id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int delete(Integer id){
        String sql = "delete from t_train_vehicle where id = ?";
        return delete(sql,id);
    }

    /**
     * what: 列车编组修改
     *
     * @param trainVehicle 列车编组model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int update(TrainVehicle trainVehicle){
        String sql = "update t_train_vehicle set CX_CODE=:cxCode,CX_NAME=:cxName,CZ_CODE=:czCode,CZ_NAME=:czName,LX_CODE=:lxCode,LX_NAME=:lxName,PURCHASE_PRICE=:purchasePrice,AVERAGE_KILOMETER=:averageKilometer,DEPRECIATION_PERIOD=:depreciationPeriod,DEPERCIATION_RESIDUAL_RATE=:deperciationResidualRate,DEPERCIATION_RATE=:deperciationRate,DEPERCIATION_PK_RATE=:deperciationPkRate,DEPERCIATION_PRICE=:deperciationPrice,MAINTAIN_PRICE=:maintainPrice,ORDER_INDEX=:orderIndex where ID=:id";
        return update(sql,trainVehicle);
    }

    /**
     * what: 列车编组列表
     *
     * @return 列车编组列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public List<TrainVehicle> listAll(Integer trainId){
        String sql = "select * from t_train_vehicle where train_id = ?";
        sql += " order by ORDER_INDEX asc";
        return list(sql,trainId);
    }

    public int deleteByTrainId(Integer trainId) {
        String sql = "delete from t_train_vehicle where train_id = ?";
        return delete(sql,trainId);
    }

    public int countVehicle(int trainId) {
        String sql = "select count(*) from t_train_vehicle where train_id = ?";
        return count(sql,trainId);
    }
}
