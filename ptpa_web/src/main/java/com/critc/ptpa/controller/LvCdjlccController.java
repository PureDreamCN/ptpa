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

import com.critc.ptpa.model.LvCdjlcc;
import com.critc.ptpa.service.LvCdjlccService;
import com.critc.ptpa.vo.LvCdjlccSearchVO;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;

/**
 * what: 机辆部车底交路车次Controller. <br/>
 * 
 * @author 刘正荣 created on 2017年11月24日
 */
@Controller
@RequestMapping("/lv/cdjlcc")
public class LvCdjlccController {

	@Autowired
	private LvCdjlccService lvCdjlccService;

	/**
	 * 
	 * what: 跳转到index页面. <br/>
	 * 
	 * @param request request
	 * @param lvCdjlccSearchVO lvCdjlccSearchVO
	 * @return 跳转到index页面
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, LvCdjlccSearchVO lvCdjlccSearchVO) {
		ModelAndView mv = new ModelAndView();
		String url = "";
		List<LvCdjlcc> list = lvCdjlccService.list(lvCdjlccSearchVO);

		// 获取查询总数
		int recordCount = lvCdjlccService.count(lvCdjlccSearchVO);
		// 定义分页对象
		PageNavigate pageNavigate = new PageNavigate(url, lvCdjlccSearchVO.getPageIndex(), recordCount);
		mv.addObject("list", list);
		mv.setViewName("/lv/cdjlcc/index");

		// 设置分页的变量
		mv.addObject("pageNavigate", pageNavigate);
		// 设置返回url
		BackUrlUtil.createBackUrl(mv, request, url);
		return mv;
	}

}
