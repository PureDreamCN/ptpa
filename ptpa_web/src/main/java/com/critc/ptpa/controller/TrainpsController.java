/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.controller;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.TrainStatistic;
import com.critc.ptpa.service.BureauService;
import com.critc.ptpa.service.TrainStatisticService;
import com.critc.ptpa.vo.TrainStatisticVO;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * what:    客车统计controller
 *
 * @author 郭飞 created on 2017/11/30
 */
@Controller
@RequestMapping("/dr")
public class TrainpsController {

    /**
     * 旅客统计service
     */
    @Autowired
    private TrainStatisticService trainStatisticService;
    /**
     * 全局参数配置
     */
    @Autowired
    private PubConfig pubConfig;
    /**
     * 路局service
     */
    @Autowired
    private BureauService bureauService;

    /**
     * 首页
     * @param request request
     * @param response response
     * @param trainStatisticVO 条件类
     * @return ModelAndView
     * @author 郭飞 created on 2017/11/30
     */
    @RequestMapping("/trainps")
    public ModelAndView trainps(HttpServletRequest request, HttpServletResponse response, TrainStatisticVO trainStatisticVO){

        ModelAndView mv = new ModelAndView();

        List<TrainStatistic> list = trainStatisticService.list(trainStatisticVO);
        int recordCount = trainStatisticService.count(trainStatisticVO);
        String url = trainStatisticService.createUrl(trainStatisticVO);
        PageNavigate pageNavigate = new PageNavigate(url, trainStatisticVO.getPageIndex(),trainStatisticVO.getPageSize(), recordCount);
        String url2 = pubConfig.getDynamicServer() + "/dr/trainps.htm?";

        mv.addObject("trainStatisticVO",trainStatisticVO);
        mv.addObject("list",list);
        // 设置分页的变量
        mv.addObject("pageNavigate", pageNavigate);
        mv.addObject("backUrl", StringUtil.encodeUrl(url2));
        mv.setViewName("dr/trainPS/index");
        return mv;
    }

    /**
     *跳转到新增页面
     * @param request request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/11/30
     */
    @RequestMapping("/toAdd")
    public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response, TrainStatisticVO trainStatisticVO){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("dr/trainPS/add");
        mv.addObject("trainStatisticVO",trainStatisticVO);
        mv.addObject("listBureau",bureauService.listbureauComboToShortName());
        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }
    /**
     * 修改旅客统计信息
     * @param request request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/11/30
     */
    @RequestMapping("/toUpdate")
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        String id = request.getParameter("id");
        TrainStatisticVO trainStatisticVO = new TrainStatisticVO();
        trainStatisticVO.setId(id);
        List<TrainStatistic> list = trainStatisticService.list(trainStatisticVO);
        mv.addObject("list",list);
        mv.addObject("stationSearchVo",trainStatisticVO);
        mv.addObject("listBureau",bureauService.listbureauComboToShortName());
        mv.setViewName("dr/trainPS/update");
        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }

}
