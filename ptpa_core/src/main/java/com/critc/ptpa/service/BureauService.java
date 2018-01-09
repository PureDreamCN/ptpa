/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.service;

import com.critc.ptpa.dao.BureauDao;
import com.critc.ptpa.model.Bureau;
import com.critc.util.model.ComboboxVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:    路局Service
 *
 * @author 郭飞 created on 2017/11/24
 */
@Service
public class BureauService {
    /**
     * 路局dao
     */
    @Autowired
    private BureauDao bureauDao;

    /**
     * 获取所有路局信息
     * @return List
     * @author 郭飞 created on 2017/11/24
     */
    public List<Bureau> list(){
        return bureauDao.list();
    }
    /**
     * 生成路局下拉框-简称
     * @return List
     * @author 郭飞 created on 2017/11/27
     */
    public List<ComboboxVO> listbureauComboToShortName(){ return bureauDao.listbureauComboToShortName(); }
    /**
     * 生成路局下拉框-全称
     * @return List
     * @author 郭飞 created on 2017/11/27
     */
    public List<ComboboxVO> listbureauComboToName(){ return bureauDao.listbureauComboToName(); }
    /**
     * 通过路局代码获得名称
     * @param ljdm
     * @return String
     * @author 郭飞 created on 2017/11/28
     */
    public String getNameByLjdm(String ljdm){ return bureauDao.getNameByLjdm(ljdm); }
    /**
     * 通过名称获得路局代码
     * @param name
     * @return String
     * @author 郭飞 created on 2017/11/28
     */
    public String getLjdmByName(String name){  return bureauDao.getLjdmByName(name); }
    /**
     * 新增路局信息
     * @param bureau 路局实体类
     * @return int
     * @author 郭飞 created on 2017/11/29
     */
    public int add(Bureau bureau) { return bureauDao.add(bureau); }
    /**
     * 获取单个路局信息
     * @param ljdm ljdm
     * @return Bureau
     * @author 郭飞 created on 2017/11/29
     */
    public Bureau getBureau(String ljdm){ return bureauDao.getBureau(ljdm); }
    /**
     * 删除路局信息
     * @param ljdm 路局代码
     * @return int
     * @author 郭飞 created on 2017/11/29
     */
    public int delete(String ljdm){ return bureauDao.delete(ljdm); }
    /**
     * 修改路局
     * @param bureau 路局实体
     * @param ljdm 路局代码
     * @return int
     * @author 郭飞 created on 2017/11/29
     */
    public int update(Bureau bureau, String ljdm){ return bureauDao.update(bureau, ljdm); }
}
