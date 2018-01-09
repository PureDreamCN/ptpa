/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

/**
 * what:    (这里用一句话描述这个类的作用). <br/>
 *
 * @author 杨超凡 created on 2017/12/8
 */
public class ServiceCostImp extends CalculateCost {

    public ServiceCostImp(CostResource costResource) {
        super(costResource);
    }

    @Override
    public void cost() {
        costResource.setServiceCost(cost(costResource.getTrainServiceList()));
    }
}
