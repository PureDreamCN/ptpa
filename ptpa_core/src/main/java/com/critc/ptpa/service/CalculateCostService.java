/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * what:  成本计算Service <br/>
 *
 * @author 杨超凡 created on 2017/12/11
 */
@Service
public class CalculateCostService {
    @Autowired
    private ResourceFactory resourceFactory;
    @Autowired
    private TrainService trainService;

    public CostResource constantCostObj(int trainId) {
        CostResource costResource = resourceFactory.getInsCostResource(trainId);
        List<CalculateCost> calculateCosts = new ArrayList<>();
        calculateCosts.add(new LineCostImp(costResource));
        calculateCosts.add(new TractionCostImp(costResource));
        if(Integer.parseInt(trainService.getTrainById(trainId).getTrainLevelCode())<=3) {
            calculateCosts.add(new TractionceCostImp(costResource));
        }
        calculateCosts.add(new HumanCostImp(costResource));
//        calculateCosts.add(new PartCostImp(costResource));
        calculateCosts.add(new VehicleCostImp(costResource));
        calculateCosts.add(new ServiceCostImp(costResource));
        Iterator<CalculateCost> it = calculateCosts.iterator();
        while (it.hasNext()) {
            CalculateCost calculateCost = it.next();
            new Thread(new Runnable() {
                @Override
                public void run() {
                    calculateCost.cost();
                }
            }).start();
        }
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        costResource.setTractionCost((costResource.getTractionCost()/10000)*trainService.getTrainById(trainId).getDs());
        costResource.setPartCost(trainService.getTrainById(trainId).getPartPrice()*costResource.getTotalMileage());
        return costResource;
    }

    public double constantCost(int trainId) {
        CostResource costResource = constantCostObj(trainId);
        return costResource.getDeperciationCost()+
                costResource.getHumanCost()+
                costResource.getLineCost()+
                costResource.getPartCost()+
                costResource.getServiceCost()+
                costResource.getTractionceCost()+
                costResource.getTractionCost()+
                costResource.getMaintainAdvanceCost()+
                costResource.getMaintainNormalCost();
    }
}
