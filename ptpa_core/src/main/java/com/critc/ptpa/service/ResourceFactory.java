/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.service;

import com.critc.ptpa.model.CostResource;
import com.critc.ptpa.model.TrainLine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * what:   计算资源工厂. <br/>
 *
 * @author 杨超凡 created on 2017/12/7
 */
@Service
public class ResourceFactory {
    @Autowired
    private TrainService trainService;
    @Autowired
    private TrainCeService trainCeService;
    @Autowired
    private TrainLineService trainLineService;
    @Autowired
    private TrainTractionService trainTractionService;
    @Autowired
    private TrainHumanResourceService trainHumanResourceService;
    @Autowired
    private TrainServiceService trainServiceService;
    @Autowired
    private TrainVehicleService trainVehicleService;

    public CostResource getInsCostResource(int trainId){
        CostResource costResource = new CostResource();
        double Mileage = 0d;
        List<TrainLine> trainLineList = trainLineService.listAll(trainId);
        for(TrainLine trainLine : trainLineList){
            Mileage += trainLine.getMileage();
        }
        costResource.setTotalMileage(Mileage);
        costResource.setTrainLineList(trainLineList);
        costResource.setTrainCeList(trainCeService.listAll(trainId));
        costResource.setTrainTractionList(trainTractionService.listAll(trainId));
        costResource.setTrainHumanResourceList(trainHumanResourceService.listAll(trainId));
        costResource.setTrainServiceList(trainServiceService.listAll(trainId));
        costResource.setPartPrice(trainService.getTrainById(trainId).getPartPrice());
        costResource.setTrainVehicleList(trainVehicleService.listAll(trainId));
        return costResource;
    }
}
