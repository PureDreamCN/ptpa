/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.TrainVehicleMaintainDao;
import com.critc.ptpa.model.TrainVehicleMaintain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * what:   车次车辆类型维修Service <br/>
 *
 * @author 杨超凡 created on 2017/12/6
 */
@Service
public class TrainVehicleMaintainService {
    @Autowired
    TrainVehicleMaintainDao trainVehicleMaintainDao;

    /**
     * what:  车次车辆类型维修新增  <br/>
     *
     * @param trainVehicleMaintain 车次车辆类型维修model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/6
     */
    public int add(TrainVehicleMaintain trainVehicleMaintain){
        return trainVehicleMaintainDao.add(trainVehicleMaintain);
    }

    /**
     * what:  车次车辆类型维修删除 <br/>
     *
     * @param trainVehicleId 车次车辆类型维修model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/6
     */
    public int delete(Integer trainVehicleId){
        return trainVehicleMaintainDao.delete(trainVehicleId);
    }

}
