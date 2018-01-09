/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.TrainVehicleSeatDao;
import com.critc.ptpa.model.TrainVehicleSeat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:   车次编组车辆席位配置Service <br/>
 *
 * @author 杨超凡 created on 2017/12/6
 */
@Service
public class TrainVehicleSeatService {
    @Autowired
    TrainVehicleSeatDao trainVehicleSeatDao;

    /**
     * what:  车次编组车辆席位配置新增  <br/>
     *
     * @param trainVehicleSeat 车次编组车辆席位配置model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/6
     */
    public int add(TrainVehicleSeat trainVehicleSeat){
        return trainVehicleSeatDao.add(trainVehicleSeat);
    }

    /**
     * what:  车次编组车辆席位配置删除 <br/>
     *
     * @param trainVehicleId 车次编组车辆席位配置model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/6
     */
    public int delete(Integer trainVehicleId){
        return trainVehicleSeatDao.delete(trainVehicleId);
    }

    public List<TrainVehicleSeat> listAll(Integer trainVehicleId) {
        return trainVehicleSeatDao.listAll(trainVehicleId);
    }
}
