/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.controller;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.TrainPs;
import com.critc.ptpa.service.TrainPsService;
import com.critc.ptpa.vo.TrainPsVO;
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
 * what:客车统计
 *
 * @author 郭飞 created on 2017/12/1
 */
@Controller
@RequestMapping("/dr")
public class TrainStatisticController {

    /**
     * 客车统计service
     */
    @Autowired
    private TrainPsService trainPsService;
    /**
     * 全局参数配置
     */
    @Autowired
    private PubConfig pubConfig;

    @RequestMapping("/trainstatistic")
    public ModelAndView trainstatistic(HttpServletRequest request, HttpServletResponse response, TrainPsVO trainPsVO){
        ModelAndView mv = new ModelAndView();

        List<TrainPs> list = trainPsService.list(trainPsVO);
        int recordCount = trainPsService.count(trainPsVO);
        String url = trainPsService.createUrl(trainPsVO);
        PageNavigate pageNavigate = new PageNavigate(url, trainPsVO.getPageIndex(),trainPsVO.getPageSize(), recordCount);
        String url2 = pubConfig.getDynamicServer() + "/dr/trainstatistic.htm?";

        mv.addObject("trainPsVO",trainPsVO);
        mv.addObject("list",list);
        // 设置分页的变量
        mv.addObject("pageNavigate", pageNavigate);
        mv.addObject("backUrl", StringUtil.encodeUrl(url2));
        mv.setViewName("dr/trainStatistic/index");
        return mv;
    }

    /**
     *跳转到新增页面
     * @param request request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/12/4
     */
    @RequestMapping("/toTrainstatisticAdd")
    public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response, TrainPsVO trainPsVO){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("dr/trainStatistic/add");
        mv.addObject("trainPsVO",trainPsVO);
        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }

    /**
     * 修改客车统计信息
     * @param request request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/12/4
     */
    @RequestMapping("/toTrainstatisticUpdate")
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        String id = request.getParameter("id");
        TrainPsVO trainPsVO = new TrainPsVO();
        trainPsVO.setId(id);
        List<TrainPs> list = trainPsService.list(trainPsVO);
        mv.addObject("list",list);
        mv.addObject("trainPsVO",trainPsVO);
        mv.setViewName("dr/trainStatistic/update");
        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }
}
