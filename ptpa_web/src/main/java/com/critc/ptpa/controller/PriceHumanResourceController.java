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
import com.critc.ptpa.model.PriceHumanResource;
import com.critc.ptpa.service.BureauService;
import com.critc.ptpa.service.PriceHumanResourceService;
import com.critc.ptpa.vo.PriceHumanResourceSearchVO;
import com.critc.sys.service.SysDicService;
import com.critc.util.code.GlobalCode;
import com.critc.util.model.ComboboxVO;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;

/**
 * what: 人力清算成本 Controller. <br/>
 *
 * @author 刘正荣 created on 2017年11月24日
 */
@Controller
@RequestMapping("/price/humanresource")
public class PriceHumanResourceController {

	/**
	 * priceHumanResourceService
	 */
	@Autowired
	private PriceHumanResourceService priceHumanResourceService;

	@Autowired
	private SysDicService sysDicService;

	@Autowired
	private BureauService bureauService;

	/**
	 * 配置参数
	 */
	@Autowired
	private PubConfig pubConfig;

	/**
	 * 
	 * what: 跳转到index. <br/>
	 * 
	 * @param request request
	 * @param priceHumanResourceSearchVO priceHumanResourceSearchVO
	 * @return 跳转到index页面
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, PriceHumanResourceSearchVO priceHumanResourceSearchVO) {
		ModelAndView mv = new ModelAndView();
		String url = createUrl(priceHumanResourceSearchVO);
		List<PriceHumanResource> list = priceHumanResourceService.list(priceHumanResourceSearchVO);

		List<ComboboxVO> listHumanResource = sysDicService.listType("HUMANRESOURCE_TYPE");
		List<ComboboxVO> listBureau = bureauService.listbureauComboToShortName();

		// 获取查询总数
		int recordCount = priceHumanResourceService.count(priceHumanResourceSearchVO);
		// 定义分页对象
		PageNavigate pageNavigate = new PageNavigate(url, priceHumanResourceSearchVO.getPageIndex(), recordCount);
		mv.addObject("list", list);
		mv.addObject("listHumanResource", listHumanResource);
		mv.addObject("listBureau", listBureau);
		mv.setViewName("/price/humanresource/index");

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
	 * @param priceHumanResourceSearchVO priceHumanResourceSearchVO查询条件
	 * @return 返回拼接的url
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	private String createUrl(PriceHumanResourceSearchVO priceHumanResourceSearchVO) {
		String url = pubConfig.getDynamicServer() + "/price/humanresource/index.htm?";
		if (StringUtil.isNotNullOrEmpty(priceHumanResourceSearchVO.getHumanResourceTypeCode())) {
			url += "&humanResourceTypeCode=" + priceHumanResourceSearchVO.getHumanResourceTypeCode();
		}

		if (StringUtil.isNotNullOrEmpty(priceHumanResourceSearchVO.getLjdm())) {
			url += "&ljdm=" + priceHumanResourceSearchVO.getLjdm();
		}

		return url;
	}

	/**
	 * 
	 * what: 跳转到添加人力清算单价页面. <br/>
	 * 
	 * @param request request
	 * @return 跳转到添加人力清算单价页面
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/toAdd")
	public ModelAndView toAdd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<ComboboxVO> listHumanResource = sysDicService.listType("HUMANRESOURCE_TYPE");
		List<ComboboxVO> listBureau = bureauService.listbureauComboToShortName();
		mv.addObject("listHumanResource", listHumanResource);
		mv.addObject("listBureau", listBureau);

		mv.addObject("priceHumanResource", new PriceHumanResource());
		mv.setViewName("/price/humanresource/add");

		// 设置返回的url
		BackUrlUtil.setBackUrl(mv, request);
		return mv;
	}

	/**
	 * 
	 * what: 跳转到修改人力清算单价页面. <br/>
	 * when: 点击修改时.<br/>
	 * 
	 * @param request request
	 * @param id 需要的修改人力清算单价的id
	 * @return 跳转到修改人力清算单价页面
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(HttpServletRequest request, int id) {
		ModelAndView mv = new ModelAndView();
		PriceHumanResource priceHumanResource = priceHumanResourceService.get(id);
		List<ComboboxVO> listHumanResource = sysDicService.listType("HUMANRESOURCE_TYPE");
		List<ComboboxVO> listBureau = bureauService.listbureauComboToShortName();
		mv.addObject("listHumanResource", listHumanResource);
		mv.addObject("priceHumanResource", priceHumanResource);
		mv.addObject("listBureau", listBureau);
		mv.setViewName("/price/humanresource/update");
		BackUrlUtil.setBackUrl(mv, request);
		return mv;
	}

	/**
	 * 
	 * what: 添加人力清算单价. <br/>
	 * when: 添加人力清算单价时，点击保存.<br/>
	 * 
	 * @param request request
	 * @param priceHumanResource priceHumanResource
	 * @return 返回操作结果，0表示新增失败,1表示成功
	 *
	 * @author liuzr created on 2017年11月24日
	 */

	@RequestMapping("/add")
	public String add(HttpServletRequest request, @Valid PriceHumanResource priceHumanResource) {
		int flag = priceHumanResourceService.add(priceHumanResource);
		if (flag == 0) {
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else {
			return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
		}
	}

	/**
	 * 
	 * what: 更新人力清算单价. <br/>
	 * 
	 * @param request request
	 * @param response response
	 * @param priceHumanResource priceHumanResource
	 * @return 返回处理结果
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/update")
	public String update(HttpServletRequest request, HttpServletResponse response,
			@Valid PriceHumanResource priceHumanResource) {
		int flag = priceHumanResourceService.update(priceHumanResource);
		if (flag == 0) {
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else {
			return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
		}
	}

	/**
	 * 
	 * what: 删除人力清算单价. <br/>
	 * when: 点击删除.<br/>
	 * 
	 * @param id 需要删除的人力清算单价
	 * @return 0表示失败，1表示成功
	 *
	 * @author liuzr created on 2017年11月24日
	 */
	@RequestMapping("/delete")
	public String delete(int id) {
		int flag = priceHumanResourceService.delete(id);
		if (flag == 0) {
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else {
			return "forward:/success.htm?resultCode=" + GlobalCode.OPERA_SUCCESS;
		}
	}

}
