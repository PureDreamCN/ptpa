/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.controller;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.Station;
import com.critc.ptpa.service.BureauService;
import com.critc.ptpa.service.StationService;
import com.critc.ptpa.vo.StationSearchVO;
import com.critc.ptpa.vo.TrainStatisticVO;
import com.critc.util.code.GlobalCode;
import com.critc.util.json.JsonUtil;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * what: 车站controller
 *
 * @author 郭飞 created on 2017/11/24
 */
@Controller
@RequestMapping("/station")
public class StationController {

    /**
     * 车站service
     */
    @Autowired
    private StationService stationService;
    /**
     * 路局service
     */
    @Autowired
    private BureauService bureauService;
    /**
     * 全局参数配置
     */
    @Autowired
    private PubConfig pubConfig;
    /**
     * 车站首页
     * @param request request
     * @param response response
     * @return  ModelAndView
     * @author 郭飞 created on 2017/11/24
     */
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, StationSearchVO stationSearchVo){

        int recordCount = stationService.count(stationSearchVo);
        String url = stationService.createUrl(stationSearchVo);
        stationSearchVo.setPageSize(20);
        List<Station> list = stationService.list(stationSearchVo);
        ModelAndView mv = new ModelAndView();
        PageNavigate pageNavigate = new PageNavigate(url, stationSearchVo.getPageIndex(),stationSearchVo.getPageSize(), recordCount);

        String backUrl = pubConfig.getDynamicServer() + "/station/index.htm?";
        mv.addObject("list",list);
        mv.addObject("stationSearchVo",stationSearchVo);
        // 设置分页的变量
        mv.addObject("pageNavigate", pageNavigate);
        mv.addObject("listBureau",bureauService.listbureauComboToShortName());
        mv.addObject("backUrl", StringUtil.encodeUrl(backUrl));
        mv.setViewName("dic/station/index");

        return mv;
    }

    /**
     *  车站自动补全
     * @param request request
     * @param response response
     * @author 郭飞 created on 2017/11/28
     */
    @RequestMapping("/getAutoComplteList")
    public  void getAutoComplteList(HttpServletRequest request, HttpServletResponse response){

        WebUtil.out(response, JsonUtil.toStr(stationService.listStationCombo()));
    }

    /**
     * 新增车站
     * @param request request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/11/28
     */
    @RequestMapping("/toAdd")
    public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response,StationSearchVO stationSearchVo){
        ModelAndView mv = new ModelAndView();
        mv.addObject("listBureau",bureauService.listbureauComboToShortName());
        mv.addObject("stationSearchVo",stationSearchVo);
        mv.setViewName("dic/station/add");
        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }

    /**
     * 新增车站
     * @param request request
     * @param response response
     * @param station station
     * @return String
     */
    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response, Station station){
        int flag = stationService.add(station);
        if (flag == 0) {
            // msg=" + StringUtil.encodeUrl("车站新增失败");
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        } else {
            // msg=" + StringUtil.encodeUrl("车站新增成功");
            return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
        }
    }
    /**
     * 修改车站
     * @param request request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/11/28
     */
    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response,StationSearchVO stationSearchVo){
        ModelAndView mv = new ModelAndView();
        List<Station> list = stationService.list(stationSearchVo);
        mv.addObject("list",list);
        mv.addObject("stationSearchVo",stationSearchVo);
        mv.addObject("trainStatisticVO",new TrainStatisticVO());
        mv.addObject("listBureau",bureauService.listbureauComboToShortName());
        mv.setViewName("dic/station/update");
        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }

    /**
     * 修改车站
     * @param request request
     * @param response response
     * @param station 车站实体类
     * @param oldCzdm oldCzdm
     * @return String
     */
    @RequestMapping("/update")
    public String update(HttpServletRequest request, HttpServletResponse response, Station station, String oldCzdm){
        int flag = stationService.update(station, oldCzdm);
        if (flag == 0) {
            // 车站修改失败
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        } else {
            // 车站修改成功
            return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
        }
    }

    /**
     * 删除车站
     * @param request request
     * @param response response
     * @param czdm czdm
     * @return String
     */
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request, HttpServletResponse response, String czdm) {
        int flag = stationService.delete(czdm);
        if (flag == 0) {
            // 删除失败
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        } else {
            // 删除成功
            return "forward:/success.htm?resultCode=" + GlobalCode.DELETE_SUCCESS;
        }
    }
}
