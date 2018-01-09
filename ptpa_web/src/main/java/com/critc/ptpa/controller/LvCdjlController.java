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

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.LvCdjl;
import com.critc.ptpa.model.LvCdjlcl;
import com.critc.ptpa.service.LvCdjlService;
import com.critc.ptpa.service.LvCdjlclService;
import com.critc.ptpa.vo.LvCdjlSearchVO;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;

/**
 * what: 机辆部车底交路 Controller. <br/>
 * 
 * @author 刘正荣 created on 2017年11月28日
 */
@Controller
@RequestMapping("/lv/cdjl")
public class LvCdjlController {

	/**
	 * 配置
	 */
	@Autowired
	private PubConfig pubConfig;

	@Autowired
	private LvCdjlService lvCdjlService;

	@Autowired
	private LvCdjlclService lvCdjlclService;

	/**
	 * 
	 * what: 跳转到index页面. <br/>
	 * 
	 * @param request
	 *            request
	 * @param lvCdjlSearchVO
	 *            lvCdjlSearchVO
	 * @return 跳转到index页面
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, LvCdjlSearchVO lvCdjlSearchVO) {
		ModelAndView mv = new ModelAndView();

		// 如果当前tranTypeCode为null,则设置为tab1的值
		if (StringUtil.isNullOrEmpty(lvCdjlSearchVO.getTrainTypeCode())) {
			lvCdjlSearchVO.setTrainTypeCode("1");
		}

		String url = createUrl(lvCdjlSearchVO);
		List<LvCdjl> list = lvCdjlService.list(lvCdjlSearchVO);

		// 获取查询总数
		int recordCount = lvCdjlService.count(lvCdjlSearchVO);
		// 定义分页对象
		PageNavigate pageNavigate = new PageNavigate(url, lvCdjlSearchVO.getPageIndex(), recordCount);
		mv.addObject("list", list);
		mv.setViewName("/lv/cdjl/index");
		// 设置分页的变量
		mv.addObject("pageNavigate", pageNavigate);
		mv.addObject("trainTypeCode", lvCdjlSearchVO.getTrainTypeCode());
		// 设置返回url
		BackUrlUtil.createBackUrl(mv, request, url);
		return mv;
	}

	/**
	 * 
	 * what: 设置返回的url. <br/>
	 * 
	 * @param lvCdjlSearchVO
	 *            lvCdjlSearchVO查询条件
	 * @return 返回拼接的url
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	private String createUrl(LvCdjlSearchVO lvCdjlSearchVO) {
		String url = pubConfig.getDynamicServer() + "/lv/cdjl/index.htm?";

		if (StringUtil.isNotNullOrEmpty(lvCdjlSearchVO.getCc())) {
			url += "&cc=" + lvCdjlSearchVO.getCc();
		}

		return url;
	}

	@RequestMapping("/toDetail")
	public ModelAndView toDetail(HttpServletRequest request, int id, String trainTypeCode) {
		ModelAndView mv = new ModelAndView();
		List<LvCdjlcl> list = lvCdjlclService.getByCdjlId(id);
		String backUrl = request.getParameter("backUrl");
		backUrl = backUrl.contains("pageIndex") ? backUrl.substring(backUrl.indexOf("pageIndex") + 10) : "0";
		mv.addObject("list", list);
		mv.setViewName("/lv/cdjl/detail");
		mv.addObject("trainTypeCode", trainTypeCode);
		mv.addObject("pageIndex", backUrl);
		return mv;
	}

}
