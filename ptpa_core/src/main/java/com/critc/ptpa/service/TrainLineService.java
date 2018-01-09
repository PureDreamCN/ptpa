/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Web
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.TrainLineDao;
import com.critc.ptpa.model.TrainLine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:  车次线路区段Service
 *
 * @author 杨超凡 created on 2017/11/29
 */
@Service
public class TrainLineService {
    @Autowired
    TrainLineDao trainLineDao;

    /**
     * what: 车次线路区段新增
     *
     * @param trainLine 车次线路区段model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainLine trainLine){
        return trainLineDao.add(trainLine);
    }

    /**
     * what: 车次线路区段修改
     *
     * @param trainLine 车次线路区段model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int update(TrainLine trainLine,String param){
        return trainLineDao.update(trainLine,param);
    }

    /**
     * what: 车次线路区段删除
     *
     * @param trainLine 车次线路区段id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int delete(TrainLine trainLine){
        return trainLineDao.delete(trainLine.getId());
    }

    /**
     * what: 车次线路区段删除
     *
     * @param trainId 车次id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int deleteByTrainId(int trainId){
        return trainLineDao.deleteByTrainId(trainId);
    }

    /**
     * what: 车次线路区段列表
     *
     * @param trainId 车次线路区段id
     * @return 车次线路区段列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public List<TrainLine> listAll(Integer trainId){
        return trainLineDao.listAll(trainId);
    }
}
