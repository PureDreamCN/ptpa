/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.TrainVehicleMaintain;
import org.springframework.stereotype.Repository;

/**
 * what:    车次车辆类型维修Dao <br/>
 *
 * @author 杨超凡 created on 2017/12/6
 */
@Repository
public class TrainVehicleMaintainDao extends BaseDao<TrainVehicleMaintain,TrainVehicleMaintain>{
    /**
     * what:    车次车辆类型维修新增 <br/>
     *
     * @param trainVehicleMaintain 车次车辆类型维修model
     *
     * @return
     *
     * @author 杨超凡 created on 2017/12/6
     */
    public int add(TrainVehicleMaintain trainVehicleMaintain){
        String sql = "insert into t_train_vehiclemaintain VALUES (seq_t_train_vehiclemaintain.nextval,:trainVehicleId,:vehicleMaintainTypeCode,:vehicleMaintainTypeName,:charge,:price,:orderIndex)";
        return insertForId(sql,trainVehicleMaintain,"id");
    }

    /**
     * what:  车次车辆类型维修删除 <br/>
     *
     * @param trainVehicleId 车辆编组ID
     *
     * @return
     *
     * @author 杨超凡 created on 2017/12/6
     */
    public int delete(Integer trainVehicleId){
        String sql = "delete from t_train_vehiclemaintain where train_vehicle_id = ?";
        return delete(sql,trainVehicleId);
    }

}
