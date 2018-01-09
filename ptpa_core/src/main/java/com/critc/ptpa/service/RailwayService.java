/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.service;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.dao.RailwayDao;
import com.critc.ptpa.model.Railway;
import com.critc.ptpa.vo.RailwaySearchVO;
import com.critc.util.string.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:   线路service
 *
 * @author 郭飞 created on 2017/11/24
 */
@Service
public class RailwayService {

    /**
     * 线路dao
     */
    @Autowired
    private RailwayDao railwayDao;
    /**
     * 系统配置类
     */
    @Autowired
    private PubConfig pubConfig;

    /**
     * 获取所有线路
     * @param railwaySearchVO 线路条件类
     * @return List
     * @author 郭飞 created on 2017/11/24
     */
    public List<Railway> list(RailwaySearchVO railwaySearchVO){
        return  railwayDao.list(railwaySearchVO);
    }

    /**
     * 获取所有记录数
     * @return int
     * @author 郭飞 created on 2017/11/24
     */
    public  int count(RailwaySearchVO railwaySearchVO){
        return railwayDao.count(railwaySearchVO);
    }

    /**
     * 生成分页url
     * @param railwaySearchVO 线路查询条件类
     * @return String
     * @author 郭飞 created on 2017/11/24
     */
    public String createUrl(RailwaySearchVO railwaySearchVO) {
        String url = pubConfig.getDynamicServer() + "/station/index.htm?";
        if (StringUtil.isNotNullOrEmpty(railwaySearchVO.getXldm())) {
            url += "&xldm=" + railwaySearchVO.getXldm();
        }

        if (StringUtil.isNotNullOrEmpty(railwaySearchVO.getName())) {
            url += "&name=" + railwaySearchVO.getName();
        }

        if (StringUtil.isNotNullOrEmpty(railwaySearchVO.getBeginCzdm())) {
            url += "&beginCzdm=" + railwaySearchVO.getBeginCzdm();
        }

        if (StringUtil.isNotNullOrEmpty(railwaySearchVO.getEndCzdm())) {
            url += "&endCzdm=" + railwaySearchVO.getEndCzdm();
        }

        return url;
    }
    /**
     * 获取线路名称
     * @param xldm 线路代码
     * @return String
     * @author 郭飞 created on 2017/12/4
     */
    public String getNameByXldm(String xldm){
        return railwayDao.getNameByXldm(xldm);
    }

    /**
     * x新增线路
     * @param railway railway
     * @return int
     */
    public int add(Railway railway){ return railwayDao.add(railway); }

    /**
     * 修改线路
     * @param railway railway
     * @param xldm xldm
     * @return int
     */
    public int update(Railway railway, String xldm){ return railwayDao.update(railway, xldm);}

    /**
     *删除线路
     * @param xldm xldm
     * @return int
     */
    public int delete(String xldm){ return railwayDao.delete(xldm);}

    /**
     * 获取单个线路
     * @param xldm xldm
     * @return Railway
     */
    public  Railway getRailwayByXldm(String xldm){ return railwayDao.getRailwayByXldm(xldm); }
}
