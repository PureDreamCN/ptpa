/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_web
 */
package com.critc.ptpa.controller;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.TractionPrice;
import com.critc.ptpa.service.BureauService;
import com.critc.ptpa.service.TractionPriceService;
import com.critc.ptpa.vo.TractionPriceSearchVo;
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
 * what:    牵引清算单价相关
 *
 * @author 马丽静 created on 2017年11月28日
 */
@RequestMapping("/price/tractionprice")
@Controller
public class TractionPriceController {
    @Autowired
    private TractionPriceService tractionPriceService;
    @Autowired
    private PubConfig pubConfig;
    @Autowired
    private SysDicService sysDicService;
    @Autowired
    private BureauService bureauService;

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, TractionPriceSearchVo tractionPriceSearchVo) {
        ModelAndView mv = new ModelAndView();
        int recordCount = tractionPriceService.count(tractionPriceSearchVo);// 获取查询总数
        String url = createUrl(tractionPriceSearchVo);
        PageNavigate pageNavigate = new PageNavigate(url, tractionPriceSearchVo.getPageIndex(), recordCount);// 定义分页对象
        List<TractionPrice> list = tractionPriceService.list(tractionPriceSearchVo);
        mv.addObject("pageNavigate", pageNavigate);// 设置分页的变量
        mv.addObject("list", list);// 把获取的记录放到mv里面
        mv.addObject("listTractionType", sysDicService.getByCategory("TRACTION_TYPE"));//牵引类型
        mv.addObject("listLJDM", bureauService.list());//牵引类型
        mv.setViewName("/price/tractionprice/index");// 跳转至指定页面
        BackUrlUtil.createBackUrl(mv, request, url);// 设置返回url
        return mv;
    }

    /**
     * what:     跳转至选择单挑数据页面
     *
     * @param request
     * @param response
     * @param tractionPriceSearchVo
     * @param trainId
     * @param lineId
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    @RequestMapping("/commonTractionPrice")
    public ModelAndView commonTractionPrice(HttpServletRequest request, HttpServletResponse response,
                                            TractionPriceSearchVo tractionPriceSearchVo, String trainId, String lineId) {
        ModelAndView mv = new ModelAndView();
        int recordCount = tractionPriceService.count(tractionPriceSearchVo);// 获取查询总数
        String url = createUrl(tractionPriceSearchVo);
        PageNavigate pageNavigate = new PageNavigate(url, tractionPriceSearchVo.getPageIndex(), recordCount);// 定义分页对象
        List<TractionPrice> list = tractionPriceService.list(tractionPriceSearchVo);
        mv.addObject("pageNavigate", pageNavigate);// 设置分页的变量
        mv.addObject("list", list);// 把获取的记录放到mv里面
        mv.addObject("trainId", trainId);// 把获取的记录放到mv里面
        mv.addObject("lineId", lineId);// 把获取的记录放到mv里面
        mv.addObject("listTractionType", sysDicService.getByCategory("TRACTION_TYPE"));//牵引类型
        mv.addObject("listLJDM", bureauService.list());//牵引类型
        mv.setViewName("/price/tractionprice/commontractionprice");// 跳转至指定页面
        return mv;
    }

    /**
     * what:    创建分页url
     *
     * @param tractionPriceSearchVo
     * @return
     * @author 马丽静 created on 2017/12/6
     */

    private String createUrl(TractionPriceSearchVo tractionPriceSearchVo) {
        String url = pubConfig.getDynamicServer() + "/price/tractionprice/index.htm?";
        if (StringUtil.isNotNullOrEmpty(tractionPriceSearchVo.getLjdm())) {
            url += "ljdm=" + tractionPriceSearchVo.getLjdm();
        }
        if (StringUtil.isNotNullOrEmpty(tractionPriceSearchVo.getTractionTypeCode())) {
            url += "&tractionTypeCode" + tractionPriceSearchVo.getTractionTypeCode();
        }
        return url;
    }

    /**
     * what:    跳转到添加页面的方法
     *
     * @param request
     * @param response
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    @RequestMapping("/toAdd")
    public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("tractionPrice", new TractionPrice());
        mv.addObject("listTractionType", sysDicService.getByCategory("TRACTION_TYPE"));//牵引类型
        mv.addObject("listLJDM", bureauService.list());//牵引类型
        mv.setViewName("/price/tractionprice/update");
        BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
        return mv;
    }

    /**
     * what:    跳转到修改页面方法
     *
     * @param request
     * @param response
     * @param id       线路单价数据id
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    @RequestMapping("/toUpdate")
    public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response, Integer id) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("tractionPrice", tractionPriceService.get(id));
        mv.addObject("listTractionType", sysDicService.getByCategory("TRACTION_TYPE"));//牵引类型
        mv.addObject("listLJDM", bureauService.list());//牵引类型
        mv.setViewName("/price/tractionprice/update");
        BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
        return mv;
    }

    /**
     * what:    新增方法
     *
     * @param request
     * @param response
     * @param tractionPrice 新增的实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response, TractionPrice tractionPrice) {
        int flag = tractionPriceService.add(tractionPrice);
        if (flag == 0)
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;// 新增失败;
        else if (flag == 2)
            return "forward:/error.htm?resultCode=20104";// 已存在;
        else
            return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;// 用户信息新增成功;
    }

    /**
     * what:    修改牵引单价方法
     *
     * @param request
     * @param response
     * @param tractionPrice 修改的实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    @RequestMapping("/update")
    public String update(HttpServletRequest request, HttpServletResponse response, TractionPrice tractionPrice) {
        int flag = tractionPriceService.update(tractionPrice);
        if (flag == 0)
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;// 修改失败;
        else
            return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;// 修改成功;
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
        int flag = tractionPriceService.delete(id);
        if (flag == 0)
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;// 删除失败;
        else
            return "forward:/success.htm?resultCode=" + GlobalCode.DELETE_SUCCESS;// 删除成功;
    }
}
