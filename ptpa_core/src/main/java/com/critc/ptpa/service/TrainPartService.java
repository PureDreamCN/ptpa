/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Web
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.TrainPartDao;
import com.critc.ptpa.model.TrainPart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:  备品配置Service
 *
 * @author 杨超凡 created on 2017/12/4
 */
@Service
public class TrainPartService {
    @Autowired
    TrainPartDao trainPartDao;

    /**
     * what: 车次备品配置新增
     *
     * @param trainPart 车次备品配置model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/4
     */
    public int add(TrainPart trainPart){
        return trainPartDao.add(trainPart);
    }

    /**
     * what: 车次备品配置修改
     *
     * @param trainPart 车次备品配置model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/4
     */
    public int update(TrainPart trainPart){
        return trainPartDao.update(trainPart);
    }

    /**
     * what: 车次备品配置删除
     *
     * @param trainPart 车次备品配置id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/4
     */
    public int delete(TrainPart trainPart){
        return trainPartDao.delete(trainPart.getId());
    }
    /**
     * what: 车次备品配置删除
     *
     * @param trainId 车次id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/12/4
     */
    public int deleteByTrainId(int trainId){
        return trainPartDao.deleteByTrainId(trainId);
    }

    /**
     * what: 车次备品配置列表
     *
     * @return 车次备品配置列表信息
     *
     * @author 杨超凡 created on 2017/12/4
     */
    public List<TrainPart> listAll(Integer trainId){
        return trainPartDao.listAll(trainId);
    }
}
