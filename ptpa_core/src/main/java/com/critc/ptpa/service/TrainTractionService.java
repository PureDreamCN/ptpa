/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Web
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.TrainTractionDao;
import com.critc.ptpa.model.TrainTraction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:  车次牵引区段Service
 *
 * @author 杨超凡 created on 2017/12/3
 */
@Service
public class TrainTractionService {
    /**
     * 车次牵引区段Dao
     */
    @Autowired
    TrainTractionDao trainTractionDao;

    /**
     * what: 车次牵引区段新增
     *
     * @param trainTraction 车次牵引区段model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainTraction trainTraction){
        return trainTractionDao.add(trainTraction);
    }

    /**
     * what: 车次牵引区段修改
     *
     * @param trainTraction 车次牵引区段model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int update(TrainTraction trainTraction,String param){
        return trainTractionDao.update(trainTraction,param);
    }

    /**
     * what: 车次牵引区段删除
     *
     * @param trainTraction 车次牵引区段id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int delete(TrainTraction trainTraction){
        return trainTractionDao.delete(trainTraction.getId());
    }

    /**
     * what: 车次牵引区段列表
     *
     * @return 车次牵引区段列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public List<TrainTraction> listAll(Integer trainId){
        return trainTractionDao.listAll(trainId);
    }

    /**
     * what: 车次牵引区段删除
     *
     * @param trainId 车次id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int deleteByTrainId(int trainId){
        return trainTractionDao.deleteByTrainId(trainId);
    }
}
