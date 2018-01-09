/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.TrainHumanResourceDao;
import com.critc.ptpa.model.TrainHumanResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:   车次人力配置Service
 *
 * @author 杨超凡 created on 2017/11/29
 */
@Service
public class TrainHumanResourceService {
    @Autowired
    TrainHumanResourceDao trainHumanResourceDao;

    /**
     * what: 车次人力配置新增
     *
     * @param trainHumanResource 车次人力配置model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainHumanResource trainHumanResource){
        return trainHumanResourceDao.add(trainHumanResource);
    }

    /**
     * what: 车次人力配置修改
     *
     * @param trainHumanResource 车次人力配置model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int update(TrainHumanResource trainHumanResource){
        return trainHumanResourceDao.update(trainHumanResource);
    }

    /**
     * what: 车次人力配置删除
     *
     * @param trainHumanResource 车次人力配置id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int delete(TrainHumanResource trainHumanResource){
        return trainHumanResourceDao.delete(trainHumanResource.getId());
    }

    /**
     * what: 车次人力配置删除
     *
     * @param trainId 车次id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int deleteByTrainId(int trainId){
        return trainHumanResourceDao.deleteByTrainId(trainId);
    }

    /**
     * what: 车次人力配置列表
     *
     * @return 车次人力配置列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
     public List<TrainHumanResource> listAll(Integer trainId){
        return trainHumanResourceDao.lsitAll(trainId);
     }

    /**
     *
     * what: 根据路局代码和人力资源类型查询. <br/>
     *
     * @param ljdm ljdm
     * @param humanResourceTypeCode humanResourceTypeCode
     * @return 返回
     *
     * @author 刘正荣 created on 2017年11月29日
     */
    public List<TrainHumanResource> getByLjdmAndHumanResourceTypeCode(String ljdm, String humanResourceTypeCode) {
        return trainHumanResourceDao.getByLjdmAndHumanResourceTypeCode(ljdm, humanResourceTypeCode);
    }

    public List<TrainHumanResource> copy(Integer trainId){
        return trainHumanResourceDao.copy(trainId);
    }
}
