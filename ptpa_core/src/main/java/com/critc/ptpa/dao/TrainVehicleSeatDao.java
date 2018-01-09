/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.TrainVehicleSeat;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:   车次编组车辆席位配置Dao <br/>
 *
 * @author 杨超凡 created on 2017/12/6
 */
@Repository
public class TrainVehicleSeatDao extends BaseDao<TrainVehicleSeat,TrainVehicleSeat> {
    /**
     * what:    车次编组车辆席位配置新增 <br/>
     *
     * @param trainVehicleSeat 车次编组车辆席位配置model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/6
     */
    public int add(TrainVehicleSeat trainVehicleSeat){
        String sql = "insert into t_train_vehicleseat VALUES (seq_t_train_vehicleseat.nextval,:trainVehicleId,:seatTypeCode,:seatTypeName,:capacity,:orderIndex)";
        return insertForId(sql,trainVehicleSeat,"id");
    }

    /**
     * what:  车次编组车辆席位配置删除 <br/>
     *
     * @param trainVehicleId 车辆编组ID
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/6
     */
    public int delete(Integer trainVehicleId){
        String sql = "delete from t_train_vehicleseat where train_vehicle_id = ?";
        return delete(sql,trainVehicleId);
    }

    /**
     * what:  车次编组车辆席位配置删除 <br/>
     *
     * @param trainVehicleId 车辆编组ID
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/11
     */
    public List<TrainVehicleSeat> listAll(Integer trainVehicleId) {
        String sql = "select * from t_train_vehicleseat where TRAIN_VEHICLE_ID = ?";
        return list(sql,trainVehicleId);
    }
}
