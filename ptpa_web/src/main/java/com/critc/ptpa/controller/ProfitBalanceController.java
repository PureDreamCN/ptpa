/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.controller;

import com.critc.ptpa.model.Book;
import com.critc.ptpa.model.CostResource;
import com.critc.ptpa.model.Train;
import com.critc.ptpa.service.*;
import com.critc.ptpa.vo.BookSearchVO;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * what:   盈利平衡点controller
 *
 * @author 郭飞 created on 2017/12/5
 */
@Controller
@RequestMapping("/profit")
public class ProfitBalanceController {
    /**
     * 客车详情Service
     */
    @Autowired
   private TrainService trainService;
    /**
     * 车站Service
     */
    @Autowired
   private StationService stationService;
    /**
     * 路局Service
     */
    @Autowired
   private   BureauService bureauService;

    /**
     *   成本计算Service
     */
    @Autowired
    private CalculateCostService calculateCostService;
    /**
     * 客户账本service
     */
    @Autowired
    private BookService bookService;

    /**
     * 收入计算
     */
    @Autowired
    private CalculateIncomeService calculateIncomeService;

    /**
     * 盈利平衡点service
     */
    @Autowired
    private ProfitBalanceService pofitBalanceService;

    @RequestMapping("/balance")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, BookSearchVO bookSearchVO){
        ModelAndView mv = new ModelAndView();
        int recordCount = bookService.count(bookSearchVO);// 获取查询总数
        String url = pofitBalanceService.createUrl(bookSearchVO);
        PageNavigate pageNavigate = new PageNavigate(url, bookSearchVO.getPageIndex(), recordCount);// 定义分页对象
        List<Book> list = bookService.list(bookSearchVO);
        List<Train> listTrain = trainService.listAllCc();
        mv.addObject("list", list);
        mv.addObject("listTrain", listTrain);
        mv.addObject("pageNavigate", pageNavigate);// 设置分页的变量
       // mv.addObject("backUrl", StringUtil.encodeUrl(url));

        mv.setViewName("/profit/profitBalance/index");
        BackUrlUtil.createBackUrl(mv, request, url);

        return mv;
    }


    @RequestMapping("/profitDetail")
    public ModelAndView profitDetail(HttpServletRequest request, HttpServletResponse response, int id, int trainId){
        ModelAndView mv = new ModelAndView();
        CostResource costResource = calculateCostService.constantCostObj(trainId);
        Train traindetail = trainService.getTrainById(trainId);
       // traindetail.setBeginCzdm(stationService.getNameByCzdm(traindetail.getBeginCzdm()));
       // traindetail.setEndCzdm(stationService.getNameByCzdm(traindetail.getEndCzdm()));
        traindetail.setLjdm(bureauService.getNameByLjdm(traindetail.getLjdm()));
        //固定成本
        double fixedCost = costResource.getLineCost()+costResource.getTractionceCost()+costResource.getTractionCost()+
                costResource.getMaintainAdvanceCost()+costResource.getMaintainNormalCost()+costResource.getDeperciationCost()+
                costResource.getHumanCost()+costResource.getPartCost()+costResource.getServiceCost();
        Book book = bookService.getBookById(id);
       //客运部变动成本
        double  ptmodifyCost = book.getPtTicketServiceCost()+book.getPtStationServiceCost();
        //发改部变动成本
        double  drmodifyCost = book.getDrTicketServiceCost()+book.getDrStationServiceCost();
        //平衡点客座率
        double ptPoint = calculateIncomeService.banlancepoit(trainId);
        //车辆成本
        double trainCost = costResource.getMaintainAdvanceCost()+costResource.getMaintainNormalCost()+costResource.getDeperciationCost();
        mv.addObject("train", traindetail);
        mv.addObject("costResource", costResource);
        mv.addObject("fixedCost", fixedCost);
        mv.addObject("ptPoint", ptPoint);
        mv.addObject("ptmodifyCost", ptmodifyCost);
        mv.addObject("drmodifyCost", drmodifyCost);
        mv.addObject("trainCost", trainCost);
        mv.addObject("book", book);
        mv.setViewName("/profit/profitBalance/detail");
        return mv;
    }

    /**
     * 跳转至平衡点页面
     * @param request request
     * @param response response
     * @return ModelAndView
     */
    @RequestMapping("/toAvgProfit")
    public ModelAndView toAvgProfit(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/profit/profitBalance/detail2");
        mv.addObject("book", new Book());
        Train train = new Train();
        train.setCc("0");
        mv.addObject("train", train);
        mv.addObject("costResource",  new CostResource());
        mv.addObject("trainCost", 0);
        mv.addObject("fixedCost", 0);
        mv.addObject("ptPoint", 0);
        mv.addObject("ptmodifyCost", 0);
        mv.addObject("drmodifyCost", 0);
        return mv;
    }
    /**
     * 平均值查询
     * @param request request
     * @param response response
     * @param bookSearchVO bookSearchVO
     * @return ModelAndView
     */
    @RequestMapping("/avgProfit")
    public ModelAndView avgProfit(HttpServletRequest request, HttpServletResponse response, BookSearchVO bookSearchVO){

       ModelAndView mv = new ModelAndView();
        String url = pofitBalanceService.createUrl(bookSearchVO);
        List<Book> list = bookService.list(bookSearchVO);
        Map<String, Object> map = pofitBalanceService.calculateData(list);

        BackUrlUtil.setBackUrl(mv, request);
        Train train = trainService.getTrainById(list.get(0).getTrainId());
        train.setLjdm(bureauService.getNameByLjdm(train.getLjdm()));
        mv.addObject("train", train);
        mv.addObject("trainId", bookSearchVO.getTrainId());
        mv.addObject("trainCost", map.get("trainCost"));
        mv.addObject("book", map.get("book"));
        mv.addObject("costResource", map.get("costResource"));
        mv.addObject("fixedCost", map.get("fixedCost"));
        mv.addObject("ptPoint", map.get("ptPoint"));
        mv.addObject("ptmodifyCost", map.get("ptmodifyCost"));
        mv.addObject("drmodifyCost", map.get("drmodifyCost"));
        mv.setViewName("/profit/profitBalance/detail2");
        return mv;


    }



}
