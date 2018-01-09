/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_web
 */
package com.critc.ptpa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.ptpa.model.Train;
import com.critc.ptpa.service.CalculateCostService;
import com.critc.ptpa.service.CalculateIncomeService;
import com.critc.ptpa.service.CalculateServiceCost;
import com.critc.ptpa.service.TrainService;
import com.critc.ptpa.vo.TrainSearchVO;
import com.critc.util.json.JsonUtil;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;

/**
 * what: 盈利额测算
 * 
 *
 * @author 李红 created on 2017年12月12日
 */
@RequestMapping("/profit/earning")
@Controller
public class ProfitEarningController {
	/**
	 * 客车详情Service
	 */
	@Autowired
	private TrainService trainService;
	/**
	 * 固定成本计算Service
	 */
	@Autowired
	private CalculateCostService calculateCostService;
	/**
	 * 变动成本Service
	 */
	@Autowired
	private CalculateServiceCost calculateServiceCost;
	/**
	 * 收入计算Service
	 */
	@Autowired
	private CalculateIncomeService calculateIncomeService;

	/**
	 * what: 客车详情首页
	 *
	 * @param request request
	 * @param trainSearchVO 车次详情VO
	 *
	 * @return mv
	 *
	 * @author 李红 created on 2017年12月12日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, TrainSearchVO trainSearchVO) {
		ModelAndView mv = new ModelAndView();
		int recordCount = trainService.count(trainSearchVO);
		String url = createUrl(trainSearchVO);
		PageNavigate pageNavigate = new PageNavigate(url, trainSearchVO.getPageIndex(), recordCount);
		List<Train> list = trainService.list(trainSearchVO);

		mv.addObject("pageNavigate", pageNavigate);
		mv.addObject("list", list);

		mv.setViewName("/profit/earning/index");
		BackUrlUtil.createBackUrl(mv, request, url);
		return mv;
	}

	/**
	 * what: 拼接返回链接
	 *
	 * @param trainSearchVO 车次详情VO
	 *
	 * @return url
	 *
	 * @author 李红 created on 2017年12月12日
	 */
	private String createUrl(TrainSearchVO trainSearchVO) {
		String url = "";
		if (StringUtil.isNotNullOrEmpty(trainSearchVO.getCc()))
			url += trainSearchVO.getCc();
		return url;
	}

	/**
	 *
	 * what: 自动补全车次数据列表
	 *
	 * @param response response
	 *
	 * @author 李红 created on 2017年12月12日
	 */
	@RequestMapping("/getCcList")
	public void getAutoComplteList(HttpServletResponse response) {
		WebUtil.out(response, JsonUtil.toStr(trainService.listAllCc()));
	}

	/**
	 * 
	 * what: 到盈利额测算界面
	 * 
	 * @param request request
	 * @param id 车次id
	 * @return 盈利额测算界面
	 *
	 * @author 李红 created on 2017年12月12日
	 */
	@RequestMapping("/toCalculate")
	public ModelAndView toCalculate(HttpServletRequest request, int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("train", trainService.getTrainById(id));
		mv.addObject("balancePoit", calculateIncomeService.banlancepoit(id));
		mv.setViewName("/profit/earning/calculate");
		return mv;
	}

	/**
	 * 
	 * what: 盈利额测算
	 * 
	 * @param request request
	 * @param response response
	 * @param id 车次id
	 * @param seatRate 客座率
	 *
	 * @author 李红 created on 2017年12月12日
	 */
	@RequestMapping("/calculate")
	public void calculate(HttpServletRequest request, HttpServletResponse response, int id, double seatRate) {
		// 根据车次id获取定员
		int seatCount = calculateIncomeService.seatCount(id);
		// 票价收入
		double price = calculateIncomeService.totalticketprice(id);
		// 固定成本
		double constantCost = calculateCostService.constantCost(id);
		// 服务成本
		double stationService = calculateServiceCost.getStationService(id, (seatRate / 100 * seatCount));
		// 售票成本
		double ticketAgentfee = calculateServiceCost.getTicketAgentfee(price*(seatRate / 100));
		// 盈利额
		double earning = price*(seatRate / 100) - constantCost - stationService - ticketAgentfee;
		Map<String, Object> map = new HashMap<>();
		map.put("price", price*(seatRate / 100));
		map.put("constantCost", constantCost);
		map.put("stationService", stationService);
		map.put("ticketAgentfee", ticketAgentfee);
		map.put("earning", earning);
		WebUtil.out(response, JsonUtil.toStr(map));
	}
}
