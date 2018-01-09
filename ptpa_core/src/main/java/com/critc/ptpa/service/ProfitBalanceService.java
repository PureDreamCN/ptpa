/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:TODO:Module
 */
package com.critc.ptpa.service;

import com.critc.core.pub.PubConfig;
import com.critc.ptpa.model.Book;
import com.critc.ptpa.model.CostResource;
import com.critc.ptpa.model.Train;
import com.critc.ptpa.vo.BookSearchVO;
import com.critc.util.string.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * what:    盈利平衡点service
 *
 * @author 郭飞 created on 2017/12/18
 */
@Service
public class ProfitBalanceService {
    /**
     * 全局参数配置
     */
    @Autowired
    private PubConfig pubConfig;
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
    @Autowired
    private TrainService trainService;
    /**
     * 计算平均数据
     * @param list 账本list
     * @return Map
     */
    public Map<String, Object> calculateData(List<Book> list){
        Train train = null;
        CostResource costResource2 = new CostResource();
        Book book = null;
        Book book2 = new Book();
        //发改部车站服务成本
        double drStationServiceCost = 0d;
        //发改部售票服务陈本
        double drTicketServiceCost =0d;
        //发改部售票收入
        double drTickeIncoming = 0d;
        //客运部售票收入
        double ptTickeIncoming = 0d;
        //客运部服务成本
        double  ptTicketServiceCost = 0d;
        //客运部车站服务成本
        double ptStationServiceCost = 0d;
        //固定成本
        double fixedCost = 0d;
        //客运部变动成本
        double  ptmodifyCost = 0d;
        //发改部变动成本
        double  drmodifyCost = 0d;
        //平衡点客座率
        double ptPoint = 0d;
        //车辆成本
        double trainCost = 0d;
        //线路成本
        double lineCost = 0d;
        //牵引成本
        double tractionCost = 0d;
        //接触网成本
        double tractionceCost = 0d;
        //人员成本
        double   humanCost = 0d;
        //备品成本
        double partCost = 0d;
        //服务成本
        double serviceCost = 0d;

        if(list!=null){
            train = trainService.getTrainById(list.get(0).getTrainId());
            lineCost =  judgeValue(train.getLineCost());
            tractionCost = judgeValue(train.getTractionCost());
            tractionceCost = judgeValue(train.getCeCost());
            humanCost = judgeValue(train.getHumanResourceCost());
            serviceCost = judgeValue(train.getServiceCost());
            partCost = judgeValue(train.getPartCost());
            trainCost = judgeValue(train.getMaintainAdvanceCost())+judgeValue(train.getMaintainNormalCost())+judgeValue(train.getDepreciationCost());
            fixedCost =  lineCost+tractionceCost+tractionCost+ trainCost +humanCost+partCost+serviceCost;
            ptPoint = calculateIncomeService.banlancepoit(list.get(0).getTrainId());
            for(int i=0;i<list.size();i++){
                book = bookService.getBookById(list.get(i).getId());
                drStationServiceCost += book.getDrStationServiceCost();
                drTicketServiceCost += book.getDrTicketServiceCost();
                drTickeIncoming += book.getDrTickeIncoming();
                ptStationServiceCost += book.getPtStationServiceCost();
                ptTickeIncoming += book.getPtTickeIncoming();
                ptTicketServiceCost += book.getPtTicketServiceCost();
                ptmodifyCost += book.getPtTicketServiceCost()+book.getPtStationServiceCost();
                drmodifyCost += book.getDrTicketServiceCost()+book.getDrStationServiceCost();

            }
            int count = list.size();
            ptmodifyCost = ptmodifyCost/count;
            drmodifyCost = drmodifyCost/count;
            ptTickeIncoming = ptTickeIncoming/count;
            ptTicketServiceCost = ptTicketServiceCost/count;
            ptStationServiceCost = ptStationServiceCost/count;
            drTickeIncoming = drTickeIncoming/count;
            drTicketServiceCost = drTicketServiceCost/count;
            drStationServiceCost = drStationServiceCost/count;
        }


        book2.setDrStationServiceCost(drStationServiceCost);
        book2.setDrTicketServiceCost(drTicketServiceCost);
        book2.setDrTickeIncoming(drTickeIncoming);
        book2.setPtStationServiceCost(ptStationServiceCost);
        book2.setPtTicketServiceCost(ptTicketServiceCost);
        book2.setPtTickeIncoming(ptTickeIncoming);

        costResource2.setLineCost(lineCost);
        costResource2.setTractionCost(tractionCost);
        costResource2.setTractionceCost(tractionceCost);
        costResource2.setHumanCost(humanCost);
        costResource2.setPartCost(partCost);
        costResource2.setServiceCost(serviceCost);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("book", book2);
        map.put("costResource", costResource2);
        map.put("trainCost", trainCost);
        map.put("fixedCost", fixedCost);
        map.put("ptPoint", ptPoint);
        map.put("ptmodifyCost", ptmodifyCost);
        map.put("drmodifyCost", drmodifyCost);
        return map;
    }

    /**
     * what: 创建返回url
     *
     * @param bookSearchVO 查询条件
     * @return
     * @author 郭飞 created on 2017/12/11
     */
    public String createUrl(BookSearchVO bookSearchVO) {
        String url = pubConfig.getDynamicServer() + "/profit/balance.htm?";
        if (bookSearchVO.getTrainId()!=null && bookSearchVO.getTrainId() !=0) {
            url += "trainId=" + bookSearchVO.getTrainId();
        }
        if (StringUtil.isNotNullOrEmpty(bookSearchVO.getStartDate())) {
            url += "&startDate=" + bookSearchVO.getStartDate();
        }
        if (StringUtil.isNotNullOrEmpty(bookSearchVO.getEndDate())) {
            url += "&endDate=" + bookSearchVO.getEndDate();
        }
        if (StringUtil.isNotNullOrEmpty(bookSearchVO.getCc())) {
            url += "&cc=" + bookSearchVO.getCc();
        }

        return url;
    }

    private double  judgeValue(Double obj){
          if(obj==null){
            return 0d;
          }
          return obj;
    }
}
