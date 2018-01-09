/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_web
 */
package com.critc.ptpa.controller;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.CePrice;
import com.critc.ptpa.service.BureauService;
import com.critc.ptpa.service.CePriceService;
import com.critc.ptpa.vo.CePriceSearchVo;
import com.critc.sys.service.SysDicService;
import com.critc.util.code.GlobalCode;
import com.critc.util.page.PageNavigate;
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
 * what:    接触网和电费清算单价相关
 *
 * @author 马丽静 created on 2017年11月28日
 */
@RequestMapping("/price/ceprice")
@Controller
public class CePriceController {
    @Autowired
    private CePriceService cePriceService;
    @Autowired
    private PubConfig pubConfig;
    @Autowired
    private SysDicService sysDicService;
    @Autowired
    private BureauService bureauService;

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, CePriceSearchVo cePriceSearchVo) {
        ModelAndView mv = new ModelAndView();
        int recordCount = cePriceService.count(cePriceSearchVo);// 获取查询总数
        String url = createUrl(cePriceSearchVo);
        PageNavigate pageNavigate = new PageNavigate(url, cePriceSearchVo.getPageIndex(), recordCount);// 定义分页对象
        List<CePrice> list = cePriceService.list(cePriceSearchVo);
        mv.addObject("pageNavigate", pageNavigate);// 设置分页的变量
        mv.addObject("list", list);// 把获取的记录放到mv里面
        mv.addObject("listPse", sysDicService.getByCategory("PSE"));//客专公司
        mv.addObject("listLJDM", bureauService.list());//路局列表
        mv.setViewName("/price/ceprice/index");// 跳转至指定页面
        BackUrlUtil.createBackUrl(mv, request, url);// 设置返回url
        return mv;
    }

    @RequestMapping("/commonCePrice")
    public ModelAndView commonCePrice(HttpServletRequest request, HttpServletResponse response, CePriceSearchVo
            cePriceSearchVo, String trainId, String lineId) {
        ModelAndView mv = new ModelAndView();
        int recordCount = cePriceService.count(cePriceSearchVo);// 获取查询总数
        String url = createUrl(cePriceSearchVo);
        PageNavigate pageNavigate = new PageNavigate(url, cePriceSearchVo.getPageIndex(), recordCount);// 定义分页对象
        List<CePrice> list = cePriceService.list(cePriceSearchVo);
        mv.addObject("pageNavigate", pageNavigate);// 设置分页的变量
        mv.addObject("list", list);// 把获取的记录放到mv里面
        mv.addObject("trainId", trainId);// 把获取的记录放到mv里面
        mv.addObject("lineId", lineId);// 把获取的记录放到mv里面
        mv.addObject("listPse", sysDicService.getByCategory("PSE"));//客专公司
        mv.addObject("listLJDM", bureauService.list());//路局列表
        mv.setViewName("/price/ceprice/commonceprice");// 跳转至指定页面
        BackUrlUtil.createBackUrl(mv, request, url);// 设置返回url
        return mv;
    }


    /**
     * what: 创建返回url
     *
     * @param cePriceSearchVo
     * @return
     * @author 马丽静 created on 2017/11/29
     */
    private String createUrl(CePriceSearchVo cePriceSearchVo) {
        String url = pubConfig.getDynamicServer() + "/price/ceprice/index.htm?";
        if (StringUtil.isNotNullOrEmpty(cePriceSearchVo.getLjdm())) {
            url += "ljdm=" + cePriceSearchVo.getLjdm();
        }
        if (StringUtil.isNotNullOrEmpty(cePriceSearchVo.getPseCode())) {
            url += "&pseCode" + cePriceSearchVo.getPseCode();
        }
        return url;
    }

    /**
     * what:    进入添加页面
     * when:    点击新增
     *
     * @param request
     * @param response
     * @return
     * @author 马丽静 created on 2017年11月29日
     */
    @RequestMapping("/toAdd")
    public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("listPse", sysDicService.getByCategory("PSE"));//客专公司
        mv.addObject("listLJDM", bureauService.list());//路局列表
        mv.addObject("cePrice", new CePrice());
        mv.setViewName("/price/ceprice/update");
        BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
        return mv;
    }


    /**
     * what:    跳转修改页面方法
     *
     * @param request
     * @param response
     * @param id       单价id
     * @return
     * @author 马丽静 created on 2017/12/19
     */
    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response, int id) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("listPse", sysDicService.getByCategory("PSE"));//客专公司
        mv.addObject("listLJDM", bureauService.list());//路局列表
        mv.setViewName("/price/ceprice/update");
        mv.addObject("cePrice", cePriceService.get(id));
        BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
        return mv;
    }


    @RequestMapping("/update")
    public String update(HttpServletRequest request, HttpServletResponse response, CePrice cePrice) {
        int flag = cePriceService.update(cePrice);
        if (flag == 0) {
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;// 修改失败;
        } else {
            return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;// 修改成功;
        }


    }

    /**
     * what:    删除单价
     *
     * @param request
     * @param response
     * @param id       单价id
     * @return
     * @author 马丽静 created on 2017年11月6日
     */
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request, HttpServletResponse response, int id) {
        int flag = cePriceService.delete(id);
        if (flag == 0) {
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;// 删除失败;
        } else {
            return "forward:/success.htm?resultCode=" + GlobalCode.DELETE_SUCCESS;// 删除成功;
        }
    }

}