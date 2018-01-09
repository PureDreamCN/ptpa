/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Core
 */
package com.critc.ptpa.model;

import java.util.List;

/**
 * what:  备品成本计算
 *
 * @author 杨超凡 created on 2017/12/5
 */
public class PartCostImp extends CalculateCost {


    public PartCostImp(CostResource costResource) {
        super(costResource);
    }

    @Override
    public void cost() {
        costResource.setPartCost(costResource.getPartPrice()*costResource.getTotalMileage());
    }
}
