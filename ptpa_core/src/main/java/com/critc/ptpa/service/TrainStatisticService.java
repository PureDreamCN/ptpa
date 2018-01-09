/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.service;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.dao.TrainStatisticDao;
import com.critc.ptpa.model.TrainStatistic;
import com.critc.ptpa.vo.TrainStatisticVO;
import com.critc.util.string.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:    客车统计service
 *
 * @author 郭飞 created on 2017/11/30
 */
@Service
public class TrainStatisticService {

    /**
     * 旅客统计dao
     */
    @Autowired
    private TrainStatisticDao trainStatisticDao;
    /**
     * 全局参数配置
     */
    @Autowired
    private PubConfig pubConfig;

    /**
     *  获取旅客统计信息
     * @param trainStatisticVO 查询条件类
     * @return List
     * @author 郭飞 created on 2017/11/30
     */
    public List<TrainStatistic> list(TrainStatisticVO trainStatisticVO){ return trainStatisticDao.list(trainStatisticVO); }

    /**
     * 获取记录总数
     * @return int
     * @author 郭飞 created on 2017/11/30
     */
    public  int count(TrainStatisticVO trainStatisticVO) { return trainStatisticDao.count(trainStatisticVO); }

    /**
     * 拼接查询路由
     * @param trainStatisticVO 旅客统计信息查询条件类
     * @return String
     * @author 郭飞 created on 2017/11/30
     */
    public String createUrl(TrainStatisticVO trainStatisticVO) {
        String url = pubConfig.getDynamicServer() + "/dr/trainps.htm?";
        if (StringUtil.isNotNullOrEmpty(trainStatisticVO.getCc())) {
            url += "&cc=" + trainStatisticVO.getCc();
        }

        if (trainStatisticVO.getStatisticDate()!=null) {
            url += "&statisticDate=" + trainStatisticVO.getStatisticDate();
        }
        return url;
    }
}
