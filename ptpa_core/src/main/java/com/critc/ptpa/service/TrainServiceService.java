/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.TrainServiceDao;
import com.critc.ptpa.model.TrainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * what:  车次服务Serivce
 *
 * @author 杨超凡 created on 2017/11/30
 */
@Service
public class TrainServiceService {
    @Autowired
    TrainServiceDao trainServiceDao;
    /**
     * what: 车次服务新增
     *
     * @param trainService 车次服务model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainService trainService){
        return trainServiceDao.add(trainService);
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
        return trainServiceDao.update(trainService);
    }

    /**
     * what: 车次服务删除
     *
     * @param trainService 车次服务id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int delete(TrainService trainService){
        return trainServiceDao.delete(trainService.getId());
    }

    /**
     * what: 车次服务删除
     *
     * @param trainId 车次服务id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int deleteByTrainId(int trainId){
        return trainServiceDao.deleteByTrainId(trainId);
    }

    /**
     * what: 车次服务列表
     *
     * @return 车次服务列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public List<TrainService> listAll(Integer trainId){
        return trainServiceDao.lsitAll(trainId);
    }
    public List<TrainService> copy(Integer trainId){
        return trainServiceDao.copy(trainId);
    }
}
