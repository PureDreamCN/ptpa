/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_web
 */
package com.critc.ptpa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.ptpa.model.LvCdjlcl;
import com.critc.ptpa.service.LvCdjlclService;
import com.critc.ptpa.vo.LvCdjlclSearchVO;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;

/**
 * what: 机辆部车底交路编组车辆 Controller. <br/>
 * 
 * @author 刘正荣 created on 2017年11月24日
 */
@Controller
@RequestMapping("/lv/cdjlcl")
public class LvCdjlclController {

	@Autowired
	private LvCdjlclService lvCdjlclService;

	/**
	 * 
	 * what: 跳转到index页面. <br/>
	 * 
	 * @param request request
	 * @param lvCdjlclSearchVO lvCdjlclSearchVO
	 * @return 跳转到index页面
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, LvCdjlclSearchVO lvCdjlclSearchVO) {
		ModelAndView mv = new ModelAndView();
		String url = "";
		List<LvCdjlcl> list = lvCdjlclService.list(lvCdjlclSearchVO);

		// 获取查询总数
		int recordCount = lvCdjlclService.count(lvCdjlclSearchVO);
		// 定义分页对象
		PageNavigate pageNavigate = new PageNavigate(url, lvCdjlclSearchVO.getPageIndex(), recordCount);
		mv.addObject("list", list);
		mv.setViewName("/lv/cdjlcl/index");

		// 设置分页的变量
		mv.addObject("pageNavigate", pageNavigate);
		// 设置返回url
		BackUrlUtil.createBackUrl(mv, request, url);
		return mv;
	}

}
