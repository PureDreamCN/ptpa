/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.TrainVehicleDao;
import com.critc.ptpa.model.TrainVehicle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * what: 列车编组Service <br/>
 *
 * @author 杨超凡 created on 2017/12/6
 */
@Service
public class TrainVehicleService {
    @Autowired
    TrainVehicleDao trainVehicleDao;
    /**
     * what: 列车编组新增
     *
     * @param trainVehicle 列车编组model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainVehicle trainVehicle){
        return trainVehicleDao.add(trainVehicle);
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
        return trainVehicleDao.update(trainVehicle);
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
        return trainVehicleDao.delete(id);
    }

    /**
     * what: 列车编组删除
     *
     * @param trainId 列车id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int deleteByTrainId(Integer trainId){
        return trainVehicleDao.deleteByTrainId(trainId);
    }

    /**
     * what: 列车编组列表
     *
     * @return 列车编组列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public List<TrainVehicle> listAll(Integer trainId){
        return trainVehicleDao.listAll(trainId);
    }
    public int countVehicle(int trainId) {
        return trainVehicleDao.countVehicle(trainId);
    }
}
