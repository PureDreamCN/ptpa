/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_web
 */
package com.critc.ptpa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.PriceStationService;
import com.critc.ptpa.service.PriceStationServiceService;
import com.critc.sys.model.SysDic;
import com.critc.sys.service.SysDicService;
import com.critc.util.code.GlobalCode;
import com.critc.util.code.ReturnCodeUtil;
import com.critc.util.json.JsonUtil;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;

/**
 * what: 车站旅客服务清算单价Controller
 * 
 *
 * @author 李红 created on 2017年12月8日
 */
@RequestMapping("/price/stationservice")
@Controller
public class PriceStationServiceController {
	/**
	 * 车站旅客服务清算单价Service
	 */
	@Autowired
	private PriceStationServiceService priceStationServiceService;
	/**
	 * 字典Sevice
	 */
	@Autowired
	private SysDicService sysDicService;
	/**
	 * 全局参数配置
	 */
	@Autowired
	private PubConfig pubConfig;

	/**
	 * 
	 * what: 车站旅客服务清算单价首页
	 * 
	 * @param request request
	 * @param response response
	 * @return 车站旅客服务清算单价首页
	 *
	 * @author 李红 created on 2017年11月28日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		// 获取列表
		List<PriceStationService> list = priceStationServiceService.list();
		mv.addObject("list", list);
		mv.setViewName("/price/stationservice/index");
		String url = pubConfig.getDynamicServer() + "/price/stationservice/index.htm?";
		mv.addObject("backUrl", StringUtil.encodeUrl(url));
		return mv;

	}

	/**
	 * 
	 * what: 到新增车站旅客服务类别页面
	 * 
	 * @param request request
	 * @param response response
	 * @return 新增车站旅客服务类别页面
	 *
	 * @author 李红 created on 2017年12月11日
	 */
	@RequestMapping("/toAdd")
	public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/price/stationservice/add");
		// 车站旅客服务类别
		List<SysDic> listStationServiceType = sysDicService.getByCategory("STATION_SERVICE_TYPE");
		mv.addObject("listStationServiceType", listStationServiceType);
		PriceStationService priceStationService = new PriceStationService();
		mv.addObject("priceStationService", priceStationService);
		// 设置返回的url
		BackUrlUtil.setBackUrl(mv, request);
		return mv;
	}

	/**
	 * 
	 * what: 到修改车站旅客服务类别页面
	 * 
	 * @param request request
	 * @param response response
	 * @param id id
	 * @return 修改车站旅客服务类别页面
	 *
	 * @author 李红 created on 2017年12月11日
	 */
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response, int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/price/stationservice/update");
		// 车站旅客服务类别
		List<SysDic> listStationServiceType = sysDicService.getByCategory("STATION_SERVICE_TYPE");
		mv.addObject("listStationServiceType", listStationServiceType);
		PriceStationService priceStationService = priceStationServiceService.getById(id);
		mv.addObject("priceStationService", priceStationService);
		// 设置返回的url
		BackUrlUtil.setBackUrl(mv, request);
		return mv;
	}

	/**
	 * 
	 * what: 新增车站旅客服务类别
	 * 
	 * @param request request
	 * @param response response
	 * @param priceStationService priceStationService
	 *
	 * @author 李红 created on 2017年12月11日
	 */
	@RequestMapping("/add")
	public void add(HttpServletRequest request, HttpServletResponse response, @Valid PriceStationService priceStationService) {
		int flag = priceStationServiceService.add(priceStationService);
		if (flag == 0) {
			WebUtil.out(response, JsonUtil.createOperaStr(false, "/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE));
		} else if (flag == -1) {
			ReturnCodeUtil.putMsg("PTPA_PRICE_20001", "该车站旅客服务类别已存在，不可重复添加");
			WebUtil.out(response, JsonUtil.createOperaStr(false, "/error.htm?resultCode=PTPA_PRICE_20001"));
		} else {
			WebUtil.out(response, JsonUtil.createOperaStr(false, "/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS));
		}
	}

	/**
	 * 
	 * what: 修改车站旅客服务类别
	 * 
	 * @param request request
	 * @param response response
	 * @param priceStationService priceStationService
	 *
	 * @author 李红 created on 2017年12月11日
	 */
	@RequestMapping("/update")
	public void update(HttpServletRequest request, HttpServletResponse response,@Valid PriceStationService priceStationService) {
		int flag = priceStationServiceService.update(priceStationService);
		if (flag == 0) {
			WebUtil.out(response, JsonUtil.createOperaStr(false, "/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE));
		} else if (flag == -1) {
			ReturnCodeUtil.putMsg("PTPA_PRICE_20001", "该车站旅客服务类别已存在，不可重复添加");
			WebUtil.out(response, JsonUtil.createOperaStr(false, "/error.htm?resultCode=PTPA_PRICE_20001"));
		} else {
			WebUtil.out(response, JsonUtil.createOperaStr(false, "/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS));
		}
	}

	/**
	 * 
	 * what: 删除车站旅客服务类别
	 * 
	 * @param request request
	 * @param response response
	 * @param id 车站旅客服务类别id
	 * @return 到操作提示页面
	 *
	 * @author 李红 created on 2017年12月11日
	 */
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, HttpServletResponse response, int id) {
		int flag = priceStationServiceService.delete(id);
		if (flag == 0) {
			// 删除失败
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else {
			// 删除成功
			return "forward:/success.htm?resultCode=" + GlobalCode.DELETE_SUCCESS;
		}
	}
}
