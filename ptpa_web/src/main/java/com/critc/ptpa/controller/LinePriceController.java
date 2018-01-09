/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:ptpa_web
 */
package com.critc.ptpa.controller;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.LinePrice;
import com.critc.ptpa.service.LinePriceService;
import com.critc.ptpa.vo.LinePriceSearchVo;
import com.critc.sys.service.SysDicService;
import com.critc.util.code.GlobalCode;
import com.critc.util.json.JsonUtil;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * what:    线路使用费单价维护
 *
 * @author 马丽静 created on 2017年11月23日
 */
@RequestMapping("/price/lineprice")
@Controller
public class LinePriceController {
    @Autowired
    private LinePriceService linePriceService;
    @Autowired
    private PubConfig pubConfig;
    @Autowired
    private SysDicService sysDicService;

    /**
     * what:    列表页查询方法
     *
     * @param request
     * @param response
     * @param linePriceSearchVo 查询条件
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, LinePriceSearchVo
            linePriceSearchVo) {
        ModelAndView mv = new ModelAndView();
        int recordCount = linePriceService.count(linePriceSearchVo);// 获取查询总数
        String url = createUrl(linePriceSearchVo);
        PageNavigate pageNavigate = new PageNavigate(url, linePriceSearchVo.getPageIndex(), recordCount);// 定义分页对象
        List<LinePrice> list = linePriceService.list(linePriceSearchVo);
        mv.addObject("pageNavigate", pageNavigate);// 设置分页的变量
        mv.addObject("list", list);// 把获取的记录放到mv里面
        mv.addObject("listPriceLevel", sysDicService.getByCategory("LINE_PRICE_LEVEL"));// 列车清算等级
        mv.addObject("listTrainType", sysDicService.getByCategory("TRAIN_TYPE"));// 列车类型
        mv.addObject("listTrainMarshallingType", sysDicService.getByCategory("TRAIN_MARSHALLING_TYPE"));// 列车编组类型
        mv.addObject("listLineBusyLevel", sysDicService.getByCategory("LINE_BUSY_LEVEL"));// 线路繁忙程度
        mv.setViewName("price/lineprice/index");// 跳转至指定页面
        BackUrlUtil.createBackUrl(mv, request, url);// 设置返回url
        return mv;
    }

    /**
     * what:    跳转至选择单挑数据页面
     *
     * @param request
     * @param response
     * @param linePriceSearchVo 查询条件
     * @param trainId           列车id
     * @param lineId            线路id
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    @RequestMapping("/commonLinePrice")
    public ModelAndView commonLinePrice(HttpServletRequest request, HttpServletResponse response, LinePriceSearchVo
            linePriceSearchVo, String trainId, String lineId) {
        ModelAndView mv = new ModelAndView();
        int recordCount = linePriceService.count(linePriceSearchVo);// 获取查询总数
        String url = createUrl(linePriceSearchVo);
        PageNavigate pageNavigate = new PageNavigate(url, linePriceSearchVo.getPageIndex(), recordCount);// 定义分页对象
        List<LinePrice> list = linePriceService.list(linePriceSearchVo);
        mv.addObject("pageNavigate", pageNavigate);// 设置分页的变量
        mv.addObject("list", list);// 把获取的记录放到mv里面
        mv.addObject("trainId", trainId);// 把获取的记录放到mv里面
        mv.addObject("lineId", lineId);// 把获取的记录放到mv里面
        mv.addObject("beforeDawn", linePriceSearchVo.getBeforeDown());// 把获取的记录放到mv里面
        mv.addObject("listPriceLevel", sysDicService.getByCategory("LINE_PRICE_LEVEL"));// 列车清算等级
        mv.addObject("listTrainType", sysDicService.getByCategory("TRAIN_TYPE"));// 列车类型
        mv.addObject("listTrainMarshallingType", sysDicService.getByCategory("TRAIN_MARSHALLING_TYPE"));// 列车编组类型
        mv.addObject("listLineBusyLevel", sysDicService.getByCategory("LINE_BUSY_LEVEL"));// 线路繁忙程度
        mv.addObject("linePriceSearchVo", linePriceSearchVo);// 查询条件
        mv.setViewName("price/lineprice/commonlineprice");// 跳转至指定页面
        BackUrlUtil.createBackUrl(mv, request, url);// 设置返回url
        return mv;
    }

    /**
     * what:    创建分页url
     *
     * @param linePriceSearchVo
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    private String createUrl(LinePriceSearchVo linePriceSearchVo) {
        String url = pubConfig.getDynamicServer() + "/price/lineprice/index.htm?";
        if (StringUtil.isNotNullOrEmpty(linePriceSearchVo.getLinePriceLevelCode())) {
            url += "linePriceLevelCode=" + linePriceSearchVo.getLinePriceLevelCode();
        }
        if (StringUtil.isNotNullOrEmpty(linePriceSearchVo.getTrainTypeCode())) {
            url += "&trainTypeCode" + linePriceSearchVo.getTrainTypeCode();
        }
        if (StringUtil.isNotNullOrEmpty(linePriceSearchVo.getTrainMarshallingTypeCode())) {
            url += "&trainMarshallingTypeCode" + linePriceSearchVo.getTrainMarshallingTypeCode();
        }
        if (StringUtil.isNotNullOrEmpty(linePriceSearchVo.getLineBusyLevelCode())) {
            url += "&lineBusyLevelCode" + linePriceSearchVo.getLineBusyLevelCode();
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
        mv.addObject("listPriceLevel", sysDicService.getByCategory("LINE_PRICE_LEVEL"));// 列车清算等级
        mv.addObject("listTrainType", sysDicService.getByCategory("TRAIN_TYPE"));// 列车类型
        mv.addObject("listTrainMarshallingType", sysDicService.getByCategory("TRAIN_MARSHALLING_TYPE"));// 列车编组类型
        mv.addObject("listLineBusyLevel", sysDicService.getByCategory("LINE_BUSY_LEVEL"));// 线路繁忙程度
        mv.addObject("linePrice", new LinePrice());
        mv.setViewName("/price/lineprice/update");
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
        mv.addObject("listPriceLevel", sysDicService.getByCategory("LINE_PRICE_LEVEL"));// 列车清算等级
        mv.addObject("listTrainType", sysDicService.getByCategory("TRAIN_TYPE"));// 列车类型
        mv.addObject("listTrainMarshallingType", sysDicService.getByCategory("TRAIN_MARSHALLING_TYPE"));// 列车编组类型
        mv.addObject("listLineBusyLevel", sysDicService.getByCategory("LINE_BUSY_LEVEL"));// 线路繁忙程度
        mv.addObject("linePrice", linePriceService.get(id));
        mv.setViewName("/price/lineprice/update");
        BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
        return mv;
    }

    /**
     * what:    新增/修改线路单价方法
     *
     * @param request
     * @param response
     * @param linePrice 新增/修改的实体类
     * @return
     * @author 马丽静 created on 2017/12/6
     */
    @RequestMapping("/update")
    public void update(HttpServletRequest request, HttpServletResponse response, LinePrice linePrice) {
        int flag = linePriceService.update(linePrice);
        if (flag == 0) {
            WebUtil.out(response, JsonUtil.createOperaStr(false, "/error.htm?resultCode=" + GlobalCode
                    .OPERA_FAILURE));
        } else {
            WebUtil.out(response, JsonUtil.createOperaStr(true, "/success.htm?resultCode=" + GlobalCode
                    .SAVE_SUCCESS));
        }
    }
    /**
     * what:    删除线路单价
     *
     * @param request
     * @param response
     * @param id       线路单价id
     * @return
     * @author 马丽静 created on 2017年11月6日
     */
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request, HttpServletResponse response, int id) {
        int flag = linePriceService.delete(id);
        if (flag == 0)
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;// 删除失败;
        else
            return "forward:/success.htm?resultCode=" + GlobalCode.DELETE_SUCCESS;// 删除成功;
    }


}
