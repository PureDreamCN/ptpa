/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:TODO
 * Module Name:ptpa_web
 */
package com.critc.ptpa.controller;

import java.text.DecimalFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.Vehicle;
import com.critc.ptpa.model.VehicleSeat;
import com.critc.ptpa.service.VehicleSeatService;
import com.critc.ptpa.service.VehicleService;
import com.critc.ptpa.vo.VehicleSearchVO;
import com.critc.sys.model.SysDic;
import com.critc.sys.service.SysDicService;
import com.critc.util.code.GlobalCode;
import com.critc.util.json.JsonUtil;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;

/**
 * what: 车辆类型Controller
 * 
 *
 * @author 李红 created on 2017年11月28日
 */
@RequestMapping("/vehicle")
@Controller
public class VehicleController {
	/**
	 * 车辆类型Service
	 */
	@Autowired
	private VehicleService vehicleService;
	/**
	 * 字典Sevice
	 */
	@Autowired
	private SysDicService sysDicService;
	/**
	 * 车辆类型席位配置Service
	 */
	@Autowired
	private VehicleSeatService vehicleSeatService;
	/**
	 * 车辆类型维修Service
	 */
	// @Autowired
	// private VehicleMaintainService vehicleMaintainService;
	/**
	 * 全局参数配置
	 */
	@Autowired
	private PubConfig pubConfig;

	/**
	 * 
	 * what: 车辆类型首页
	 * 
	 * @param request request
	 * @param response response
	 * @return 车辆类型首页
	 *
	 * @author 李红 created on 2017年11月28日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response,
			VehicleSearchVO vehicleSearchVO) {
		ModelAndView mv = new ModelAndView();
		int recordCount = vehicleService.count(vehicleSearchVO);
		String url = createUrl(vehicleSearchVO);
		PageNavigate pageNavigate = new PageNavigate(url, vehicleSearchVO.getPageIndex(), recordCount);// 定义分页对象
		// 获取列表
		List<Vehicle> list = vehicleService.list(vehicleSearchVO);
		mv.addObject("list", list);
		// 车型
		List<SysDic> listCX = sysDicService.getByCategory("CX");
		compare(listCX);
		mv.addObject("listCX", listCX);
		// 车种
		List<SysDic> listCZ = sysDicService.getByCategory("CZ");
		compare(listCZ);
		mv.addObject("listCZ", listCZ);
		mv.setViewName("/vehicle/index");
		mv.addObject("pageNavigate", pageNavigate);// 设置分页的变量		
		mv.addObject("backUrl", StringUtil.encodeUrl(url));
		return mv;

	}

	/**
	 * 
	 * what: 创建url
	 * 
	 * @param vehicleSearchVO
	 * @return
	 *
	 * @author 李红 created on 2017年12月13日
	 */
	private String createUrl(VehicleSearchVO vehicleSearchVO) {
		String url = pubConfig.getDynamicServer() + "/vehicle/index.htm?";
		if (StringUtil.isNotNullOrEmpty(vehicleSearchVO.getCxCode())) {
			url += "cxCode=" + vehicleSearchVO.getCxCode();
		}
		if (StringUtil.isNotNullOrEmpty(vehicleSearchVO.getCzCode())) {
			url += "&czCode" + vehicleSearchVO.getCzCode();
		}
		return url;
	}

	/**
	 * 
	 * what: 排序方法
	 * 
	 * @param list list
	 *
	 * @author 李红 created on 2017年11月28日
	 */
	public void compare(List<SysDic> list) {
		Collections.sort(list, new Comparator<SysDic>() {
			@Override
			public int compare(SysDic sysDic1, SysDic sysDic2) {
				return sysDic1.getCode().compareTo(sysDic2.getCode());
			}
		});
	}

