/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.service;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.dao.TrainPsDao;
import com.critc.ptpa.model.TrainPs;
import com.critc.ptpa.vo.TrainPsVO;
import com.critc.util.string.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:    旅客统计service
 *
 * @author 郭飞 created on 2017/12/1
 */
@Service
public class TrainPsService {

    /**
     * 客车统计dao
     */
    @Autowired
    private TrainPsDao trainPsDao;
    /**
     * 全局参数配置
     */
    @Autowired
    private PubConfig pubConfig;

    /**
     * 获取客车信息
     * @param trainPsVO 条件类
     * @return List
     * @author 郭飞 created on 2017/12/1
     */
    public List<TrainPs> list(TrainPsVO trainPsVO){ return trainPsDao.list(trainPsVO); }

    /**
     * 获取客车信息总数
     * @param trainPsVO 条件类
     * @return int
     * @author 郭飞 created on 2017/12/1
     */
    public  int count(TrainPsVO trainPsVO) { return trainPsDao.count(trainPsVO); }

    /**
     * 拼接查询路由
     * @param trainPsVO 客车统计信息查询条件类
     * @return String
     * @author 郭飞 created on 2017/11/30
     */
    public String createUrl(TrainPsVO trainPsVO) {
        String url = pubConfig.getDynamicServer() + "/dr/trainstatistic.htm?";
        if (StringUtil.isNotNullOrEmpty(trainPsVO.getCc())) {
            url += "&cc=" + trainPsVO.getCc();
        }

        if (StringUtil.isNotNullOrEmpty(trainPsVO.getDdjmc())) {
            url += "&ddjmc=" + trainPsVO.getDdjmc();
        }
        return url;
    }
    /**
     * 根据车次获取list
     * @param cc 车次
     * @return List
     * @author 郭飞 created on 2017/12/12
     */
    public List<TrainPs> getTrainPsByCc(String cc){ return trainPsDao.getTrainPsByCc(cc); }

}
