/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

import java.util.List;

/**
 * what:   车辆成本计算 <br/>
 *
 * @author 杨超凡 created on 2017/12/6
 */
public class VehicleCostImp extends CalculateCost{
    public VehicleCostImp(CostResource costResource) {
        super(costResource);
    }
    @Override
    public void cost() {
        Double maintainNormalPrice = 0d;
        Double maintainAdvancePrice = 0d;
        Double deperciationPrice = 0d;
        for(TrainVehicle trainVehicle :costResource.getTrainVehicleList()){
            if(trainVehicle.getMaintainNormalPrice()!=null) {
                maintainNormalPrice += trainVehicle.getMaintainNormalPrice();
            }
            if(trainVehicle.getMaintainAdvancePrice()!=null) {
                maintainAdvancePrice += trainVehicle.getMaintainAdvancePrice();
            }
            if(trainVehicle.getDeperciationPrice()!=null) {
                deperciationPrice += trainVehicle.getDeperciationPrice();
            }
        }
        costResource.setMaintainAdvanceCost(maintainAdvancePrice*costResource.getTotalMileage());
        costResource.setMaintainNormalCost(maintainNormalPrice*costResource.getTotalMileage());
        costResource.setDeperciationCost(deperciationPrice*costResource.getTotalMileage());
    }
}
