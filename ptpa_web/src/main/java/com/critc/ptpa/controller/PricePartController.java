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
import com.critc.ptpa.model.PricePart;
import com.critc.ptpa.service.BureauService;
import com.critc.ptpa.service.PricePartService;
import com.critc.ptpa.vo.PricePartSearchVO;
import com.critc.sys.service.SysDicService;
import com.critc.util.code.GlobalCode;
import com.critc.util.model.ComboboxVO;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;

/**
 * what: 备品成本 Controller. <br/>
 * 
 * @author 刘正荣 created on 2017年11月24日
 */
@Controller
@RequestMapping("/price/part")
public class PricePartController {

	/**
	 * 配置
	 */
	@Autowired
	private PubConfig pubConfig;

	/**
	 * pricePartService
	 */
	@Autowired
	private PricePartService pricePartService;

	@Autowired
	private BureauService bureauService;

	@Autowired
	private SysDicService sysDicService;

	/**
	 * 
	 * what: 跳转到index页面. <br/>
	 * 
	 * @param request request
	 * @param pricePartSearchVO pricePartSearchVO
	 * @return 跳转到index页面
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, PricePartSearchVO pricePartSearchVO) {
		ModelAndView mv = new ModelAndView();
		String url = createUrl(pricePartSearchVO);
		List<PricePart> list = pricePartService.list(pricePartSearchVO);

		List<ComboboxVO> listTrainType = sysDicService.listType("TRAIN_TYPE");
		List<ComboboxVO> listBureau = bureauService.listbureauComboToShortName();

		// 获取查询总数
		int recordCount = pricePartService.count(pricePartSearchVO);
		// 定义分页对象
		PageNavigate pageNavigate = new PageNavigate(url, pricePartSearchVO.getPageIndex(), recordCount);
		mv.addObject("list", list);
		mv.addObject("listTrainType", listTrainType);
		mv.addObject("listBureau", listBureau);
		mv.setViewName("/price/part/index");

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
	 * @param pricePartSearchVO pricePartSearchVO查询条件
	 * @return 返回拼接的url
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	private String createUrl(PricePartSearchVO pricePartSearchVO) {
		String url = pubConfig.getDynamicServer() + "/price/part/index.htm?";
		if (StringUtil.isNotNullOrEmpty(pricePartSearchVO.getTrainTypeCode())) {
			url += "&trainTypeCode=" + pricePartSearchVO.getTrainTypeCode();
		}

		if (StringUtil.isNotNullOrEmpty(pricePartSearchVO.getLjdm())) {
			url += "&ljdm=" + pricePartSearchVO.getLjdm();
		}

		return url;
	}

	/**
	 * 
	 * what: 跳转到添加备品成本页面. <br/>
	 * 
	 * @param request request
	 * @return 跳转到添加备品成本页面
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/toAdd")
	public ModelAndView toAdd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<ComboboxVO> listTrainType = sysDicService.listType("TRAIN_TYPE");
		List<ComboboxVO> listBureau = bureauService.listbureauComboToShortName();
		mv.addObject("listTrainType", listTrainType);
		mv.addObject("listBureau", listBureau);
		mv.addObject("pricePartSearchVO", new PricePartSearchVO());
		mv.addObject("pricePart", new PricePart());
		mv.setViewName("/price/part/add");

		// 设置返回的url
		BackUrlUtil.setBackUrl(mv, request);
		return mv;
	}

	/**
	 * 
	 * what: 跳转到备品成本页面. <br/>
	 * when: 点击修改时.<br/>
	 * 
	 * @param request request
	 * @param id 需要的修改备品成本的id
	 * @return 跳转到修改备品成本页面
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(HttpServletRequest request, int id) {
		ModelAndView mv = new ModelAndView();
		PricePart pricePart = pricePartService.get(id);
		List<ComboboxVO> listTrainType = sysDicService.listType("TRAIN_TYPE");
		List<ComboboxVO> listBureau = bureauService.listbureauComboToShortName();
		mv.addObject("listTrainType", listTrainType);
		mv.addObject("pricePartSearchVO", pricePart);
		mv.addObject("listBureau", listBureau);
		mv.addObject("pricePart", pricePart);
		mv.setViewName("/price/part/update");
		BackUrlUtil.setBackUrl(mv, request);
		return mv;
	}

	/**
	 * 
	 * what: 添加备品成本. <br/>
	 * when: 添加备品成本时，点击保存.<br/>
	 * 
	 * @param request request
	 * @param pricePart pricePart
	 * @return 返回操作结果，0表示新增失败,1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */

	@RequestMapping("/add")
	public String add(HttpServletRequest request, PricePart pricePart) {
		int flag = pricePartService.add(pricePart);
		if (flag == 0) {
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else {
			return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
		}
	}

	/**
	 * 
	 * what: 更新备品成本. <br/>
	 * 
	 * @param request request
	 * @param response response
	 * @param pricePart pricePart
	 * @return 返回处理结果
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/update")
	public String update(HttpServletRequest request, HttpServletResponse response, @Valid PricePart pricePart) {
		int flag = pricePartService.update(pricePart);
		if (flag == 0) {
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else {
			return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
		}
	}

	/**
	 * 
	 * what: 删除备品成本. <br/>
	 * when: 点击删除.<br/>
	 * 
	 * @param id 需要删除的备品成本
	 * @return 0表示失败，1表示成功
	 *
	 * @author 刘正荣 created on 2017年11月24日
	 */
	@RequestMapping("/delete")
	public String delete(int id) {
		int flag = pricePartService.delete(id);
		if (flag == 0) {
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else {
			return "forward:/success.htm?resultCode=" + GlobalCode.OPERA_SUCCESS;
		}
	}

}
