/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.controller;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.Railway;
import com.critc.ptpa.service.RailwayService;
import com.critc.ptpa.vo.RailwaySearchVO;
import com.critc.util.code.GlobalCode;
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
 * what:  线路controller
 *
 * @author 郭飞 created on 2017/11/24
 */
@Controller
@RequestMapping("railway")
public class RailwayController {

    /**
     * 线路service
     */
    @Autowired
    private RailwayService railwayService;
    /**
     * 全局参数配置
     */
    @Autowired
    private PubConfig pubConfig;
    /**
     * 线路首页
     * @param request request
     * @param response response
     * @param railwaySearchVO 线路查询条件类
     * @return ModelAndView
     */
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response,RailwaySearchVO railwaySearchVO){
        String url = railwayService.createUrl(railwaySearchVO);
        railwaySearchVO.setPageSize(20);
        int recordCount = railwayService.count(railwaySearchVO);
        List<Railway> list =  railwayService.list(railwaySearchVO);
        ModelAndView mv = new ModelAndView();
        PageNavigate pageNavigate = new PageNavigate(url, railwaySearchVO.getPageIndex(),railwaySearchVO.getPageSize(), recordCount);
        String backUrl = pubConfig.getDynamicServer() + "/railway/index.htm?";
        mv.addObject("list",list);
        // 设置分页的变量
        mv.addObject("pageNavigate", pageNavigate);
        mv.setViewName("dic/railway/index");
        mv.addObject("backUrl", StringUtil.encodeUrl(backUrl));
        return mv;
    }

    /**
     * 跳转至新增线路
     * @param request request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/11/28
     */
    @RequestMapping("/toAdd")
    public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("dic/railway/add");
        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }

    /**
     * 新增线路
     * @param request request
     * @param response response
     * @param railway railway
     * @return String
     */
    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response, Railway railway){
        int flag = railwayService.add(railway);
        if (flag == 0) {
            // msg=" + StringUtil.encodeUrl("线路新增失败");
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        } else {
            // msg=" + StringUtil.encodeUrl("线路新增成功");
            return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
        }
    }
    /**
     * 跳转至修改线路
     * @param request request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/11/28
     */
    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response,String xldm){
        ModelAndView mv = new ModelAndView();
        Railway railway =  railwayService.getRailwayByXldm(xldm);
        mv.addObject("railway",railway);
        mv.setViewName("dic/railway/update");
        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }

    /**
     * 线路修改
     * @param request request
     * @param response response
     * @param railway railway
     * @param oldXldm Xldm
     * @return String
     */
    @RequestMapping("/update")
    public String update(HttpServletRequest request, HttpServletResponse response, Railway railway, String oldXldm){
        int flag = railwayService.update(railway, oldXldm);
        if (flag == 0) {
            // 线路修改失败
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        } else {
            // 线路修改成功
            return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
        }
    }

    /**
     * 线路共享页面
     * @param request request
     * @param response response
     * @param railwaySearchVO 条件类
     * @return ModelAndView
     * @author 郭飞 created on 2017/11/30
     */
    @RequestMapping("/commonRailway")
    public ModelAndView commonRailway(HttpServletRequest request, HttpServletResponse response,RailwaySearchVO railwaySearchVO){
        String url = railwayService.createUrl(railwaySearchVO);
        railwaySearchVO.setPageSize(20);
        int recordCount = railwayService.count(railwaySearchVO);
        List<Railway> list =  railwayService.list(railwaySearchVO);
        ModelAndView mv = new ModelAndView();
        PageNavigate pageNavigate = new PageNavigate(url, railwaySearchVO.getPageIndex(),railwaySearchVO.getPageSize(), recordCount);
        mv.addObject("list",list);
        mv.addObject("trainId",request.getParameter("trainId"));
        mv.addObject("lineId",request.getParameter("lineId"));
        mv.addObject("backCode",request.getParameter("backCode"));
        // 设置分页的变量
        mv.addObject("pageNavigate", pageNavigate);
        mv.setViewName("dic/railway/commonRailway");
        return mv;
    }

    /**
     * 删除线路
     * @param request request
     * @param response response
     * @param xldm xldm
     * @return String
     */
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request, HttpServletResponse response, String xldm) {
        int flag = railwayService.delete(xldm);
        if (flag == 0) {
            // 删除失败
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        } else {
            // 删除成功
            return "forward:/success.htm?resultCode=" + GlobalCode.DELETE_SUCCESS;
        }
    }

}
