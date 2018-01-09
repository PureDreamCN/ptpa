/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

import java.util.List;

/**
 * what:  人力成本计算
 *
 * @author 杨超凡 created on 2017/12/6
 */
public class HumanCostImp extends CalculateCost{
    public HumanCostImp(CostResource costResource) {
        super(costResource);
    }
    @Override
    public void cost() {
        costResource.setHumanCost(costResource.getTotalMileage()*cost(costResource.getTrainHumanResourceList()));
    }
}
