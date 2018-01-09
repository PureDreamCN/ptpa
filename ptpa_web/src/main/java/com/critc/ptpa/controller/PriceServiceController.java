/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
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
import com.critc.ptpa.model.PriceService;
import com.critc.ptpa.service.BureauService;
import com.critc.ptpa.service.PriceServiceService;
import com.critc.ptpa.vo.PriceServiceSearchVO;
import com.critc.sys.service.SysDicService;
import com.critc.util.code.GlobalCode;
import com.critc.util.model.ComboboxVO;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;

/**
 * what: 服务成本 Controller. <br/>
 * 
 * @author 刘正荣 created on 2017年11月24日
 */
@Controller
@RequestMapping("/price/service")
public class PriceServiceController {

	/**
	 * 配置参数
	 */
	@Autowired
	private PubConfig pubConfig;

	/**
	 * priceServiceService
	 */
	@Autowired
	private PriceServiceService priceServiceService;

	@Autowired
	private BureauService bureauService;

	@Autowired
	private SysDicService sysDicService;

	/**
	 * 
	 * what: 跳转到index页面. <br/>
	 * 
	 * @param request request
	 * @param priceServiceSearchVO priceServiceSearchVO
	 * @return 跳转到index页面
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, PriceServiceSearchVO priceServiceSearchVO) {
		ModelAndView mv = new ModelAndView();
		String url = createUrl(priceServiceSearchVO);
		List<PriceService> list = priceServiceService.list(priceServiceSearchVO);

		List<ComboboxVO> listService = sysDicService.listType("SERVICE_TYPE");
		List<ComboboxVO> listBureau = bureauService.listbureauComboToShortName();
		// 获取查询总数
		int recordCount = priceServiceService.count(priceServiceSearchVO);
		// 定义分页对象
		PageNavigate pageNavigate = new PageNavigate(url, priceServiceSearchVO.getPageIndex(), recordCount);
		mv.addObject("list", list);
		mv.addObject("listService", listService);
		mv.addObject("listBureau", listBureau);
		mv.setViewName("/price/service/index");

		// 设置分页的变量
		mv.addObject("pageNavigate", pageNavigate);
		// 设置返回url
		BackUrlUtil.createBackUrl(mv, request, url);
		return mv;
	}

	/**
	 * 
	 * what: 设置返回的url. <br/>
	 * 
	 * @param priceServiceSearchVO priceServiceSearchVO查询条件
	 * @return 返回拼接的url
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	private String createUrl(PriceServiceSearchVO priceServiceSearchVO) {
		String url = pubConfig.getDynamicServer() + "/price/service/index.htm?";
		if (StringUtil.isNotNullOrEmpty(priceServiceSearchVO.getServiceCode())) {
			url += "&serviceCode=" + priceServiceSearchVO.getServiceCode();
		}

		if (StringUtil.isNotNullOrEmpty(priceServiceSearchVO.getLjdm())) {
			url += "&ljdm=" + priceServiceSearchVO.getLjdm();
		}

		return url;
	}

	/**
	 * 
	 * what: 跳转到添加服务成本页面. <br/>
	 * 
	 * @param request request
	 * @return 跳转到添加服务成本页面
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/toAdd")
	public ModelAndView toAdd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<ComboboxVO> listService = sysDicService.listType("SERVICE_TYPE");
		List<ComboboxVO> listBureau = bureauService.listbureauComboToShortName();
		mv.addObject("listService", listService);

		mv.addObject("listBureau", listBureau);
		mv.addObject("priceService", new PriceService());
		mv.setViewName("/price/service/add");

		// 设置返回的url
		BackUrlUtil.setBackUrl(mv, request);
		return mv;
	}

	/**
	 * 
	 * what: 跳转到服务成本页面. <br/>
	 * when: 点击修改时.<br/>
	 * 
	 * @param request request
	 * @param id 需要的修改服务成本的id
	 * @return 跳转到修改服务成本页面
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(HttpServletRequest request, int id) {
		ModelAndView mv = new ModelAndView();
		PriceService priceService = priceServiceService.get(id);
		List<ComboboxVO> listService = sysDicService.listType("SERVICE_TYPE");
		List<ComboboxVO> listBureau = bureauService.listbureauComboToShortName();
		mv.addObject("listService", listService);
		mv.addObject("priceService", priceService);
		mv.addObject("listBureau", listBureau);
		mv.setViewName("/price/service/update");
		BackUrlUtil.setBackUrl(mv, request);
		return mv;
	}

	/**
	 * 
	 * what: 添加服务成本. <br/>
	 * when: 添加服务成本时，点击保存.<br/>
	 * 
	 * @param request request
	 * @param priceService priceService
	 * @return 返回操作结果，0表示新增失败,1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */

	@RequestMapping("/add")
	public String add(HttpServletRequest request, @Valid PriceService priceService) {
		int flag = priceServiceService.add(priceService);
		if (flag == 0) {
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else {
			return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
		}
	}

	/**
	 * 
	 * what: 更新服务成本. <br/>
	 * 
	 * @param request request
	 * @param response response
	 * @param priceService priceService
	 * @return 返回处理结果
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/update")
	public String update(HttpServletRequest request, HttpServletResponse response, @Valid PriceService priceService) {
		int flag = priceServiceService.update(priceService);
		if (flag == 0) {
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else {
			return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
		}
	}

	/**
	 * 
	 * what: 删除服务成本. <br/>
	 * when: 点击删除.<br/>
	 * 
	 * @param id 需要删除的服务成本
	 * @return 0表示失败，1表示成功
	 *
	 * @author liuzr created on 2017年11月24日
	 */
	@RequestMapping("/delete")
	public String delete(int id) {
		int flag = priceServiceService.delete(id);
		if (flag == 0) {
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else {
			return "forward:/success.htm?resultCode=" + GlobalCode.OPERA_SUCCESS;
		}
	}

}
