/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.controller;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.Bureau;
import com.critc.ptpa.service.BureauService;
import com.critc.util.code.GlobalCode;
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
 * what:  路局controller
 *
 * @author 郭飞 created on 2017/11/24
 */
@Controller
@RequestMapping("/bureau")
public class BureauController {

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
     * 路局首页
     * @param request request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/11/24
     */
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        List<Bureau> list = bureauService.list();
        mv.addObject("list",list);
        mv.setViewName("dic/bureau/index");
        String url = pubConfig.getDynamicServer() + "/bureau/index.htm?";
        mv.addObject("backUrl", StringUtil.encodeUrl(url));

        return mv;
    }

    /**
     * 跳转到新增路局
     * @param request request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/11/28
     */
    @RequestMapping("/toAdd")
    public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("dic/bureau/add");
        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }
    /**
     * 新增路局
     * @param request request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/11/29
     */
    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response, Bureau bureau){
        int flag = bureauService.add(bureau);
        if (flag == 0) {
            // msg=" + StringUtil.encodeUrl("路局新增失败");
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        } else {
            // msg=" + StringUtil.encodeUrl("路局新增成功");
            return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
        }
    }
    /**
     * 跳转到修改路局
     * @param request request
     * @param response response
     * @return ModelAndView
     * @author 郭飞 created on 2017/11/28
     */
    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        String ljdm = request.getParameter("ljdm");
        mv.addObject("bureau", bureauService.getBureau(ljdm));
        mv.setViewName("dic/bureau/update");
        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }
    /**
     * 修改路局
     * @param request request
     * @param response response
     * @param bureau 路局实体类
     * @return String String
     * @author 郭飞 created on 2017/11/29
     */
    @RequestMapping("/update")
    public String update(HttpServletRequest request, HttpServletResponse response, Bureau bureau, String oldLjdm){
        int flag = bureauService.update(bureau, oldLjdm);
        if (flag == 0) {
            // 路局修改失败
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        } else {
            // 路局修改成功
            return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
        }
    }

    /**
     * 删除路局
     * @param request request
     * @param response response
     * @param ljdm ljdm
     * @return String
     * @author 郭飞 created on 2017/11/28
     */
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request, HttpServletResponse response, String ljdm) {
        int flag = bureauService.delete(ljdm);
        if (flag == 0) {
            // 删除失败
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
        } else {
            // 删除成功
            return "forward:/success.htm?resultCode=" + GlobalCode.DELETE_SUCCESS;
        }
    }



}
