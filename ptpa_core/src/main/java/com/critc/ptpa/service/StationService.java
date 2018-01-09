/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.service;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.dao.StationDao;
import com.critc.ptpa.model.Station;
import com.critc.ptpa.vo.StationSearchVO;
import com.critc.util.string.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * what:    车站service
 *
 * @author 郭飞 created on 2017/11/24
 */
@Service
public class StationService {

    /**
     * 车站dao
     */
    @Autowired
    private StationDao stationDao;
    /**
     * 系统配置类
     */
    @Autowired
    private PubConfig pubConfig;


    /**
     * 获取所有车站信息
     *
     * @return List
     * @author 郭飞 created on 2017/11/24
     */
    public List<Station> list(StationSearchVO stationSearchVo) {
        return stationDao.list(stationSearchVo);
    }

    /**
     * 获取所有车站信息 为下拉框 提供数据
     *
     * @return List
     * @author 郭飞 created on 2017/11/28
     */
    public List<Map<String, Object>> listStationCombo() {
        return stationDao.listStationCombo();
    }

    /**
     * 获取记录总数
     *
     * @return int
     * @author 郭飞 created on 2017/11/24
     */
    public int count(StationSearchVO stationSearchVO) {
        return stationDao.count(stationSearchVO);
    }

    /**
     * 拼接查询路由
     *
     * @param stationSearchVo 车站查询条件类
     * @return String
     * @author 郭飞 created on 2017/11/24
     */
    public String createUrl(StationSearchVO stationSearchVo) {
        String url = pubConfig.getDynamicServer() + "/station/index.htm?";
        if (StringUtil.isNotNullOrEmpty(stationSearchVo.getCzdm())) {
            url += "&czdm=" + stationSearchVo.getCzdm();
        }

        if (StringUtil.isNotNullOrEmpty(stationSearchVo.getLjdm())) {
            url += "&ljdm=" + stationSearchVo.getLjdm();
        }

        if (StringUtil.isNotNullOrEmpty(stationSearchVo.getName())) {
            url += "&name=" + stationSearchVo.getName();
        }

        if (StringUtil.isNotNullOrEmpty(stationSearchVo.getPinyin())) {
            url += "&pinyin=" + stationSearchVo.getPinyin();
        }

        return url;
    }

    /**
     * 通过车站代码获得名称
     *
     * @param czdm
     * @return String
     * @author 郭飞 created on 2017/11/28
     */
    public String getNameByCzdm(String czdm) {
        return stationDao.getNameByCzdm(czdm);
    }

    /**
     * 通过车站名称获得车站代码
     *
     * @param name
     * @return String
     * @author 郭飞 created on 2017/11/28
     */
    public String getCzdmByName(String name) {
        return stationDao.getCzdmByName(name);
    }

    /**
     * 修改车站
     *
     * @param station station
     * @param czdm    czdm
     * @return int
     * @author 郭飞 created on 2017/12/19
     */
    public int update(Station station, String czdm) {
        return stationDao.update(station, czdm);
    }

    /**
     * 新增车站
     * @param station station
     * @return int
     */
    public int add(Station station){ return stationDao.add(station); }

    /**
     * 删除车站
     * @param czdm czdm
     * @return int
     */
    public int delete(String czdm){ return stationDao.delete(czdm);}
}