	/**
	 * 
	 * what: 到新增车辆类型界面
	 * 
	 * @param request request
	 * @param response response
	 * @return 到新增车辆类型界面
	 *
	 * @author 李红 created on 2017年11月28日
	 */
	@RequestMapping("/toAdd")
	public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		// 车型
		List<SysDic> listCX = sysDicService.getByCategory("CX");
		compare(listCX);
		mv.addObject("listCX", listCX);
		// 车种
		List<SysDic> listCZ = sysDicService.getByCategory("CZ");
		compare(listCZ);
		mv.addObject("listCZ", listCZ);
		// 辆型
		mv.addObject("listVehicleType", sysDicService.getByCategory("LX"));
		mv.setViewName("/vehicle/add");
		Vehicle vehicle = new Vehicle();
		mv.addObject("vehicle", vehicle);
		return mv;
	}

	/**
	 * 
	 * what: 到修改车辆类型界面
	 * 
	 * @param request request
	 * @param response response
	 * @param id 车辆类型id
	 * @return 到修改车辆类型界面
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response, int id) {
		ModelAndView mv = new ModelAndView();
		Vehicle vehicle = vehicleService.getById(id);
		// VehicleMaintain vehicleMaintain = new VehicleMaintain();
		// VehicleSeat vehicleSeat = new VehicleSeat();
		mv.addObject("vehicle", vehicle);
		DecimalFormat df = new DecimalFormat("#.00");
		mv.addObject("vehiclePurchasePrice", df.format(vehicle.getPurchasePrice()));
		// mv.addObject("vehicleSeat", vehicleSeat);
		// mv.addObject("vehicleMaintain", vehicleMaintain);
		// List<VehicleMaintain> listVehicleMaintain =
		// vehicleMaintainService.getByVehicleId(id);
		// mv.addObject("listVehicleMaintain", listVehicleMaintain);
		List<VehicleSeat> listVehicleSeat = vehicleSeatService.getByVehicleId(id);
		mv.addObject("listVehicleSeat", listVehicleSeat);
		// 车型
		List<SysDic> listCX = sysDicService.getByCategory("CX");
		compare(listCX);
		mv.addObject("listCX", listCX);
		// 车种
		List<SysDic> listCZ = sysDicService.getByCategory("CZ");
		compare(listCZ);
		mv.addObject("listCZ", listCZ);
		// 辆型
		mv.addObject("listVehicleType", sysDicService.getByCategory("LX"));
		// 席别
		mv.addObject("listSeatType", sysDicService.getByCategory("SEAT_TYPE"));
		// 维修类别
		mv.addObject("listVehicleMaintainType", sysDicService.getByCategory("VEHICLE_MAINTAIN_TYPE"));
		mv.setViewName("/vehicle/update");
		String url = pubConfig.getDynamicServer() + "/vehicle/index.htm?";
		mv.addObject("backUrl", StringUtil.encodeUrl(url));
		return mv;
	}

	/**
	 * 
	 * what: 新增车辆类型
	 * 
	 * @param request request
	 * @param response response
	 * @param vehicle 车辆类型
	 *
	 * @author 李红 created on 2017年11月28日
	 */
	@RequestMapping("/add")
	public void add(HttpServletRequest request, HttpServletResponse response, @Valid Vehicle vehicle) {
		int flag = vehicleService.add(vehicle);
		if (flag == 0) {
			WebUtil.out(response, JsonUtil.createOperaStr(false, "/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE));
		} else {
			String url = pubConfig.getDynamicServer() + "/vehicle/toUpdate.htm?id=" + flag;
			WebUtil.out(response, JsonUtil.createOperaStr(false,
					"/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS + "&backUrl=" + url));
		}
	}

	/**
	 * 
	 * what: 修改车辆类型
	 * 
	 * @param request request
	 * @param response response
	 * @param vehicle vehicle
	 *
	 * @author 李红 created on 2017年11月28日
	 */
	@RequestMapping("/update")
	public void update(HttpServletRequest request, HttpServletResponse response, @Valid Vehicle vehicle) {

		// 车种
		List<SysDic> listCZ = sysDicService.getByCategory("CZ");
		for (SysDic sysDic : listCZ) {
			if (sysDic.getCode().equals(vehicle.getCzCode())) {
				vehicle.setCzName(sysDic.getName());
			}
		}
		// int flag = vehicleService.updateVehicle(vehicle,
		// vehicle.getListVehicleSeat(), vehicle.getListVehicleMaintain());
		int flag = vehicleService.updateVehicle(vehicle, vehicle.getListVehicleSeat());
		if (flag == 0) {
			WebUtil.out(response, JsonUtil.createOperaStr(false, "/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE));
		} else {
			WebUtil.out(response, JsonUtil.createOperaStr(true, "/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS));
		}

	}

	/**
	 * 
	 * what: 删除
	 * 
	 * @param request request
	 * @param response response
	 * @param id 车辆id
	 * @return 到操作提示页面
	 *
	 * @author 李红 created on 2017年11月28日
	 */
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, HttpServletResponse response, int id) {
		int flag = vehicleService.delete(id);
		if (flag == 0) {
			// 删除失败
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else {
			// 删除成功
			return "forward:/success.htm?resultCode=" + GlobalCode.DELETE_SUCCESS;
		}
	}

	/**
	 * 
	 * what: 车次
	 * 
	 * @param vehicleSearchVO vehicleSearchVO
	 * @param trainId trainId
	 * @param param param
	 * @param srcVehicleId srcVehicleId
	 * @return
	 *
	 * @author 李红 created on 2017年12月13日
	 */
	@RequestMapping("/commonVehicle")
	public ModelAndView commonVehicle(VehicleSearchVO vehicleSearchVO, Integer trainId, int param,
			Integer srcVehicleId) {
		ModelAndView mv = new ModelAndView();
		List<Vehicle> list = vehicleService.list(vehicleSearchVO);
		mv.addObject("list", list);
		mv.addObject("trainId", trainId);
		mv.addObject("type", param);
		mv.addObject("srcVehicleId", srcVehicleId);
		mv.addObject("vehicleSearchVO", vehicleSearchVO);
		// 车型
		List<SysDic> listCX = sysDicService.getByCategory("CX");
		compare(listCX);
		mv.addObject("listCX", listCX);
		// 车种
		List<SysDic> listCZ = sysDicService.getByCategory("CZ");
		compare(listCZ);
		mv.addObject("listCZ", listCZ);
		mv.setViewName("/vehicle/commonVehicle");
		return mv;
	}
}
