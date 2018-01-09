/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Web
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.TrainCeDao;
import com.critc.ptpa.model.TrainCe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:   车次接触网区段Service
 *
 * @author 杨超凡 created on 2017/12/3
 */
@Service
public class TrainCeService {
    @Autowired
    TrainCeDao trainCeDao;

    /**
     * what: 车次接触网区段新增
     *
     * @param trainCe 车次接触网区段model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainCe trainCe){
        return trainCeDao.add(trainCe);
    }

    /**
     * what: 车次接触网区段修改
     *
     * @param trainCe 车次接触网区段model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int update(TrainCe trainCe,String param){
        return trainCeDao.update(trainCe,param);
    }

    /**
     * what: 车次接触网区段删除
     *
     * @param trainCe 车次接触网区段id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int delete(TrainCe trainCe){
        return trainCeDao.delete(trainCe.getId());
    }

    /**
     * what: 车次接触网区段列表
     *
     * @param trainId 车次接触网区段id
     *
     * @return 车次接触网区段列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public List<TrainCe> listAll(Integer trainId){
        return trainCeDao.listAll(trainId);
    }

    public int deleteBytrainId(int trainId){
        return trainCeDao.deleteBytrainId(trainId);
    }
}
